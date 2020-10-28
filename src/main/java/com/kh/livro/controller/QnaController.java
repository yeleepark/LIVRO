package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.QnaBiz;
import com.kh.livro.dto.QnaDto;

@Controller
public class QnaController {
	private Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	
	@Autowired
	private QnaBiz qnaBiz;

	// 문의게시판 리스트
	@RequestMapping("/qnalist.do")
	public String qnaList(Model model) {
		logger.info("[qnalist.do]");
		
		model.addAttribute("qnalist", qnaBiz.selectList());
		return "qna/qnaList";
	}
	
	
	//문의게시판 글쓰기 눌렀을 때 폼으로 이동
	@RequestMapping("/qnainsertform.do")
	public String qnaInsertForm() {
		logger.info("[qnainsertform.do]");
		
		return "qna/qnaInsertForm";
	}
	
	
	//문의게시판 글 등록 눌렀을 때 insert
	@RequestMapping("/qnainsert.do")
	public String qnaInsert(QnaDto dto, Model model) {
		logger.info("[qnainsert.do]");
		
		model.addAttribute("res", qnaBiz.insert(dto));
		
		return "redirect:qnalist.do";
	}
	
	//문의게시판 리스트에서 제목 눌렀을 때 detail 로 이동
	@RequestMapping("/qnadetail.do")
	public String qnaDetail(int qna_no, Model model) {
		logger.info("[qnadetail.do]");
		
		model.addAttribute("qnadetaildto", qnaBiz.selectOne(qna_no));
		
		return "qna/qnaDetail";
	}
	
	//문의게시판 수정눌렀을 때 폼으로 이동
	@RequestMapping("/qnaupdateform.do")
	public String qnaUpdateForm(int qna_no, Model model) {
		model.addAttribute("qnaupdatedto", qnaBiz.selectOne(qna_no));
		
		return "qna/qnaUpdateForm";
	}
	
	//수정완료 후 수정버튼
	@RequestMapping("/qnaupdate.do")
	public String qnaUpdate(QnaDto dto, Model model) {
		model.addAttribute("qnaupdatedto", qnaBiz.update(dto));
		
		
		
		return "redirect:qnalist.do";
	}
	
	
	//문의게시판 글상세에서 삭제버튼
	@RequestMapping("/qnadelete.do")
	public String qnaDelete(int qna_no, Model model) {
		logger.info("[qnadelete.do]");
		model.addAttribute("qnadeldto", qnaBiz.delete(qna_no));
		
		return "redirect:qnalist.do";
	}
}
