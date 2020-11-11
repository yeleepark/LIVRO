package com.kh.livro.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.livro.biz.QnaBiz;
import com.kh.livro.biz.QnareBiz;
import com.kh.livro.dto.QnaDto;
import com.kh.livro.dto.QnareDto;
import com.kh.livro.utils.QnaSearch;

@Controller
public class QnaController {
	private Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaBiz qnaBiz;
	
	//참고자료 : https://melonpeach.tistory.com/34
	//qna 댓글처리하는 비즈 주입 -> 이유 : 댓글 게시글에 종속되어있기때문에

	@Autowired
	private QnareBiz qnareBiz;

	// 문의게시판 리스트
	@RequestMapping(value = "/qnalist.do", method = RequestMethod.GET)
	public String qnaList(Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			 @RequestParam(required = false, defaultValue = "title") String searchType
			, @RequestParam(required = false) String keyword , 
			String member_nickname
			) throws Exception {
		logger.info("[qnalist.do]");
		
		
		//MemberDto dto = (MemberDto)session.getAttribute("logindto");
		//페이징 상속받는 qna검색 클래스 객체 생성
		QnaSearch search = new QnaSearch();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + member_nickname);
		//전체 게시글 개수
		int listCnt = qnaBiz.getQnaListCnt(search);
		search.pageInfo(page, range, listCnt);
		
		
		
		
		//pagination 객체 생성
		//Pagination pagination = new Pagination();
		//pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("myqnalist", qnaBiz.myqnaList(search));
		model.addAttribute("pagination", search);
		model.addAttribute("qnalist", qnaBiz.selectList(search));
		return "qna/qnaList";
	}

	// 문의게시판 글쓰기 눌렀을 때 폼으로 이동
	@RequestMapping("/qnainsertform.do")
	public String qnaInsertForm() {
		logger.info("[qnainsertform.do]");

		return "qna/qnaInsertForm";
	}

	// 문의게시판 글 등록 눌렀을 때 insert
	@RequestMapping("/qnainsert.do")
	public String qnaInsert(QnaDto dto, Model model) {
		logger.info("[qnainsert.do]");

		model.addAttribute("res", qnaBiz.insert(dto));

		return "redirect:qnalist.do";
	}

	// 문의게시판 리스트에서 제목 눌렀을 때 detail 로 이동
	@RequestMapping(value="/qnadetail.do")
	public String qnaDetail(int qna_no, Model model) {
		logger.info("[qnadetail.do]");

		//글상세
		model.addAttribute("qnadetaildto", qnaBiz.selectOne(qna_no));
		
		//댓글 목록
		List<QnareDto> list = qnareBiz.selectList(qna_no);
		for(QnareDto dto : list) {
			System.out.println(dto.getQnare_no());
		}
		model.addAttribute("qnarelist", list);
		return "qna/qnaDetail";
	}

	// 문의게시판 수정눌렀을 때 폼으로 이동
	@RequestMapping("/qnaupdateform.do")
	public String qnaUpdateForm(int qna_no, Model model) {
		model.addAttribute("qnaupdatedto", qnaBiz.selectOne(qna_no));

		return "qna/qnaUpdateForm";
	}

	// 수정완료 후 수정버튼
	@RequestMapping("/qnaupdate.do")
	public String qnaUpdate(QnaDto dto, Model model) {
		model.addAttribute("qnaupdatedto", qnaBiz.update(dto));
		
		model.addAttribute("msg", "글을 성공적으로 수정했습니다.");
		model.addAttribute("url", "/qnalist.do");

		return "redirect";
	}

	// 문의게시판 글상세에서 삭제버튼
	@RequestMapping("/qnadelete.do")
	public String qnaDelete(int qna_no, Model model) {
		logger.info("[qnadelete.do]");
		model.addAttribute("qnadeldto", qnaBiz.delete(qna_no));
		
		model.addAttribute("msg", "글을 성공적으로 삭제하였습니다.");
		model.addAttribute("url", "/qnalist.do");

		return "redirect";
	}
	/*
	 * //내가 쓴 글 리스트
	 * 
	 * @RequestMapping("/myqnalist.do") public String myQnaList(String member_id,
	 * Model model) { logger.info("[myqnalist.do]"); //아이디 확인 완료
	 * //System.out.println("member_id" + member_id );
	 * model.addAttribute("myqnalist", qnaBiz.myqnaList(member_id));
	 * 
	 * return "qna/qnaList"; }
	 */
	
	
}
