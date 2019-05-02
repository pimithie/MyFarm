package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.service.LandTypeService;
import cn.jxufe.service.SeedTypeService;

@Controller
@RequestMapping("/landType")
public class LandTypeController {
	
	@Autowired
	private LandTypeService landTypeService;

	@ResponseBody
	@RequestMapping("/findAll")
	public Message findAll() {
		return landTypeService.findAll();
	}
	
}
