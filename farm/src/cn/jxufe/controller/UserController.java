package cn.jxufe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;
import cn.jxufe.service.SeedService;
import cn.jxufe.service.UserService;
import cn.jxufe.vo.LoginInfo;

@Controller
@RequestMapping("/user")
/**
 * 用户实体访问接口
 */
public class UserController {

	@Autowired
	private UserService userService;
	
	
	/**
	 * 若有username条件,则根据username提交进行分页查询,否则
	 * 进行全表分页查询
	 * @param pageRequest Easy UI前台请求参数
	 * @param username username条件,如果有的话
	 * @return 结果集
	 */
	@ResponseBody
	@RequestMapping("/findAll")
	public EasyUIData<User> getPageData(EasyUIDataPageRequest pageRequest,String username){
		// no condition
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
		if (null == username || "".equals(username)) {
			return userService.findAll(pageable);
		} else {
			// condition query
			return userService.findByUsernameLike(pageable,"%"+username+"%");
		}
	}
	
	/**
	 * 新增一个用户
	 * @param user
	 * @return 响应消息
	 */
	@ResponseBody
	@RequestMapping("/save")
	public Message save(User user) {
		return userService.save(user);
	}
	
	/**
	 * 删除一个用户
	 * @param user
	 * @return 响应消息
	 */
	@ResponseBody
	@RequestMapping("/delete")
	public Message delete(User seed) {
		return userService.delete(seed);
	}
	
	/**
	 * 更新一个用户
	 * @param user
	 * @return 响应消息
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Message update(User seed) {
		return userService.update(seed);
	}
	
	/**
	 * 试图接口,获取对应的jsp文件
	 */
	@RequestMapping("/list")
	public String dataGridPage() {
		return "user/userList";
	}
	
	/**
	 * 用户头像文件上传接口
	 * @return 响应消息
	 */
	@ResponseBody
	@RequestMapping("/fileUpLoad")
	public Message upload(@RequestParam("headPic") MultipartFile file,HttpServletRequest request) {
		Message mes = new Message();
		if (null == file) {
			mes.setCode(400);
			mes.setMsg("no images upload!");
			return mes;
		}
		String filename = file.getOriginalFilename();
		System.out.println("file name--->"+filename);
		String realPath = request.getServletContext().getRealPath("/");
		System.out.println("web real path:"+realPath);
		String filePath = realPath+"images/upload/"+filename;
		System.out.println("file path--->"+filePath);
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mes.setCode(200);
		mes.setMsg("上传成功!");
		mes.setData(filename);
		return mes;
	}
	
	@ResponseBody
	@RequestMapping("/retrieveLoginInfo")
	/**
	 * 获得所有的用户信息
	 */
	public List<LoginInfo> retrieveLoginInfo () {
		return userService.retrieveLoginInfo();
	}
	
	@ResponseBody
	@RequestMapping("/login")
	/**
	 * 进行用户登录，将User保存到session中
	 */
	public Message login (long userId,HttpServletRequest request) {
		System.out.println("userId--->"+userId);
		User user = userService.findUserById(userId);
		HttpSession session = request.getSession();
		session.setAttribute("currentUser", user);
		Message mes = new Message();
		mes.setCode(200);
		mes.setMsg("登录成功!");
		mes.setData(user);
		return mes;
	}
	
}
