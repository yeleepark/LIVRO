package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BroadcastController {

	private Logger logger = LoggerFactory.getLogger(BroadcastController.class);
	
	@RequestMapping("/broadcast.do")
	public String broadcastList() {
		return "broadcast/broadcast_list";
	}
	

	@RequestMapping("/broadInsert.do")
	public String broadcastInsert() {
		return "broadcast/broadcast_insert";
	}
	
}
