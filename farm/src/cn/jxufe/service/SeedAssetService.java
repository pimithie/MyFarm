package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.view.SeedAsset;

public interface SeedAssetService {

	public EasyUIData<SeedAsset> findByUserId(long userId);
	
}
