package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.QnaDto;
import com.kh.livro.utils.MySearch;
import com.kh.livro.utils.QnaSearch;


public interface QnaDao {

	public String NAMESPACE = "qna.";
	public List<QnaDto> selectList(QnaSearch search);
	public QnaDto selectOne(int qna_no);
	public int insert(QnaDto dto);
	public int update(QnaDto dto);
	public int delete(int notice_no);
	
	//페이징 
	public int getQnaListCnt(QnaSearch search) throws Exception;
	
	//답변여부(y로)
	public int flagupdate(int qna_no);
	
	//답변여부(n으로)
	public int flagdowndate(int qna_no);
	
}

