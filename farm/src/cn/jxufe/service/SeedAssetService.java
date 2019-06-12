package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.PageBean;
import cn.jxufe.view.SeedAsset;

public interface SeedAssetService {

	public EasyUIData<SeedAsset> findByUserId(long userId);
	
	public PageBean<SeedAsset> findCurrentUserAsset(Pageable pageable,int currentPage,int pageSize);
	
}
