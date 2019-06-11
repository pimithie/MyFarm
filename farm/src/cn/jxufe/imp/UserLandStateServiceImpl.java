package cn.jxufe.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.GrowStageDao;
import cn.jxufe.dao.SeedDao;
import cn.jxufe.dao.UserLandStateDao;
import cn.jxufe.entity.GrowStage;
import cn.jxufe.entity.UserLandState;
import cn.jxufe.service.UserLandStateService;
import cn.jxufe.vo.InitLandStateBean;
import cn.jxufe.webSocketHandler.LandWebSocketHandler;

@Service
public class UserLandStateServiceImpl implements UserLandStateService {

	@Autowired
	private UserLandStateDao userLandStateDao;
	
	@Autowired
	private GrowStageDao growStageDao;
	
	@Autowired
	private SeedDao seedDao;
	
	@Autowired
	private LandWebSocketHandler landWebSocketHandler;
	
	@Override
	public EasyUIData<UserLandState> findAll(Pageable pageable) {
		return null;
	}

	@Override
	public Message save(UserLandState t) {
		userLandStateDao.save(t);
		return null;
	}

	@Override
	public Message delete(UserLandState t) {
		userLandStateDao.delete(t);
		return null;
	}

	@Override
	public Message update(UserLandState t) {
		return null;
	}

	@Override
	public UserLandState findByUserIdAndLandId(int userId, int landId) {
		return userLandStateDao.findByUserIdAndLandId(userId, landId);
	}

	@Override
	public Message findByUserId(int userId) {
		List<UserLandState> list = userLandStateDao.findByUserId(userId);
		List<InitLandStateBean> res = new ArrayList<>();
		for (UserLandState landState : list) {
			InitLandStateBean bean = new InitLandStateBean();
			bean.setFruitNum(landState.getFruitNum());
			bean.setHasInsect(landState.isHasInsect());
			if (landState.getGrowStageId() != 0 && landState.getGrowStageId() != 6) {
				GrowStage growStage = growStageDao.findBySeedIdAndGrowStageId(landState.getSeedId(), landState.getGrowStageId());
				bean.setGrowStage(growStage);
			} else if (landState.getGrowStageId() == 0) {
				bean.setZero(true);
			} else {
				bean.setSix(true);
			}
			bean.setLandId(landState.getLandId());
			bean.setSeed(seedDao.findBySeedId(landState.getSeedId()));
			bean.setMatureTime(landWebSocketHandler.getMatureTime(userId, landState.getLandId()));
			res.add(bean);
		}
		for (InitLandStateBean initLandStateBean : res) {
			System.out.println(initLandStateBean);
		}
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("query success!");
		msg.setData(res);
		return msg;
	}

}
