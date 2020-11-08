package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.RankBiz;

@Controller
public class RankController {

	@Autowired
	private RankBiz rankBiz;

	private Logger logger = LoggerFactory.getLogger(BroadcastController.class);

	@RequestMapping("/rank.do")
	public String rank(Model model) {

		model.addAttribute("rankdto", rankBiz.rank());
		model.addAttribute("supportdto", rankBiz.support());
		model.addAttribute("newdto", rankBiz.newArtist());
		
		return "rank/rank";
	}
}
