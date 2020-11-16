package com.kh.livro.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.livro.biz.ArtistBiz;
import com.kh.livro.biz.ArtistMapBiz;
import com.kh.livro.dto.CalendarDto;
import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.SupportCommDto;
import com.kh.livro.dto.SupportDto;

@Controller
public class ArtistController {

	@Autowired
	private ArtistBiz artistBiz;

	@Autowired
	private ArtistMapBiz artistmapBiz;

	private Logger logger = LoggerFactory.getLogger(ArtistController.class);

	@RequestMapping("/artist.do")
	public String artist(Model model, String member_id) {
		model.addAttribute("musicdto", artistBiz.selectList(member_id));
		model.addAttribute("memberdto", artistBiz.selectOne(member_id));
		model.addAttribute("profiledto", artistBiz.selectProfile(member_id));
		model.addAttribute("broaddto", artistBiz.broadList(member_id));
		model.addAttribute("caldto", artistBiz.calList(member_id));
		model.addAttribute("dto", artistBiz.followerList(member_id));
		model.addAttribute("mapdto", artistmapBiz.artistmapselectOne(member_id));
		model.addAttribute("countdto", artistBiz.followerCount(member_id));
		return "artist/artist";
	}

	//팔로우
	@RequestMapping(value = "/follow.do")
	@ResponseBody
	public int follow(@RequestBody FollowDto dto) {
		logger.info("팔로우 컨트롤러");

		int res = artistBiz.follow(dto);

		FollowerDto follower = new FollowerDto();
		follower.setMember_id(dto.getArtist_id());
		follower.setMember_nickname(dto.getArtist_nickname());
		follower.setFollower_id(dto.getMember_id());
		follower.setFollower_nickname(dto.getMember_nickname());

		int res2 = artistBiz.follwer(follower);

		return res + res2;
	}

	@RequestMapping(value = "/unfollow.do")
	@ResponseBody
	public int unfollow(@RequestBody FollowDto dto) {
		logger.info("언팔로우 컨트롤러");
		int res = artistBiz.unfollow(dto);
		
		FollowerDto follower = new FollowerDto();
		follower.setFollower_id(dto.getMember_id());
		follower.setMember_id(dto.getArtist_id());
		int res2 = artistBiz.unfollower(follower);

		return res + res2;
	}

	// 글 리스트 
	@RequestMapping(value = "/supportList.do")
	public String supportList(Model model, SupportDto dto) {
		logger.info("글 리스트 컨트롤러");

		model.addAttribute("supportdto", artistBiz.supportList(dto));
		model.addAttribute("commcount", artistBiz.commCount(dto.getMember_id()));
		System.out.println(dto.getMember_id());
		System.out.println("확인");

		return "artist/artistSupport";
	}

	// 내가 쓴 글 리스트 
	@RequestMapping(value = "/mylist.do", method = RequestMethod.POST)
	public String myList(Model model, @RequestBody SupportDto dto) {
		logger.info("내가 쓴 글 리스트 컨트롤러");
		System.out.println(dto.getMember_id());
		System.out.println(dto.getWriter_id());
		System.out.println("확");

		model.addAttribute("supportdto", artistBiz.myList(dto));

		return "artist/artistSupport";

	}

	// 글 입력 
	@RequestMapping(value = "/supportInsert.do", method = RequestMethod.POST)
	public ResponseEntity<String> insertRest(@RequestBody SupportDto dto, HttpSession session) {

		logger.info("[support Insert]");
		ResponseEntity<String> entity = null;

		try {
			artistBiz.supportInsert(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글수정
	@RequestMapping(value = "/supportUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public SupportDto updateRest(@RequestBody SupportDto dto) {
		logger.info("수정컨트롤러");
		try {
			artistBiz.supportUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 글삭제 
	@RequestMapping(value = "/supportDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int deleteRest(@RequestBody SupportDto dto) {

		logger.info("[support Delete]");
		int res = 0;
		try {
			res = artistBiz.supportDelete(dto.getSupport_no());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	// 댓글입력 (@RestController방식으로 json전달하여 댓글입력)
	@RequestMapping(value = "/commInsert.do", method = RequestMethod.POST)
	public ResponseEntity<String> commInsert(@RequestBody SupportCommDto dto, HttpSession session) {

		logger.info("[comm Insert]");

		ResponseEntity<String> entity = null;

		try {
			artistBiz.commInsert(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 응원 댓글 리스트
	@RequestMapping(value = "/showList.do", method = RequestMethod.POST)
	public String replyList(@RequestBody SupportCommDto dto, Model model) {
		logger.info("댓글 출력 컨트롤러");
		model.addAttribute("commdto", artistBiz.commList(dto.getSupport_no()));
		model.addAttribute("memberdto", artistBiz.selectOne(dto.getMember_id()));
		return "artist/artistReply";
	}

	// 응원 댓글 삭제
	@RequestMapping(value = "/commDelete.do", method = RequestMethod.POST)
	public ResponseEntity<String> replyDelete(@RequestParam int comm_no) {
		logger.info("댓글삭제 컨트롤러");
		ResponseEntity<String> entity = null;
		try {
			artistBiz.commDelete(comm_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 응원 댓글 업데이트
	@RequestMapping(value = "/commUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<String> replyUpdate(@RequestBody SupportCommDto dto) {
		logger.info("댓글 수정 컨트롤러");
		ResponseEntity<String> entity = null;
		try {
			artistBiz.commUpdate(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 캘린더 insert
	@RequestMapping(value = "/calInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public List<CalendarDto> calInsert(@RequestBody CalendarDto dto) {

		//  주석 사이 부분 +9시간 적용 코드
//			Calendar calStart = Calendar.getInstance();
//			Calendar calEnd = Calendar.getInstance();
//			
//			calStart.setTime(dto.getCal_start());
//			calStart.add(Calendar.HOUR, 9);
//			calEnd.setTime(dto.getCal_end());
//			calEnd.add(Calendar.HOUR, 9);;
//			
//			dto.setCal_start(calStart.getTime());
//			dto.setCal_end(calEnd.getTime());
		//
		artistBiz.calInsert(dto);
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		try {
			list = artistBiz.calList(dto.getMember_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@RequestMapping(value = "/calUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public void calUpdate(@RequestBody CalendarDto dto) {
		//  주석 사이 부분 +9시간 적용 코드
//			Calendar calStart = Calendar.getInstance();
//			Calendar calEnd = Calendar.getInstance();
//			
//			calStart.setTime(dto.getCal_start());
//			calStart.add(Calendar.HOUR, 9);
//			calEnd.setTime(dto.getCal_end());
//			calEnd.add(Calendar.HOUR, 9);;
//			
//			dto.setCal_start(calStart.getTime());
//			dto.setCal_end(calEnd.getTime());
		//
		
		try {
			artistBiz.calUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/calDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public void calDelete(@RequestBody CalendarDto dto) {
		try {
			artistBiz.calDelete(dto.getCal_no());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
