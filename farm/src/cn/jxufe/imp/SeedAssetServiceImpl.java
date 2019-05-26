package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.SeedAssetDao;
import cn.jxufe.service.SeedAssetService;
import cn.jxufe.view.SeedAsset;

@Service
public class SeedAssetServiceImpl implements SeedAssetService {

	@Autowired
	private SeedAssetDao seedAssetDao;
	
	@Override
	public EasyUIData<SeedAsset> findByUserId(long userId) {
		List<SeedAsset> list = seedAssetDao.findByUserId(userId);
		EasyUIData<SeedAsset> result = new EasyUIData<>();
		result.setTotal(list.size());
		result.setRows(list);
		return result;
	}

}
