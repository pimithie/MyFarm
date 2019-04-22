package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.GrowStage;

@Repository
public interface GrowStageDao extends JpaRepository<GrowStage, Long>{

}
