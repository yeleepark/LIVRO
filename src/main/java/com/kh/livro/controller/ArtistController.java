package com.kh.livro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.ArtistBiz;
import com.kh.livro.dto.MemberDto;

@Controller
public class ArtistController {
	
	@Autowired
	private ArtistBiz artistBiz;
	
	@RequestMapping("/artist.do")
	public String artist(Model model, String member_id) {
		
		MemberDto dto = artistBiz.selectArtist(member_id);
		model.addAttribute("artistdto", dto);
		
		return "artist/artist";
	}

	
}
