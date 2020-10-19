package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.MemberBiz;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz memberBiz;
	
	@RequestMapping("/loginForm.do")
	public String login() {
		logger.info("[loginForm.do]");
		return "login/login";
	}
	
	@RequestMapping("/registForm.do")
	public String regist() {
		logger.info("[registForm.do]");
		return "regist/regist";
	}

}
