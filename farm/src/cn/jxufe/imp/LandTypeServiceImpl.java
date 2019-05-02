package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.LandTypeDao;
import cn.jxufe.entity.LandType;
import cn.jxufe.service.LandTypeService;

@Service
public class LandTypeServiceImpl implements LandTypeService {

	@Autowired
	private LandTypeDao landTypeDao;
	
	@Override
	public Message findAll() {
		List<LandType> resultList = landTypeDao.findAll();
		Message message = new Message();
		message.setCode(1);
		message.setData(resultList);
		message.setMsg("find all land type success!");
		return message;
	}

}
