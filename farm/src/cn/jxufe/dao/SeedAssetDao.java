package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.UserSeedAsset;
import cn.jxufe.view.SeedAsset;

@Repository
public interface SeedAssetDao extends JpaRepository<SeedAsset, Long>{
	
	public List<SeedAsset> findByUserId (long userId);
}
