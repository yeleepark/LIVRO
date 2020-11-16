package com.kh.livro.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.livro.biz.BroadcastBiz;
import com.kh.livro.dto.BroadcastDto;

@Controller
public class BroadcastController {

	private Logger logger = LoggerFactory.getLogger(BroadcastController.class);

	@Autowired
	private BroadcastBiz broadcastBiz;

	@RequestMapping("/broadcast.do")
	public String broadcastList(Model model) {
		List<BroadcastDto> list = broadcastBiz.selectList();
		model.addAttribute("list", list);
		return "broadcast/broadcast_list";
	}

	@RequestMapping("/broadDetail.do")
	public String broadcastDetail(Model model, int broadcast_no) {
		BroadcastDto dto = broadcastBiz.selectOne(broadcast_no);
		model.addAttribute("broadDto", dto);
		return "broadcast/broadcast_detail";
	}

	// broadcastlist에서 방송하기 form으로 이동
	@RequestMapping("/live.do")
	public String broadcastLive(String member_id, Model model) {
		BroadcastDto dto = broadcastBiz.profile(member_id);
		model.addAttribute("profiledto", dto);

		return "broadcast/broadcast_live";
	}

	// broadcast_live.jsp에서 insert시킴!!
	@RequestMapping("/liveinsert.do")
	public String liveinsert(Model model, HttpServletRequest request, HttpServletResponse response, String member_id,
			String broadcast_title, String broadcast_content, String broadcast_category, String member_nickname) {
		logger.info("인서트해라");
		logger.info(member_id + broadcast_title);
		BroadcastDto dto = new BroadcastDto(member_id, broadcast_title, broadcast_content, broadcast_category,
				member_nickname);
		BroadcastDto dto2 = broadcastBiz.profile(member_id);
		model.addAttribute("profile", dto2);
		model.addAttribute("livedto", broadcastBiz.broadInsert(dto));
		return "broadcast/broadcast_live";
	}

	// flag update -> 방종
	@RequestMapping("/close.do")
	public String liveclose(Model model, BroadcastDto dto) {
		logger.info("방종 컨트롤러 들어왔냐?");
		model.addAttribute("updatedto", broadcastBiz.broadCastClose(dto));

		return "redirect:broadcast.do";
	}
	
	@RequestMapping("/closeAjax.do")
	public void livecloseAjax(Model model, BroadcastDto dto) {

		
		broadcastBiz.broadCastClose(dto);
		
	}

	// 스크롤 페이징
	
	@RequestMapping("/infinitescroll.do")
	@ResponseBody
	public Object getBroadcastList(int lastnum) {
		logger.info("getBroadcastList");
		
		//int lastnumber = Integer.parseInt(lastnum);
		
		System.out.println(lastnum);
		
		List<BroadcastDto> list = broadcastBiz.nextList(lastnum);
		
		return list;
		
	}



}
