 package com.kh.livro.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.BroadcastBiz;
import com.kh.livro.dto.BroadcastDto;

@Controller
public class BroadcastController {

	private Logger logger = LoggerFactory.getLogger(BroadcastController.class);
	
	@Autowired
	private BroadcastBiz broadcastBiz;
	
	@RequestMapping("/broadcast.do")
	public String broadcastList(Model model) {
		List<BroadcastDto> list = broadcastBiz.selectList();
		model.addAttribute("list",list);
		return "broadcast/broadcast_list";
	}
	
	@RequestMapping("/broadDetail.do")
	public String broadcastDetail(Model model, int broadcast_no) {
		BroadcastDto dto = broadcastBiz.selectOne(broadcast_no);
		model.addAttribute("dto", dto);
		return "broadcast/broadcast_detail";
	}

	@RequestMapping("/broadInsert.do")
	public String broadcastInsert() {
		return "broadcast/broadcast_insert";
	}
	
}
