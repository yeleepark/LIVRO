package com.kh.livro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.livro.biz.MusicBiz;

@Controller
public class MusicController {

	@Autowired
	private MusicBiz musicBiz;
	
	
}
