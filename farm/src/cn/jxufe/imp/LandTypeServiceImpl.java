package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.LandTypeDao;
import cn.jxufe.entity.LandType;
import cn.jxufe.service.LandTypeService;

@Service
public class LandTypeServiceImpl implements LandTypeService {

	@Autowired
	private LandTypeDao landTypeDao;

	@Override
	public EasyUIData<LandType> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message save(LandType seed) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message delete(LandType seed) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message update(LandType seed) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
