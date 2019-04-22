package cn.jxufe.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.UserDao;
import cn.jxufe.entity.User;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DaoTest {
	
	@Autowired
	private UserDao userDao;
	
	@Test
	@Transactional
	public void testUserDao() throws Exception {
		// test insert
		User user = userDao.findOne(1L);
		user.setPassword("qazwsx");
		user.setMoney(2000L);
		userDao.save(user);
	}
	
}
