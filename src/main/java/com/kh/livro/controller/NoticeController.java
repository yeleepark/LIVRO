package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.NoticeBiz;
import com.kh.livro.dto.NoticeDto;

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
	
	@RequestMapping(value="detail.do")
	public String noticeDetail(int notice_no, Model model) {
		logger.info("go noticeOne");
		
		model.addAttribute("dto", noticeBiz.selectOne(notice_no));
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping(value="insert.do")
	public String noticeInsert() {
		logger.info("go insertform"); 
		return "notice/noticeInsert";
	}
	
	@RequestMapping(value="insertres.do")
	public String noticeInsertRes(NoticeDto dto, Model model) {
		logger.info("do insert");
		
		model.addAttribute("res", noticeBiz.insert(dto));
		
		return "redirect:notice.do";
	}
	
	@RequestMapping(value="update.do")
	public String noticeUpdate(int notice_no, Model model) {
		model.addAttribute("dto", noticeBiz.selectOne(notice_no));
		return "notice/noticeUpdate";
	}
	
	@RequestMapping(value="updateres.do")
	public String noticeUpdateRes(NoticeDto dto, Model model) {
		
		model.addAttribute("res", noticeBiz.update(dto));
		
		return "redirect:detail.do?notice_no="+dto.getNotice_no();
	}
	
	@RequestMapping(value="delete.do")
	public String noticeDelete(int notice_no, Model model) {
		
		model.addAttribute("res", noticeBiz.delete(notice_no));
		return "redirect:notice.do";
	}
}
