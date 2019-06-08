package cn.jxufe.controller;

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
	private UserService UserService;
	
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
	public Message plant(@RequestBody UserPlantInfo userPlantInfo,HttpSession session) {
		Message msg = new Message();
		// check the land type
		Seed seed = seedService.getSeedById(userPlantInfo.getSeedId());
		System.out.println("userPlantInfo---->"+userPlantInfo);
		if (! LandTypeMapping.landTypeMapping.get(userPlantInfo.getLandType()).equals(seed.getLandType())) {
			msg.setCode(400);
			msg.setMsg("土地类型不匹配,"+seed.getSeedName()+"需要"+seed.getLandType()+"!!");
			return msg;
		}
		// 更新用户信息
		final UserSeedAsset userSeedAsset = userSeedAssetService.findOne(userPlantInfo.getSeedId(), ((User)session.getAttribute("currentUser")).getId());
		userSeedAsset.setCountOfSeed(userSeedAsset.getCountOfSeed()-1);
		// 创建UserLandState表记录
		final UserLandState record = new UserLandState();
		record.setUserId((int) ((User)session.getAttribute("currentUser")).getId());
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
		if (execute) {
			landWebSocketHandler.plant(seed, (int)((User)session.getAttribute("currentUser")).getId(), userPlantInfo.getLandId());
		}
		
		msg.setCode(200);
		msg.setMsg("播种成功！");
		UserLandInfo info = new UserLandInfo();
		info.setLandId(userPlantInfo.getLandId());
		msg.setData(info);
		return msg;
	}
	
	
}
