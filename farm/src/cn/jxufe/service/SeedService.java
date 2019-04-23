package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.Seed;

public interface SeedService {
	
	public EasyUIData<Seed> findAll(Pageable pageable);
	
}
