package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.LandType;

@Repository
public interface LandTypeDao extends JpaRepository<LandType, Long>{

}
