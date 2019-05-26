package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.UserSeedAsset;

@Repository
public interface UserSeedAssetDao extends JpaRepository<UserSeedAsset, Long>{
	
	public UserSeedAsset findByUserIdAndSeedId (long userId,long seedId);
	
}
