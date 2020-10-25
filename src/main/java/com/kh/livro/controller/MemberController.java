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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.livro.biz.MemberBiz;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.utils.PwSHA256;

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

		if (res != null) {
			session.setAttribute("logindto", res);
			model.addAttribute("msg", "로그인 성공 ");
			model.addAttribute("url", "/");
			return "redirect";
		} else {
			model.addAttribute("msg", "로그인 실패 ");
			model.addAttribute("url", "login/login");
			return "redirect";
		}
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/login.do", method = RequestMethod.POST) public
	 * Map<String, String> login(@RequestBody MemberDto dto, HttpSession session) {
	 * //최유정 : 유정아 다시해라....싸발 logger.info("[login.do]");
	 * 
	 * MemberDto res = memberBiz.login(dto);
	 * 
	 * Map<String, Boolean> map = new HashMap<String, Boolean>();
	 * map.put("logindto", dto); return map;
	 * 
	 * }
	 */
	
	/*
	 * @ResponseBody : java 객체를 response객체의 데이터로 
	 * @RequestBody : request 객체에 담겨져서 넘어오는 데이터 -> java 객체 binding
	 */
	/*
	 * 이따 풀어! 
	 * @RequestMapping(value = "/ajaxlogin.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public Map<String, Boolean> ajaxLogin(@RequestBody MemberDto
	 * dto, HttpSession session) { logger.info("[ajaxlogin.do]");
	 * 
	 * MemberDto res = memberBiz.login(dto);
	 * 
	 * boolean check = false; if(res != null) {
	 * if(passwordEncoder.matches(dto.getMemberpw(), res.getMemberpw())) {
	 * logger.info("사용자가 전달한 memberpw : " + dto.getMemberpw() );
	 * logger.info("db에 암호화되어 저장된 memberpw : " + res.getMemberpw());
	 * session.setAttribute("login", res); check = true; }
	 * 
	 * }
	 * 
	 * Map<String,Boolean> map = new HashMap<String, Boolean>(); map.put("check",
	 * check);
	 * 
	 * return map; }
	 */
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

	@RequestMapping("/join.do")
	public String registRes(MemberDto dto, Model model, String member_addr1 , String member_addr2, String member_addr3) {
		logger.info("[join.do]");
		//주소 db에 넣어주기
		String member_addr = member_addr1 + " " + member_addr2 + " " + member_addr3;
		dto.setMember_addr(member_addr);
		
		
		  logger.info("[암호화 안된 패스워드 :]" + dto.getMember_pw()); 
		  logger.info("[암호화 안된 패스워드 체크 :]" + dto.getMember_pwchk());
		  //비밀번호 암호화 
		  String encryPassword = PwSHA256.encrypt(dto.getMember_pw());
		  String encryPassword_chk = PwSHA256.encrypt(dto.getMember_pwchk());
		  
		  dto.setMember_pw(encryPassword);
		  dto.setMember_pwchk(encryPassword_chk);
		  
		  
		  logger.info("[암호화 된 패스워드 : ]" + dto.getMember_pw());
		  logger.info("[암호화 된 패스워드 체크 :]" + dto.getMember_pwchk());
		  
		int res = memberBiz.join(dto);
		if (res > 0) {
			model.addAttribute("msg", "회원가입을 축하드립니다. 로그인해주세요!");
			model.addAttribute("url", "/loginForm.do");
			return "redirect";
		}
		model.addAttribute("msg", "회원가입에 실패하셨습니다.");
		model.addAttribute("url", "/registForm.do");
		return "redirect";

	}

	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idChk.do", method=RequestMethod.POST)
	public int idChk(MemberDto dto) {
		int res = 0;
		res = memberBiz.idChk(dto);
		
		return res;
	}
	
	//닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="/nickChk.do", method=RequestMethod.POST)
	public int nickChk(MemberDto dto) {
		int res = 0;
		res = memberBiz.nickChk(dto);
		return res;
	}

	
	
	
	
	
}
