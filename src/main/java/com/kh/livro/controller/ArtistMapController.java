package com.kh.livro.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.livro.biz.ArtistMapBiz;
import com.kh.livro.dto.ArtistMapDto;
import com.kh.livro.dto.MemberDto;

@Controller
public class ArtistMapController {

	private Logger logger = LoggerFactory.getLogger(ArtistMapController.class);
	
	@Autowired
	private ArtistMapBiz artistmapBiz;
	
	//아티스트 주소입력
	@RequestMapping("/artistmap.do")
	public String insertLoc(ArtistMapDto dto, Model model) {
		logger.info("[artistmap.do]");
		
		int res  = artistmapBiz.artistmapinsert(dto);
		
		if(res>0) {
			model.addAttribute("msg", "팬레터 주소지가 등록되었습니다.");
			model.addAttribute("url", "/artist.do?member_id=" + dto.getMember_id());
			
		}else {
			model.addAttribute("msg", "주소등록을 실패했습니다.");
			model.addAttribute("url", "/artist.do?member_id="+ dto.getMember_id());
		}
		
		
		return "redirect";
	}
	
	@RequestMapping("/artistmapdel.do")
	public String deleteLoc(String member_id, Model model, HttpSession session) {
		logger.info("[artistmapdel.do]");
		
		MemberDto dto = (MemberDto)session.getAttribute("logindto");

		int res = artistmapBiz.artistmapdelete(dto.getMember_id());
		
		if(res>0) {
			model.addAttribute("msg", "팬레터 주소지가 삭제되었습니다.");
			model.addAttribute("url", "/artist.do?member_id=" + dto.getMember_id());
			
		}else {
			model.addAttribute("msg", "주소삭제 실패했습니다.");
			model.addAttribute("url", "/artist.do");
		}
		
		return "redirect";
	}
	
	@RequestMapping("/artistmapupdate.do")
	@ResponseBody
	public int updateLoc(ArtistMapDto dto) {
		logger.info("[artistmapupdate.do]");
		
		int res = artistmapBiz.artistmapupdate(dto);
	
		return res;
	}
	

	
}
