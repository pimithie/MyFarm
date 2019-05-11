package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Seed;

public interface BasicCRUD<T> {
	/**
	 * find current page seed information
	 */
	public EasyUIData<T> findAll(Pageable pageable);

	/**
	 * save the seed info
	 */
	public Message save(T t);

	/**
	 * delete the seed info
	 */
	public Message delete(T t);

	/**
	 * update the seed info
	 */
	public Message update(T t);
}
