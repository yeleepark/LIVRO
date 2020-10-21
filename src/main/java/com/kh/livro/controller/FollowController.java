package com.kh.livro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FollowController {
	
	@RequestMapping("/follow.do")
	public String follow() {
		return "follow/follow";
	}

}
