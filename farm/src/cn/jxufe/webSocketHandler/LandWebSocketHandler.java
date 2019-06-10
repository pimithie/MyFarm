package cn.jxufe.webSocketHandler;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.GrowStage;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;
import cn.jxufe.entity.UserLandState;
import cn.jxufe.service.GrowStageService;
import cn.jxufe.service.UserLandStateService;
import cn.jxufe.service.UserService;
import net.sf.json.JSONObject;

@Component("webSocket")
public class LandWebSocketHandler extends TextWebSocketHandler{
	
	private final Logger log = LoggerFactory.getLogger(LandWebSocketHandler.class);
	
	private static Map<Long,WebSocketSession> users = new ConcurrentHashMap<>();
	
	private Map<UserIdAndLandId,LandMonitorTask> tasks = new ConcurrentHashMap<>();
	
	@Autowired
	private UserLandStateService userLandStateService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GrowStageService growStageService;
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		User user = (User) session.getHandshakeAttributes().get("currentUser");
		System.out.println(user);
		users.remove(user.getId());
		log.info("user:"+user.getUsername()+" has been exitted!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		User user = (User) session.getHandshakeAttributes().get("currentUser");
		System.out.println(user);
		users.put(user.getId(), session);
		log.info("user:"+user.getUsername()+" has been loginned!");
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		Object payload = message.getPayload();
		System.out.println("payload class:"+payload.getClass().getName());
		System.out.println(payload);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		User user = (User) session.getHandshakeAttributes().get("currentUser");
		users.remove(user.getId());
		log.info("user:"+user.getUsername()+" Error!");
	}
	
	public String getMatureTime(int userId,int landId) {
		return tasks.get(new UserIdAndLandId(userId, landId)).matureTime;
	}
	
	public void plant (Seed seed,int userId,int landId,String matureTime) {
		Timer timer = new Timer(true);
		LandMonitorTask task = new LandMonitorTask(seed, landId, userId,matureTime);
		tasks.put(new UserIdAndLandId(userId, landId), task);
		timer.schedule(task, 0);
	}
	
	private class LandMonitorTask extends TimerTask {
		
		/*
		 * 哪个种子
		 */
		private Seed seed;
		
		/*
		 * 当前种子的成长阶段
		 */
		private List<GrowStage> currentSeedGrowStage;
		
		/*
		 * 当前种子所在的土地id 
		 */
		private int landId;
		
		/*
		 * 用户id
		 */
		private int userId;
		
		/*
		 * 成熟时间
		 */
		private String matureTime;
		
		/*
		 * to wait for harvest 
		 */
		private final Object harvestLock = new Object();
		private boolean hasHarvest = false;
		
		/*
		 * to wait for clean up
		 */
		private final Object waitForCleanUpLock = new Object();
		private boolean hasCleanUp = false;
		
		public LandMonitorTask(Seed seed,int landId,int userId,String matureTime) {
			this.seed = seed;
			this.currentSeedGrowStage = growStageService.getGrowthData(seed.getSeedId());
			this.landId = landId;
			this.userId = userId;
			this.matureTime = matureTime;
		}

