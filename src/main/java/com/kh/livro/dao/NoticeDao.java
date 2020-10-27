package com.kh.livro.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.livro.dto.NoticeDto;
import com.kh.livro.utils.Pagination;

@Repository
public interface NoticeDao {

	public String NAMESPACE = "notice.";
	public List<NoticeDto> selectList(Pagination pagination);
	public NoticeDto selectOne(int notice_no);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int notice_no);
	
	public List<NoticeDto> selectSearchList(Pagination spagination);
	
	// 페이징 총 게시글 개수 확인
	public int getBoardListCnt() throws Exception;
	//
	public int getSearchListCnt(String noticeKeyword) throws Exception;
	
	
}
