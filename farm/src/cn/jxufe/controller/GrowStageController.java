package cn.jxufe.controller;

import java.util.List;

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
import cn.jxufe.entity.GrowStage;
import cn.jxufe.entity.GrowStageCategoryFactory;
import cn.jxufe.entity.GrowStageCategoryFactory.GrowStageCategory;
import cn.jxufe.service.GrowStageService;

@Controller
@RequestMapping("/growStage")
public class GrowStageController {

	@Autowired
	private GrowStageService growStageService;
	
	@ResponseBody
	@RequestMapping("/findAll")
	public Message findAll() {
		Message msg = new Message();
		msg.setData(GrowStageCategoryFactory.getAllGrowStageCategory());
		msg.setCode(200);
		msg.setMsg("查询成功");
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/growthData")
	public List<GrowStage> getGrowthData(int seedId) {
		return growStageService.getGrowthData(seedId);
	}
	
	@ResponseBody
	@RequestMapping("/getNextImage")
	public Message getNextImage(Integer seedId) {
		return growStageService.getNextImage(seedId);
	}
	
	
	
	@ResponseBody
	@RequestMapping("/find")
	public EasyUIData<GrowStage> getPageData(@RequestBody EasyUIDataPageRequest pageRequest){
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
		return growStageService.findAll(pageable);
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public Message save(GrowStage growStage) {
		return growStageService.save(growStage);
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Message delete(GrowStage growStage) {
		return growStageService.delete(growStage);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Message update(GrowStage growStage) {
		return growStageService.update(growStage);
	}
	
}
