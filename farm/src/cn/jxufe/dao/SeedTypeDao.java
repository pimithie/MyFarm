package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.SeedType;

@Repository
public interface SeedTypeDao extends JpaRepository<SeedType, Long>{

}
