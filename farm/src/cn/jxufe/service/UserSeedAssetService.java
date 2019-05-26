package cn.jxufe.service;

import cn.jxufe.entity.UserSeedAsset;

public interface UserSeedAssetService extends BasicCRUD<UserSeedAsset> {
	
	public UserSeedAsset findOne (long seedId,long userId);
	
}
