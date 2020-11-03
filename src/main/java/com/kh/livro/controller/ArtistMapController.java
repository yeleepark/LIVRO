package com.kh.livro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.livro.biz.ArtistMapBiz;
import com.kh.livro.dto.ArtistMapDto;

@Controller
public class ArtistMapController {

	private Logger logger = LoggerFactory.getLogger(ArtistMapController.class);
	
	@Autowired
	private ArtistMapBiz artistmapBiz;
	
	//아티스트 주소입력
	@RequestMapping("/artistmap.do")
	public String insertLoc(ArtistMapDto dto, String artist_addr1,String artist_addr2,String artist_addr3) {
		logger.info("[artistmap.do]");
		String artist_loc = artist_addr1 + artist_addr2 + artist_addr3;
		dto.setArtist_loc(artist_loc);
		
		
		
		
		return "";
	}
	
}
