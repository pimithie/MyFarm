package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.LandType;

public interface LandTypeService extends BasicCRUD<LandType>{
	
	public Message findAll();
	
}
