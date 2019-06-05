package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.SeedDao;
import cn.jxufe.entity.Seed;
import cn.jxufe.service.SeedService;

@Service
public class SeedServiceImpl implements SeedService {

	@Autowired
	private SeedDao seedDao;
	
	@Override
	public EasyUIData<Seed> findAll(Pageable pageable) {
		EasyUIData<Seed> result = new EasyUIData<>();
		Page<Seed> page = seedDao.findAll(pageable);
		System.out.println("page--Number:"+page.getNumber());
		System.out.println("page--NumberOfElements:"+page.getNumberOfElements());
		System.out.println("page--Size:"+page.getSize());
		System.out.println("page--TotalElements:"+page.getTotalElements());
		System.out.println("page--TotalPages:"+page.getTotalPages());
		System.out.println("page--Sort:"+page.getSort());
		result.setRows(page.getContent());
		result.setTotal(page.getTotalElements());
		return result;
	}

	@Override
	public Message save(Seed seed) {
		Seed newSeed = seedDao.save(seed);
		Message message = new Message();
		// 200-->ok   400-->false
		message.setCode(newSeed == null?400:200);
		String msg = (newSeed == null) ? "增加失败":"增加成功";
		message.setMsg(msg);
		return message;
	}

	@Override
	public Message delete(Seed seed) {
		seedDao.delete(seed);
		Message message = new Message();
		message.setCode(200);
		message.setMsg("删除成功");
		return message;
	}

	@Override
	public Message update(Seed seed) {
		seedDao.save(seed);
		Message message = new Message();
		message.setCode(200);
		message.setMsg("更新成功");
		return message;
	}

	@Override
	public Seed getSeedById(long id) {
		return seedDao.findOne(id);
	}

	@Override
	public EasyUIData<Seed> findBySeedNameLike(Pageable pageable, String seedName) {
		Page<Seed> page = seedDao.findBySeedNameLike(pageable, "%"+seedName+"%");
		EasyUIData<Seed> res = new EasyUIData<>();
		res.setRows(page.getContent());
		res.setTotal(page.getTotalElements());
		return res;
	}

}
