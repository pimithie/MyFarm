package cn.jxufe.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.User;
import cn.jxufe.vo.LoginInfo;

/**
 * User实体service层
 */
public interface UserService extends BasicCRUD<User>{
	
	/**
	 * 若有username条件,则根据username提交进行分页查询,否则
	 * 进行全表分页查询
	 * @param pageRequest Easy UI前台请求参数
	 * @param username username条件,如果有的话
	 * @return 结果集
	 */
	public EasyUIData<User> findByUsernameLike(Pageable pageable,String username);
	
	public List<LoginInfo> retrieveLoginInfo ();
	
	public User findUserById(long id);
}
