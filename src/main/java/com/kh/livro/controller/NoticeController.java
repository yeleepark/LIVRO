package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.NoticeBiz;

@Controller
public class NoticeController {

	@Autowired
	private NoticeBiz noticeBiz;
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="notice.do")
	public String noticeList(Model model) {
		logger.info("go noticeList");
		
		model.addAttribute("list", noticeBiz.selectList());
		
		return "notice/notice";
	}
}
