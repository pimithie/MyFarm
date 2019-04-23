package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
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

}
