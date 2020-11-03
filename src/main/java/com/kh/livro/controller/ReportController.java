package com.kh.livro.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.ReportBiz;
import com.kh.livro.dto.ReportDto;

@Controller
public class ReportController {
	
	private Logger logger = LoggerFactory.getLogger(BroadcastController.class);
	
	@Autowired
	private ReportBiz reportbiz;
	
	
	//신고하기 폼으로 이동!
	@RequestMapping("/report.do")
	public String ReportForm(Model model, String receive_id, String receive_nickname) {
		
		model.addAttribute("receive_nickname", receive_nickname);
		model.addAttribute("receive_id", receive_id);
		logger.info(receive_nickname);
		logger.info(receive_id);
		
		return "report/report_form";
	}
	
	@RequestMapping("/reportinsert.do")
	public String ReportInsert(Model model, ReportDto dto, HttpServletResponse response) {
		
		logger.info("신고 인서트를 해보자");
		model.addAttribute("ReportDto", reportbiz.reportInsert(dto));
		model.addAttribute("msg", "신고가 접수 되었습니다.");
		
		return "selfclose";
	}
	
}
