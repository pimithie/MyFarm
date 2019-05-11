package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;
import cn.jxufe.service.SeedService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/findAll")
	public EasyUIData<User> getPageData(EasyUIDataPageRequest pageRequest){
		// log
		System.out.println("pageRequest--page:"+pageRequest.getPage());
		System.out.println("pageRequest--rows:"+pageRequest.getRows());
		System.out.println("pageRequest--sort:"+pageRequest.getSort());
		System.out.println("pageRequest--order:"+pageRequest.getOrder());
		// create the content order
		Sort.Order order = null;
		order = ("asc".equals(pageRequest.getOrder())) ? new Sort.Order(Direction.ASC,pageRequest.getSort()):
														 new Sort.Order(Direction.DESC,pageRequest.getSort());
		Pageable pageable = new PageRequest(pageRequest.getPage()-1, 
											pageRequest.getRows(), 
											new Sort(order));
		// retrieve the result
		return userService.findAll(pageable);
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public Message save(User seed) {
		return userService.save(seed);
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Message delete(User seed) {
		return userService.delete(seed);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Message update(User seed) {
		return userService.update(seed);
	}
	
	@RequestMapping("/list")
	public String dataGridPage() {
		return "user/userList";
	}
	
}
