package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.QnaDto;

public interface QnaDao {

	public String NAMESPACE = "qna.";
	public List<QnaDto> selectList();
	public QnaDto selectOne(int qna_no);
	public int insert(QnaDto dto);
	public int update(QnaDto dto);
	public int delete(int notice_no);
}
