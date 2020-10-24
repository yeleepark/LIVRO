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
	private ArtistBiz artistBiz;
	
	@RequestMapping("/channelForm.do")
	public String channelForm() {
		return "artist/channel";
	}

	
}
