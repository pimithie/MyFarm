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
//		for (int i = 0;i<10;i++) {
//			User user = new User();
//			user.setCurrentLevel(20);
//			user.setHeadPic("/a/b.jpg");
//			user.setMoney(20000L);
//			user.setPassword("123456");
//			user.setUsername("下棋"+i);
//			user.setPoint(1200);
//			user.setUserExp(13000);
//			user.setVipLevel(10);
//			userDao.save(user);
//		}
		
		// test update
		User user = userDao.findOne(1L);
		user.setVipLevel(100);
		userDao.save(user);
		
		// test find
//		User user = userDao.findOne(2L);
//		System.out.println(user);
		
		// test delete
//		User user  = new User();
//		user.setId(2l);
//		userDao.delete(user);
	}
	
	@Autowired
	private SeedDao seedDao;
	
	@Test
	@Rollback(false)
	public void testSeedDao() throws Exception {
		
		// test insert
		for (int i = 0;i<10;i++) {
			Seed seed = new Seed();
			seed.setSeedId(i+1);
			seed.setSeedLevel(10);
			seed.setHarvestExp(20);
			seed.setHarvestNum(5);
			seed.setLandType("金土地");
			seed.setPointPerQuarter(20);
			seed.setProfitPerFruit(3);
			seed.setQuarter(2);
			seed.setSeedName("种子"+(i+1));
			seed.setSeedPrice(1);
			seed.setSeedType("普通");
			seed.setTimePerQuarter(60);
			seed.setTips("利润高的种子");
			seedDao.save(seed);
		}
		
		// test update
//		User user = userDao.findOne(1L);
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
