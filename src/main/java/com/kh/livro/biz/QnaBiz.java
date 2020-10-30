package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.QnaDto;
import com.kh.livro.utils.Pagination;

public interface QnaBiz {

	public List<QnaDto> selectList(Pagination pagination);

	public QnaDto selectOne(int qna_no);

	public int insert(QnaDto dto);

	public int update(QnaDto dto);

	public int delete(int notice_no);

	// 페이징
	public int getQnaListCnt() throws Exception;

	// 검색
	public List<QnaDto> searchList(QnaDto dto);

	//답변여부
	public int flagupdate(int qna_no);

}
