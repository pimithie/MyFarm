package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.Seed;

public interface SeedService extends BasicCRUD<Seed>{
	public Seed getSeedById (long id);
	
	public EasyUIData<Seed> findBySeedNameLike (Pageable pageable,String seedName);
}
