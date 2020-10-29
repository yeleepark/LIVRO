package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.QnareBiz;
import com.kh.livro.dto.QnareDto;

@Controller
public class QnareController {
	
	@Autowired
	private QnareBiz qnareBiz;
	
	private Logger logger = LoggerFactory.getLogger(QnareController.class);
	
	@RequestMapping("/qnareply.do")
	public String qnareInsert(QnareDto dto, Model model) {
		logger.info("[qnareply.do]");
		
		
		return "";
	}

}
