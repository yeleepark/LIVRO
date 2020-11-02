package com.kh.livro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.RankBiz;

@Controller
public class FollowController {

	@Autowired
	private RankBiz followBiz;
	
	@RequestMapping("/rank.do")
	public String rank(Model model) {
		model.addAttribute("rankdto",followBiz.rank());
		return "rank/rank";
	}
}
