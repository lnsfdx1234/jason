package com.hzbank.activiti.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页控制器
 *
 * @author HenryYan
 */
@Controller
@RequestMapping("/main")
public class MainController {

	@RequestMapping(value = "/index")
	public String index() {
		return "/main/index-1";
	}
	
	@RequestMapping(value = "/welcome")
	public String welcome() {
		return "/main/welcome";
	}
	
	@RequestMapping(value = "/processInstanceList")
	public String processInstanceList() {
		return "/main/processInstanceList";
	}
	
	@RequestMapping(value = "/taskInstanceList")
	public String taskInstanceList() {
		return "/main/taskInstanceList";
	}
	
	@RequestMapping(value = "/historyInstanceList")
	public String historyInstanceList() {
		return "/main/historyInstanceList";
	}
	
}
