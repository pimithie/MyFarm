package cn.jxufe.service;

import java.util.List;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.GrowStage;

public interface GrowStageService extends BasicCRUD<GrowStage>{
	
	public Message findAll();
	
	public List<GrowStage> getGrowthData(int seedId);
	
	public Message getNextImage(Integer seedId);
	
	public GrowStage findBySeedIdAndGrowStageId (int seedId,int growStageId);
}
