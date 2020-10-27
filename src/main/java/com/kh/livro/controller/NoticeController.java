package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.livro.biz.NoticeBiz;
import com.kh.livro.dto.NoticeDto;
import com.kh.livro.utils.Pagination;

@Controller
public class NoticeController {

	@Autowired
	private NoticeBiz noticeBiz;
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	//https://freehoon.tistory.com/112 참조
	@RequestMapping(value="notice.do", method = RequestMethod.GET)
	public String noticeList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
										  @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		logger.info("go noticeList");
		
		//전체 게시글 개수 count
		int listCnt = noticeBiz.getBoardListCnt();
		
		//pagination 객체 생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("noticelist", noticeBiz.selectList(pagination));
		
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
	
	
	@RequestMapping(value="noticeSearch.do", method = RequestMethod.GET)
	public String selectSearchList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			  									@RequestParam(required = false, defaultValue = "1") int range,
			  									String noticeKeyword) throws Exception { 
		
		//전체 게시글 개수 count
		int listCnt = noticeBiz.getSearchListCnt(noticeKeyword);
		
		//pagination 객체 생성
		Pagination spagination = new Pagination();
		spagination.pageSearchInfo(page, range, listCnt, noticeKeyword);
		System.out.println("pagination datas = "+page+"," +range+","+ listCnt+","+ noticeKeyword );
		
		model.addAttribute("searchpagination", spagination);
		model.addAttribute("searchlist", noticeBiz.selectSearchList(spagination));
		
		return "notice/noticeSearch";
	}
}