		@Override
		public void run() {
			// the quarter of current seed
			int quarter = seed.getQuarter();
			for (int i = 0;i < quarter;i++) {
				for (int j = 0,size = currentSeedGrowStage.size();j < size;j++) {
					int stageNeedTime = currentSeedGrowStage.get(j).getStageNeedTime();
					float insectProbability = currentSeedGrowStage.get(j).getInsectProbability();
					try {
						Thread.sleep(stageNeedTime*1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					// save into db
					UserLandState landState = userLandStateService.findByUserIdAndLandId(userId, landId);
					landState.setGrowStageId(currentSeedGrowStage.get(j).getGrowStageId());
					userLandStateService.save(landState);
					// send the response to client
					try {
						seedGrowMsgToClient(currentSeedGrowStage.get(j));
					} catch (IOException e) {
						System.out.println("----发送新消息失败！！----");
						e.printStackTrace();
					}
					// check if has insect
					UserLandState landState2 = userLandStateService.findByUserIdAndLandId(userId, landId);
					if (landState2.isHasInsect()) {
						// sub two fruits
						int newFriuts;
						landState2.setFruitNum((newFriuts =landState2.getFruitNum()-2));
						landState2.setHasInsect(false);
						userLandStateService.save(landState2);
						Message message = new Message();
						message.setCode(105);
						List<Object> list = new ArrayList<>();
						list.add(newFriuts);
						list.add(landId);
						list.add(matureTime);
						list.add(seed);
						list.add(currentSeedGrowStage.get(j));
						message.setData(list);
						try {
							sendMessageToClient(message);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					if (isProduceInsect(insectProbability)) {
						new Timer(true).schedule(new TimerTask() {
							
							@Override
							public void run() {
								UserLandState landState = userLandStateService.findByUserIdAndLandId(userId, landId);
								landState.setHasInsect(true);
								userLandStateService.save(landState);
								Message msg = new Message();
								msg.setCode(104);
								msg.setData(landId);
								try {
									sendMessageToClient(msg);
								} catch (IOException e) {
									e.printStackTrace();
								}
							}
						}, 700);
					}
				}
				// wait user to harvest
				synchronized (harvestLock) {
					while (!hasHarvest) {
						try {
							harvestLock.wait();
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
					hasHarvest = false;
				}
				// 设置为枯草期
				UserLandState uls = userLandStateService.findByUserIdAndLandId(userId, landId);
				uls.setGrowStageId(6);
				userLandStateService.save(uls);
				Message message = new Message();
				message.setCode(101);
				message.setData(landId);
				try {
					sendMessageToClient(message);
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				// wait user to clean up
				synchronized (waitForCleanUpLock) {
					while (!hasCleanUp) {
						try {
							waitForCleanUpLock.wait();
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
					hasCleanUp = false;
				}
				// update information of current land
				matureTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis()+seed.getTimePerQuarter()*1000));
				// update the db for the new quarter
				// save into db
				if (i != quarter-1) {
					UserLandState landState = userLandStateService.findByUserIdAndLandId(userId, landId);
					landState.setFruitNum(seed.getHarvestNum());
					landState.setGrowStageId(0);
					userLandStateService.save(landState);
					Message msg = new Message();
					msg.setCode(102);
					List<Object> list = new ArrayList<>();
					list.add(landId);
					list.add(seed);
					list.add(matureTime);
					msg.setData(list);
					try {
						sendMessageToClient(msg);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			userLandStateService.delete(userLandStateService.findByUserIdAndLandId(userId, landId));
			Message message = new Message();
			message.setCode(103);
			message.setData(landId);
			try {
				sendMessageToClient(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		private boolean isProduceInsect(float insectProbability) {
			return Math.random() < insectProbability;
		}

		private void sendMessageToClient (Message data) throws IOException {
			WebSocketSession webSocketSession = users.get((long)userId);
			if (webSocketSession.isOpen()) {
				webSocketSession.sendMessage(new TextMessage(JSONObject.fromObject(data).toString()));
			}
		}
		
//		private void sendEndOfGrowToClient() throws IOException {
//			WebSocketSession webSocketSession = users.get((long)userId);
//			if (webSocketSession.isOpen()) {
//				Message msg = new Message();
//				msg.setCode(101);
//				msg.setData(landId);
//				webSocketSession.sendMessage(new TextMessage(JSONObject.fromObject(msg).toString()));
//			}
//		}

		private void seedGrowMsgToClient(GrowStage growStage) throws IOException {
			WebSocketSession webSocketSession = users.get((long)userId);
			if (webSocketSession.isOpen()) {
				Message msg = new Message();
				msg.setCode(200);
				List<Object> list = new ArrayList<>();
				list.add(growStage);
				list.add(landId);
				list.add(seed);
				list.add(matureTime);
				list.add(userLandStateService.findByUserIdAndLandId(userId, landId).getFruitNum());
				msg.setData(list);
				webSocketSession.sendMessage(new TextMessage(JSONObject.fromObject(msg).toString()));
//				webSocketSession.sendMessage(new TextMessage(seed.getSeedId()+"/"+growStage.getGrowStageId()+".png"));
			}
		}
		
	}
	
	public void afterHarvest(int userId,int landId) {
		LandMonitorTask landMonitorTask = tasks.get(new UserIdAndLandId(userId, landId));
		synchronized (landMonitorTask.harvestLock) {
			landMonitorTask.hasHarvest = true;
			landMonitorTask.harvestLock.notifyAll();
		}
	}
	
	public void afterCleanUp(int userId,int landId) {
		LandMonitorTask landMonitorTask = tasks.get(new UserIdAndLandId(userId, landId));
		synchronized (landMonitorTask.waitForCleanUpLock) {
			landMonitorTask.hasCleanUp = true;
			landMonitorTask.waitForCleanUpLock.notifyAll();
		}
	}
	
	private static class UserIdAndLandId {
		int userId;
		int landId;
		public UserIdAndLandId(int userId,int landId) {
			this.userId = userId;
			this.landId = landId;
		}
		
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + landId;
			result = prime * result + userId;
			return result;
		}
		
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			UserIdAndLandId other = (UserIdAndLandId) obj;
			if (landId != other.landId)
				return false;
			if (userId != other.userId)
				return false;
			return true;
		}
		
	}
	

}
