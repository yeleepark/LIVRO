package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.livro.biz.QnaBiz;
import com.kh.livro.biz.QnareBiz;
import com.kh.livro.dto.QnareDto;

@Controller
public class QnareController {

	@Autowired
	private QnareBiz qnareBiz;
	
	@Autowired
	private QnaBiz qnaBiz;

	private Logger logger = LoggerFactory.getLogger(QnareController.class);

	@RequestMapping("/qnareinsert.do")
	public String qnareInsert(Model model, @RequestParam("qna_no") int qna_no, QnareDto dto) {

		logger.info("[qnareinsert.do]");

		/*
		 * System.out.println(dto.getQna_no());
		 * System.out.println(dto.getMember_nickname());
		 * System.out.println(dto.getQnare_content());
		 */
		
		model.addAttribute("dto", qnareBiz.insert(dto));
		model.addAttribute("flagdto",  qnaBiz.flagupdate(qna_no));

		model.addAttribute("msg", "답변이 등록되었습니다.");
		model.addAttribute("url", "/qnadetail.do?qna_no=" + dto.getQna_no());

		return "redirect";
	}

}
