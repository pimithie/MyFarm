package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.User;

/**
 * User实体dao层
 */
@Repository
public interface UserDao extends JpaRepository<User, Long>{
	
	/**
	 * 若有username条件,则根据username提交进行分页查询,否则
	 * 进行全表分页查询
	 * @param pageRequest Easy UI前台请求参数
	 * @param username username条件,如果有的话
	 * @return 结果集
	 */
	public Page<User> findByUsernameLike(Pageable pageable,String username);
}
