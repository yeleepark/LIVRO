package com.kh.livro.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.Soundbank;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.kh.livro.biz.MypageBIz;
import com.kh.livro.biz.ProfileBiz;
import com.kh.livro.bizImpl.ProfileBizValidator;
import com.kh.livro.dao.ProfileDao;
import com.kh.livro.dto.ProfileDto;

@Controller
public class MypageController {
	
	@Autowired
	private  MypageBIz mypageBiz;

	private Logger logger = LoggerFactory.getLogger(MypageController.class);

	//마이페이지 인덱스 : 관리자로 갈건지 일반유저로 갈건지
	@RequestMapping("/mypageIndex.do")
	public String indexPage() {
		return "mypage/mypageIndex";
	}

	//어드민 페이지로 이동
	@RequestMapping("/adminPage.do")
	public String adminPage(Model model, String member_id) {
		
		return "mypage/adminPage";
	}

	//일반유저 페이지로 이동
	@RequestMapping("/userPage.do")
	public String userPage(Model model, String member_id) {
		model.addAttribute("profiledto", mypageBiz.selectProfile(member_id));
		return "mypage/userPage";
	}

}