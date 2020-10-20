package com.kh.livro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/userPage.do")
	public String userPage() {
		return "mypage/userPage";
	}
	
	@RequestMapping("/adminPage.do")
	public String adminPage() {
		return "mypage/adminPage";
	}
	
	@RequestMapping("/channel.do")
	public String channelPage() {
		return "mypage/channel";
	}
}
