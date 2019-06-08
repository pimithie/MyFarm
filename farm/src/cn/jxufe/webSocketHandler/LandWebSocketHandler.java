package cn.jxufe.webSocketHandler;

import java.io.IOException;
import java.util.List;
import java.util.Map;
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

import cn.jxufe.entity.GrowStage;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;
import cn.jxufe.entity.UserLandState;
import cn.jxufe.service.GrowStageService;
import cn.jxufe.service.UserLandStateService;
import cn.jxufe.service.UserService;

@Component("webSocket")
public class LandWebSocketHandler extends TextWebSocketHandler{
	
	private final Logger log = LoggerFactory.getLogger(LandWebSocketHandler.class);
	
	private Map<Long,WebSocketSession> users = new ConcurrentHashMap<>();
	
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
	
	public void plant (Seed seed,int userId,int landId) {
		Timer timer = new Timer(true);
		TimerTask task = new LandMonitorTask(seed, landId, userId);
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
		
		public LandMonitorTask(Seed seed,int landId,int userId) {
			this.seed = seed;
			this.currentSeedGrowStage = growStageService.getGrowthData(seed.getSeedId());
			this.landId = landId;
			this.userId = userId;
		}

		@Override
		public void run() {
			// the quarter of current seed
			int quarter = seed.getQuarter();
			for (int i = 0;i < quarter;i++) {
				for (GrowStage growStage : currentSeedGrowStage) {
					int stageNeedTime = growStage.getStageNeedTime();
					try {
						Thread.sleep(stageNeedTime*1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					// save into db
					UserLandState landState = userLandStateService.findByUserIdAndLandId(userId, landId);
					landState.setGrowStageId(growStage.getGrowStageId());
					userLandStateService.save(landState);
					// send the response to client
					try {
						seedGrowMsgToClient(growStage);
					} catch (IOException e) {
						System.out.println("----发送新消息失败！！----");
						e.printStackTrace();
					}
				}
			}
		}

		private void seedGrowMsgToClient(GrowStage growStage) throws IOException {
			WebSocketSession webSocketSession = users.get((long)userId);
			String payload = new StringBuilder().append("{image:\"").append(seed.getSeedId()+"/"+growStage.getGrowStageId())
							.append(".png").append('\"').toString();
			WebSocketMessage<String> msg = new TextMessage(payload);
			webSocketSession.sendMessage(msg);
		}
		
	}
	

}
