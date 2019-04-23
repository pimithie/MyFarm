package cn.jxufe.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.SeedDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.User;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DaoTest {
	
	@Autowired
	private UserDao userDao;
	
	@Test
	@Rollback(false)
	public void testUserDao() throws Exception {
		
		// test insert
//		User user = new User();
//		user.setCurrentLevel(20);
//		user.setHeadPic("/a/b.jpg");
//		user.setMoney(20000L);
//		user.setPassword("123456");
//		user.setUsername("下棋");
//		user.setPoint(1200);
//		user.setUserExp(13000);
//		user.setVipLevel(10);
//		userDao.save(user);
		
		// test update
//		User user = userDao.findOne(2L);
//		user.setVipLevel(100);
//		userDao.save(user);
		
		// test find
//		User user = userDao.findOne(2L);
//		System.out.println(user);
		
		// test delete
//		User user  = new User();
//		user.setId(2l);
//		userDao.delete(user);
	}
	
	
	
}
