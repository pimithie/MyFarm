package cn.jxufe.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.LandTypeMapping;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;
import cn.jxufe.entity.UserLandState;
import cn.jxufe.entity.UserSeedAsset;
import cn.jxufe.service.GrowStageService;
import cn.jxufe.service.SeedService;
import cn.jxufe.service.UserLandStateService;
import cn.jxufe.service.UserSeedAssetService;
import cn.jxufe.service.UserService;
import cn.jxufe.vo.UserLandInfo;
import cn.jxufe.vo.UserPlantInfo;
import cn.jxufe.webSocketHandler.LandWebSocketHandler;

@Controller
@RequestMapping("/userLand")
public class UserLandController {

	/**
	 * 修改用户积分，经验，金币等信息
	 */
	@Autowired
	private UserService userService;

	/**
	 * 修改用户种子数量信息
	 */
	@Autowired
	private UserSeedAssetService userSeedAssetService;

	/**
	 * 同步用户土地状态信息到数据库
	 */
	@Autowired
	private UserLandStateService userLandStateService;

	/**
	 * 获取相关种子的生长信息
	 */
	@Autowired
	private SeedService seedService;

	/**
	 * 向用户推送相关作物信息
	 */
	@Autowired
	private LandWebSocketHandler landWebSocketHandler;

	@Autowired
	private GrowStageService growStageService;

	@Autowired
	private TransactionTemplate transactionTemplate;

	@ResponseBody
	@RequestMapping("/plant")
	public Message plant(@RequestBody UserPlantInfo userPlantInfo, HttpSession session) {
		Message msg = new Message();
		// check the land type
		Seed seed = seedService.getSeedById(userPlantInfo.getSeedId());
		System.out.println("userPlantInfo---->" + userPlantInfo);
		if (!LandTypeMapping.landTypeMapping.get(userPlantInfo.getLandType()).equals(seed.getLandType())) {
			msg.setCode(400);
			msg.setMsg("土地类型不匹配," + seed.getSeedName() + "需要" + seed.getLandType() + "!!");
			return msg;
		}
		// 更新用户信息
		final UserSeedAsset userSeedAsset = userSeedAssetService.findOne(userPlantInfo.getSeedId(),
				((User) session.getAttribute("currentUser")).getId());
		userSeedAsset.setCountOfSeed(userSeedAsset.getCountOfSeed() - 1);
		// 创建UserLandState表记录
		final UserLandState record = new UserLandState();
		record.setUserId((int) ((User) session.getAttribute("currentUser")).getId());
		record.setSeedId(userPlantInfo.getSeedId());
		record.setLandId(userPlantInfo.getLandId());
		// from 0
		record.setGrowStageId(0);
		record.setHasInsect(false);
		record.setFruitNum(seed.getHarvestNum());
		Boolean execute = transactionTemplate.execute(new TransactionCallback<Boolean>() {

			@Override
			public Boolean doInTransaction(TransactionStatus arg0) {
				userSeedAssetService.save(userSeedAsset);
				userLandStateService.save(record);
				return true;
			}
		});
		// calculate the mature time
		Date date = new Date(System.currentTimeMillis() + seed.getTimePerQuarter() * 1000);
		String matureTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		if (execute) {
			landWebSocketHandler.plant(seed, (int) ((User) session.getAttribute("currentUser")).getId(),
					userPlantInfo.getLandId(), matureTime);
		}

		msg.setCode(200);
		msg.setMsg("播种成功！");
		UserLandInfo info = new UserLandInfo();
		info.setLandId(userPlantInfo.getLandId());
		info.setSeed(seed);
		info.setMatureTime(matureTime);
		msg.setData(info);
		return msg;
	}

	@ResponseBody
	@RequestMapping("/harvest")
	public Message harvest(int landId, HttpSession session) {
		long id = ((User) session.getAttribute("currentUser")).getId();
		System.out.println("userId--------->"+id);
		UserLandState landState = userLandStateService.findByUserIdAndLandId((int) id, landId);
		System.out.println("landState--------->"+landState);
		System.out.println("seedId--------->"+landState.getSeedId());
		Seed seed = seedService.getSeedById(landState.getSeedId());
		int fruitNum = landState.getFruitNum();
		int profitPerFruit = seed.getProfitPerFruit();
		landWebSocketHandler.afterHarvest((int) id, landId);
		User user = updateStudentInfo(id, seed.getHarvestExp(), seed.getPointPerQuarter(), fruitNum * profitPerFruit);
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("共收获" + fruitNum + "个" + seed.getSeedName() + "<br/>获得" + fruitNum * profitPerFruit + "个金币<br/>"
				+ seed.getHarvestExp() + "经验<br/>" + seed.getPointPerQuarter() + "积分!");
		msg.setData(user);
		return msg;
	}

	@ResponseBody
	@RequestMapping("/cleanUp")
	public Message cleanUp(int landId, HttpSession session) {
		long id = ((User) session.getAttribute("currentUser")).getId();
		landWebSocketHandler.afterCleanUp((int) id, landId);
		User user = updateStudentInfo(id, 1, 2, 2);
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("除去枯草<br/>经验：+1<br/>金币：+2<br/>积分：+2");
		msg.setData(user);
		return msg;
	}

	@ResponseBody
	@RequestMapping("/killInsect")
	public Message killInsect(int landId, HttpSession session) {
		// update land state
		long userId = ((User) session.getAttribute("currentUser")).getId();
		UserLandState landState = userLandStateService.findByUserIdAndLandId((int) userId, landId);
		landState.setHasInsect(false);
		userLandStateService.save(landState);
		User user = updateStudentInfo(userId, 2, 1, 1);
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("除虫成功<br/>金币：+1<br/>经验：+2<br/>积分：+1");
		msg.setData(user);
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/init")
	public Message init(HttpSession session) {
		long userId = ((User) session.getAttribute("currentUser")).getId();
		return userLandStateService.findByUserId((int)userId);
	}

	private User updateStudentInfo(long userId, long userExp, int point, long money) {
		// update user info
		User user = userService.findUserById(userId);
		user.setUserExp(user.getUserExp() + userExp);
		user.setPoint(user.getPoint() + point);
		user.setMoney(user.getMoney() + money);
		userService.save(user);
		return user;
	}

}
