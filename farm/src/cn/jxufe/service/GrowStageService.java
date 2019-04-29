package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.GrowStage;
import cn.jxufe.entity.Seed;

public interface GrowStageService {
	
	/**
	 * find current GrowStage information
	 */
	public EasyUIData<GrowStage> findAll(Pageable pageable);
	
	/**
	 * save the GrowStage info
	 */
	public Message save(GrowStage growStage);
	
	/**
	 * delete the GrowStage info
	 */
	public Message delete(GrowStage growStage);
	
	/**
	 * update the GrowStage info
	 */
	public Message update(GrowStage growStage);
	
}
