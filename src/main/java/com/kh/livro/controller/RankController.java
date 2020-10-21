package com.kh.livro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankController {
	
	@RequestMapping("/rank.do")
	public String rank() {
		return "rank/rank";
	}

}
