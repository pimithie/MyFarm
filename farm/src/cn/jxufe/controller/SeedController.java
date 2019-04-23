package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.entity.Seed;
import cn.jxufe.service.SeedService;

@Controller
@RequestMapping("/seed")
public class SeedController {

	@Autowired
	private SeedService seedService;
	
	
	@ResponseBody
	@RequestMapping("/gridData")
	public EasyUIData<Seed> getPageData(@RequestBody EasyUIDataPageRequest pageRequest){
		// log
		System.out.println("pageRequest--currentPage:"+pageRequest.getCurrentPage());
		System.out.println("pageRequest--pageSize:"+pageRequest.getPageSize());
		System.out.println("pageRequest--sort:"+pageRequest.getSort());
		System.out.println("pageRequest--order:"+pageRequest.getOrder());
		// create the content order
		Sort.Order order = null;
		order = ("asc".equals(pageRequest.getOrder())) ? new Sort.Order(Direction.ASC,pageRequest.getSort()):
														 new Sort.Order(Direction.DESC,pageRequest.getSort());
		Pageable pageable = new PageRequest(pageRequest.getCurrentPage()-1, 
											pageRequest.getPageSize(), 
											new Sort(order));
		// retrieve the result
		return seedService.findAll(pageable);
	}
	
	
}
