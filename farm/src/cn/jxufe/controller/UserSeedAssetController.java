package cn.jxufe.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.bean.PageBean;
import cn.jxufe.dao.SeedAssetDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;
import cn.jxufe.entity.UserSeedAsset;
import cn.jxufe.service.SeedAssetService;
import cn.jxufe.service.UserSeedAssetService;
import cn.jxufe.service.UserService;
import cn.jxufe.view.SeedAsset;

@Controller
@RequestMapping("/userSeedAsset")
public class UserSeedAssetController {
	
	/**
	 * UserService接口,用于修改用户金币等信息
	 */
	@Autowired
	private UserService userService;
	
	/**
	 * UserSeedAssetService用于更新用户的种子树
	 */
	@Autowired
	private UserSeedAssetService userSeedAssetService;
	
	/**
	 * SeedAssetService用于查询视图
	 */
	/*view service*/
	@Autowired
	private SeedAssetService seedAssetService;
	
	/**
	 * 查询当前用户的资产信息
	 */
	@ResponseBody
	@RequestMapping("/findAll")
	public EasyUIData<SeedAsset> getPageData(HttpSession session) {
		User currentUser = (User) session.getAttribute("currentUser");
		return seedAssetService.findByUserId(currentUser.getId());
	}
	
	@ResponseBody
	@RequestMapping("/findCurrentUserAsset")
	public PageBean<SeedAsset> findCurrentUserAsset(EasyUIDataPageRequest pageRequest){
		// create the content order
		Sort.Order order = null;
		order = ("asc".equals(pageRequest.getOrder())) ? new Sort.Order(Direction.ASC,pageRequest.getSort()):
									new Sort.Order(Direction.DESC,pageRequest.getSort());
		Pageable pageable = new PageRequest(pageRequest.getPage()-1, 
											pageRequest.getRows(), 
											new Sort(order));
		return seedAssetService.findCurrentUserAsset(pageable,pageRequest.getPage(),pageRequest.getRows());
	}
	
	/**
	 * 进行种子的购买
	 */
	@ResponseBody
	@RequestMapping("/buy")
	@Transactional
	public Message buy(int seedId,int seedPrice,HttpSession session) {
		User currentUser = (User) session.getAttribute("currentUser");
		Message msg = new Message();
		if (currentUser.getMoney() < seedPrice) {
			msg.setCode(400);
			msg.setMsg("金币不足，无法购买！");
			return msg;
		}
		currentUser.setMoney(currentUser.getMoney()-seedPrice);
		// update account
		userService.update(currentUser);
		// update the asset
		UserSeedAsset res = userSeedAssetService.findOne(seedId, currentUser.getId());
		// not exist
		if (null == res) {
			UserSeedAsset usa = new UserSeedAsset();
			usa.setSeedId(seedId);
			usa.setUserId((int)currentUser.getId());
			usa.setCountOfSeed(1);
			userSeedAssetService.save(usa);
		} else {
			res.setCountOfSeed(res.getCountOfSeed()+1);
			userSeedAssetService.save(res);
		}
		msg.setCode(200);
		msg.setData(currentUser);
		msg.setMsg("购买成功!");
		return msg;
	}
	

}
