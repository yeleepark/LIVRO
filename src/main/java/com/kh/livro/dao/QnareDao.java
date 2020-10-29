package com.kh.livro.dao;

import com.kh.livro.dto.QnareDto;

public interface QnareDao {
	
	public String NAMESPACE = "qnare.";
	//댓글 등록
	public int insert(QnareDto dto);

	//댓글 삭제
	public int delete(int qnare_no);
}
