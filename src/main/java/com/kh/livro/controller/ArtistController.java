package com.kh.livro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArtistController {
	
	@RequestMapping("/artist.do")
	public String artist() {
		return "artist/artist";
	}

}
