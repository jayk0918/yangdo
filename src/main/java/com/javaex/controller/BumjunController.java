package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/res", method = { RequestMethod.GET, RequestMethod.POST })

//������
public class BumjunController {
	@RequestMapping(value = "/reserve", method = { RequestMethod.GET, RequestMethod.POST })
	public String reserve() {
		System.out.println("MyPageController>reserve()");

		return "/pay/reserve";
	}

//�絵������
	@RequestMapping(value = "/yangdoreserve", method = { RequestMethod.GET, RequestMethod.POST })
	public String yangdoreserve() {
		System.out.println("MyPageController>yangdoreserve()");

		return "/pay/yangdoReserve";
	}
}
