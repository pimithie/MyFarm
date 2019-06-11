package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.GrowStage;

@Repository
public interface GrowStageDao extends JpaRepository<GrowStage, Long>{
	
	public List<GrowStage> findBySeedId(int seedId);
	
	public GrowStage findBySeedIdAndGrowStageId (int seedId,int growStageId);
	
}
