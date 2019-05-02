package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.LandTypeDao;
import cn.jxufe.dao.SeedTypeDao;
import cn.jxufe.entity.LandType;
import cn.jxufe.entity.SeedType;
import cn.jxufe.service.LandTypeService;
import cn.jxufe.service.SeedTypeService;

@Service
public class SeedTypeServiceImpl implements SeedTypeService {

	@Autowired
	private SeedTypeDao seedTypeDao;
	
	@Override
	public Message findAll() {
		List<SeedType> resultList = seedTypeDao.findAll();
		Message message = new Message();
		message.setCode(1);
		message.setData(resultList);
		message.setMsg("find all seed type success!");
		return message;
	}

}
