package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.QnaDto;

public interface QnaBiz {
	
	public List<QnaDto> selectList();
	public QnaDto selectOne(int qna_no);
	public int insert(QnaDto dto);
	public int update(QnaDto dto);
	public int delete(int notice_no);

}
