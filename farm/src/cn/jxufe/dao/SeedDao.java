package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.Seed;

@Repository
public interface SeedDao extends JpaRepository<Seed, Long>{
	
	public Page<Seed> findBySeedNameLike(Pageable pageable,String seedName);
	
	public Seed findBySeedId(int seedId);
	
}
