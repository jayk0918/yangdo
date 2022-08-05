package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JiwoongController {
	
	@RequestMapping(value="/main", method={RequestMethod.GET, RequestMethod.POST})
	public String mainList() {
		
		System.out.println("jiwoongController>mainList");
		
		return "/mainList/mainLists";
	}
	
}
