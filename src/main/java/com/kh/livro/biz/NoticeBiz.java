package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.NoticeDto;
import com.kh.livro.utils.Pagination;

public interface NoticeBiz {

	public List<NoticeDto> selectList(Pagination pagination);
	public NoticeDto selectOne(int notice_no);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int notice_no);
	
	public List<NoticeDto> selectSearchList(Pagination spagination);
	
	public int getBoardListCnt() throws Exception;
	public int getSearchListCnt(String noticeKeyword) throws Exception;
}
