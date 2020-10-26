package com.kh.livro.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.livro.biz.MemberBiz;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.utils.LoginGoogleBO;
import com.kh.livro.utils.LoginNaverBO;
import com.kh.livro.utils.PwSHA256;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private LoginNaverBO loginnaverBO;

	@Autowired
	private LoginGoogleBO logingoogleBO;
	private String apiResult = null;

	@Autowired
	private void setLoginNaverBO(LoginNaverBO loginNaverBO) {
		this.loginnaverBO = loginNaverBO;
	}

	@Autowired
	private void setLoginGooleBO(LoginGoogleBO loginGoogleBO) {
		this.logingoogleBO = loginGoogleBO;
	}

	@RequestMapping("/loginForm.do")
	public String login(Model model, HttpSession session) {
		logger.info("[loginForm.do]");

		String naverAuthUrl = loginnaverBO.getAuthorizationUrl(session);
		logger.info("네이버 : " + naverAuthUrl);

		String googleAuthUrl = logingoogleBO.getAuthorizationUrl(session);
		logger.info("구글 : " + googleAuthUrl);

		model.addAttribute("naver", naverAuthUrl);
		model.addAttribute("google", googleAuthUrl);

		return "login/login";
	}


	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> login(@RequestBody MemberDto dto, HttpSession session, Model model) {
		logger.info("[login.do]");

		String encryPassword = dto.getMember_pw();
		
		//팀원들을 위한 유정이의 보너스 기술
		if(dto.getMember_pw().length() > 15) {
			// 입력받은 비밀번호 암호화
			encryPassword = PwSHA256.encrypt(dto.getMember_pw());
			dto.setMember_pw(encryPassword);
		}
		MemberDto res = memberBiz.selectOne(dto);
		logger.info("[res]" + res);
		
		
		boolean check = false;
		//입력받은 값이 있다면
		if (res != null) {
			// 입력받은 비밀번호를 암호화하고 디비에 있는 암호화 된 비밀번호 비교
			if (encryPassword.equals(res.getMember_pw())) {
				session.setAttribute("logindto", res);
				check = true;
			}
		}

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);

		return map;

	}

	@RequestMapping(value = "/success.do")
	public String success(MemberDto dto, HttpSession session, Model model) {
		logger.info("[success.do]");
		model.addAttribute("msg", "환영합니다" + " " +dto.getMember_name() + "님!");
		model.addAttribute("url", "/");
		return "redirect";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model) {

		session.invalidate();

		model.addAttribute("msg", "성공적으로 로그아웃하였습니다.");
		model.addAttribute("uri", "/");

		return "redirect";
	}

	@RequestMapping("/registForm.do")
	public String regist() {
		logger.info("[registForm.do]");
		return "regist/regist";
	}

	@RequestMapping("/join.do")
	public String registRes(MemberDto dto, Model model, String member_addr1, String member_addr2, String member_addr3) {
		logger.info("[join.do]");
		// 주소 db에 넣어주기
		String member_addr = member_addr1 + " " + member_addr2 + " " + member_addr3;
		dto.setMember_addr(member_addr);

		logger.info("[암호화 안된 패스워드 :]" + dto.getMember_pw());
		logger.info("[암호화 안된 패스워드 체크 :]" + dto.getMember_pwchk());

		// 비밀번호 암호화
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

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	public int idChk(MemberDto dto) {
		int res = 0;
		res = memberBiz.idChk(dto);

		return res;
	}

	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value = "/nickChk.do", method = RequestMethod.POST)
	public int nickChk(MemberDto dto) {
		int res = 0;
		res = memberBiz.nickChk(dto);
		return res;
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String navercallback(@RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, InterruptedException, ExecutionException {

		// 로그인 사용자 정보를 읽어온다.
		OAuth2AccessToken oauthToken = loginnaverBO.getAccessToken(session, code, state);
		apiResult = loginnaverBO.getUserProfile(oauthToken);

		logger.info(" apiResult : " + apiResult);

		JsonObject object = JsonParser.parseString(apiResult).getAsJsonObject().get("response").getAsJsonObject();

		return "main/main";

	}

	@RequestMapping(value = "/gcallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String googlecallback(@RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, InterruptedException, ExecutionException {

		logger.info(">> [CONTROLLER-USERINFO] GOOGLE callback");

		OAuth2AccessToken oauthToken = logingoogleBO.getAccessToken(session, code, state);
		apiResult = logingoogleBO.getUserProfile(oauthToken);
		logger.info("* api result : " + apiResult);

		return "main/main";
	}

}
