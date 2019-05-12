package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 查询当前页的信息
	 */
	@Override
	public EasyUIData<User> findAll(Pageable pageable) {
		Page<User> findAll = userDao.findAll(pageable);
		EasyUIData<User> res = new EasyUIData<>();
		res.setRows(findAll.getContent());
		res.setTotal(findAll.getTotalElements());
		return res;
	}

	/**
	 * 新增一个用户
	 */
	@Override
	public Message save(User t) {
		User newSeed = userDao.save(t);
		Message message = new Message();
		// 200-->ok   400-->false
		message.setCode(newSeed == null?400:200);
		String msg = (newSeed == null) ? "增加失败":"增加成功";
		message.setMsg(msg);
		return message; 
	}

	/**
	 * 删除一个用户
	 */
	@Override
	public Message delete(User t) {
		userDao.delete(t);
		Message message = new Message();
		message.setCode(200);
		message.setMsg("删除成功");
		return message;
	}

	/**
	 * 更新一个用户
	 */
	@Override
	public Message update(User t) {
		userDao.save(t);
		Message message = new Message();
		message.setCode(200);
		message.setMsg("更新成功");
		return message;
	}

	/**
	 * 若有username条件,则根据username提交进行分页查询,否则
	 * 进行全表分页查询
	 * @param pageRequest Easy UI前台请求参数
	 * @param username username条件,如果有的话
	 * @return 结果集
	 */
	@Override
	public EasyUIData<User> findByUsernameLike(Pageable pageable,String username) {
		Page<User> users = userDao.findByUsernameLike(pageable,username);
		EasyUIData<User> res = new EasyUIData<>();
		res.setRows(users.getContent());
		res.setTotal(users.getTotalElements());
		return res;
	}

}
