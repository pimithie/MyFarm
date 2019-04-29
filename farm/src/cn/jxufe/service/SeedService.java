package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Seed;

public interface SeedService {
	
	/**
	 * find current page seed information
	 */
	public EasyUIData<Seed> findAll(Pageable pageable);
	
	/**
	 * save the seed info
	 */
	public Message save(Seed seed);
	
	/**
	 * delete the seed info
	 */
	public Message delete(Seed seed);
	
	/**
	 * update the seed info
	 */
	public Message update(Seed seed);
	
}
