package com.kh.livro.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.livro.biz.ArtistBiz;
import com.kh.livro.dto.SupportDto;

@Controller
public class ArtistController {

	@Autowired
	private ArtistBiz artistBiz;

	@RequestMapping("/artist.do")
	public String artist(Model model, String member_id) {
		model.addAttribute("musicdto", artistBiz.selectList(member_id));
		model.addAttribute("musicnickdto", artistBiz.selectOne(member_id));
		model.addAttribute("supportdto", artistBiz.supportList(member_id));

		return "artist/artist";
	}

	// 1_2. 댓글입력 (@RestController방식으로 json전달하여 댓글입력)
	// @ResponseEntity : 데이터 + http status code
	// @ResponseBody : 객체를 json으로 (json - String)
	// @RequestBody : json을 객체로
	@RequestMapping(value = "/supportInsert.do", method = RequestMethod.POST)
	public ResponseEntity<String> insertRest(@RequestBody SupportDto dto, HttpSession session) {
		System.out.println("들어왔나?");
		System.out.println(dto.getMember_id());
		System.out.println(dto.getMember_nickname());
		System.out.println(dto.getSupport_content());

		ResponseEntity<String> entity = null;

		try {
			artistBiz.supportInsert(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 입력 처리 HTTP 상태 메시지 리턴
		return entity;
	}

	// 1_2. 댓글입력 (@RestController방식으로 json전달하여 댓글입력)
	// @ResponseEntity : 데이터 + http status code
	// @ResponseBody : 객체를 json으로 (json - String)
	// @RequestBody : json을 객체로
	@RequestMapping(value = "/supportUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<String> updateRest(@RequestBody SupportDto dto, HttpSession session) {
		System.out.println("업데이트들어왔나?");
		System.out.println(dto.getSupport_no());
		System.out.println(dto.getSupport_content());

		ResponseEntity<String> entity = null;

		try {
			artistBiz.supportUpdate(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 입력 처리 HTTP 상태 메시지 리턴
		return entity;
	}

	// 1_2. 댓글입력 (@RestController방식으로 json전달하여 댓글입력)
	// @ResponseEntity : 데이터 + http status code
	// @ResponseBody : 객체를 json으로 (json - String)
	// @RequestBody : json을 객체로
	@RequestMapping(value = "/supportDelete.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteRest(@RequestBody SupportDto dto, HttpSession session) {
		System.out.println("업데이트들어왔나?");
		System.out.println(dto.getSupport_no());
		int support_no = dto.getSupport_no();
		ResponseEntity<String> entity = null;

		try {
			artistBiz.supportDelete(support_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 입력 처리 HTTP 상태 메시지 리턴
		return entity;
	}
}
