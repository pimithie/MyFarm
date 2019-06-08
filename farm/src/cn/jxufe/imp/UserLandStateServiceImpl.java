package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserLandStateDao;
import cn.jxufe.entity.UserLandState;
import cn.jxufe.service.UserLandStateService;

@Service
public class UserLandStateServiceImpl implements UserLandStateService {

	@Autowired
	private UserLandStateDao dao;
	
	@Override
	public EasyUIData<UserLandState> findAll(Pageable pageable) {
		return null;
	}

	@Override
	public Message save(UserLandState t) {
		dao.save(t);
		return null;
	}

	@Override
	public Message delete(UserLandState t) {
		return null;
	}

	@Override
	public Message update(UserLandState t) {
		return null;
	}

	@Override
	public UserLandState findByUserIdAndLandId(int userId, int landId) {
		return dao.findByUserIdAndLandId(userId, landId);
	}

}
