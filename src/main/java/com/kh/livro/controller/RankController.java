package com.kh.livro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.livro.biz.RankBiz;
import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;

@Controller
public class RankController {

	@Autowired
	private RankBiz followBiz;

	private Logger logger = LoggerFactory.getLogger(BroadcastController.class);

	@RequestMapping("/rank.do")
	public String rank(Model model) {

		model.addAttribute("rankdto", followBiz.rank());

		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		list = followBiz.ranktest();
		String gson = new Gson().toJson(list);
		logger.info(gson);
		model.addAttribute("list", gson);
		
		return "rank/rank";
	}
}
