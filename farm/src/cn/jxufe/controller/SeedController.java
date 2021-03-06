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
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Seed;
import cn.jxufe.service.SeedService;

@Controller
@RequestMapping("/seed")
public class SeedController {

	@Autowired
	private SeedService seedService;
	
	@ResponseBody
	@RequestMapping("/find")
	public EasyUIData<Seed> getPageData(EasyUIDataPageRequest pageRequest,String seedName){
		// log
		System.out.println("pageRequest--page:"+pageRequest.getPage());
		System.out.println("pageRequest--rows:"+pageRequest.getRows());
		System.out.println("pageRequest--sort:"+pageRequest.getSort());
		System.out.println("pageRequest--order:"+pageRequest.getOrder());
		// create the content order
		Sort.Order order = null;
		order = ("asc".equals(pageRequest.getOrder())) ? new Sort.Order(Direction.ASC,pageRequest.getSort()):
														 new Sort.Order(Direction.DESC,pageRequest.getSort());
		Pageable pageable = new PageRequest(pageRequest.getPage()-1, 
											pageRequest.getRows(), 
											new Sort(order));
		// retrieve the result
		if (null == seedName || "".equals(seedName)) {
			return seedService.findAll(pageable);
		}
		return seedService.findBySeedNameLike(pageable, seedName);
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public Message save(Seed seed) {
		return seedService.save(seed);
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Message delete(Seed seed) {
		return seedService.delete(seed);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Message update(Seed seed) {
		Seed preSeed = seedService.getSeedById(seed.getId());
		seed.setSeedImage(preSeed.getSeedImage());
		return seedService.update(seed);
	}
	
	@RequestMapping("/grid")
	public String dataGridPage() {
		return "seed/grid";
	}
	
}
