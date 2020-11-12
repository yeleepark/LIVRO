package com.kh.livro;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "/main/main";
	}

	@RequestMapping("/popup.do")
	public String popup(HttpServletRequest request, HttpServletResponse response) {
		logger.info("들어와야댐");

		return "/main/livromainpopup";
	}

	@RequestMapping("/error.do")
	public String error(HttpServletRequest request, HttpServletResponse response) {

		return "error";
	}

}
