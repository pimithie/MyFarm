package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserSeedAssetDao;
import cn.jxufe.entity.UserSeedAsset;
import cn.jxufe.service.UserSeedAssetService;

@Service
public class UserSeedAssetServiceImpl implements UserSeedAssetService {
	
	@Autowired
	private UserSeedAssetDao userSeedAssetDao;
	
	@Override
	public EasyUIData<UserSeedAsset> findAll(Pageable pageable) {
		Page<UserSeedAsset> page = userSeedAssetDao.findAll(pageable);
		EasyUIData<UserSeedAsset> result = new EasyUIData<>();
		result.setTotal(page.getTotalElements());
		result.setRows(page.getContent());
		return result;
	}

	@Override
	public Message save(UserSeedAsset t) {
		userSeedAssetDao.save(t);
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("新增成功!");
		msg.setData(t);
		return msg;
	}

	@Override
	public Message delete(UserSeedAsset t) {
		userSeedAssetDao.delete(t);
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("删除成功!");
		msg.setData(t);
		return msg;
	}

	@Override
	public Message update(UserSeedAsset t) {
		userSeedAssetDao.saveAndFlush(t);
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("更新成功!");
		msg.setData(t);
		return msg;
	}

	@Override
	public UserSeedAsset findOne(long seedId, long userId) {
		return userSeedAssetDao.findByUserIdAndSeedId(userId, seedId);
	}

}
