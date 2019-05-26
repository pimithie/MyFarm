package cn.jxufe.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.dao.SeedAssetDao;
import cn.jxufe.entity.UserSeedAsset;
import cn.jxufe.service.SeedAssetService;
import cn.jxufe.service.UserSeedAssetService;
import cn.jxufe.view.SeedAsset;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@WebAppConfiguration
public class ServiceTest {
	
	@Autowired
	private SeedAssetDao dao;
	
	@Test
	public void test() {
		List<SeedAsset> findByUserid = dao.findByUserId(1L);
		System.out.println();
	}
	
}
