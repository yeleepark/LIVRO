package com.kh.livro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@RequestMapping("/qnalist.do")
	public String qnaList() {
		return "qna/qnalist";
	}
}
