package com.kh.livro.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.livro.biz.MemberBiz;
import com.kh.livro.dto.MemberDto;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz memberBiz;
	
	@RequestMapping("/loginForm.do")
	public String login() {
		logger.info("[loginForm.do]");
		return "login/login";
	}
	
	@RequestMapping("/login.do")
	public String loginRes(MemberDto dto, Model model, HttpSession session) {
		logger.info("[login.do]");
		
		MemberDto res = memberBiz.login(dto);
		model.addAttribute("res", res);
		
		if(res != null) {
			session.setAttribute("dto", res);
			model.addAttribute("msg", "로그인 성공 ");
			model.addAttribute("url", "/");
			return "redirect";
		}else {
			model.addAttribute("msg","로그인 실패 ");
			model.addAttribute("url","login/login");
			return "redirect";
		}	
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model) {
		
		session.invalidate();
		
		model.addAttribute("msg", "로그아웃 성공");
		model.addAttribute("uri", "/");
		
		return "redirect";
	}
	
	@RequestMapping("/registForm.do")
	public String regist() {
		logger.info("[registForm.do]");
		return "regist/regist";
	}
	

	

}
