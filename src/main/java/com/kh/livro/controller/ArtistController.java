package com.kh.livro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.ArtistBiz;
import com.kh.livro.biz.MusicBiz;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

@Controller
public class ArtistController {
	
	@Autowired
	private MusicBiz musicbiz;
	
	@RequestMapping("/artist.do")
	public String artist(Model model,String member_id) {
		
		System.out.println("아티스트컨트롤러 맴버아이디 출력 : "+member_id);
		model.addAttribute("musicdto", musicbiz.selectList(member_id));
		System.out.println("아티스트 컨트롤러 모델모델모델모델객체 : "+model);
		return "artist/artist";
	}

	
}
