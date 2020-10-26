package com.kh.livro.bizImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.NoticeBiz;
import com.kh.livro.dao.NoticeDao;
import com.kh.livro.dto.NoticeDto;
import com.kh.livro.utils.Pagination;

@Service
public class NoticeBizImpl implements NoticeBiz {

	@Autowired
	private NoticeDao noticeDao;
	
	private Logger logger = LoggerFactory.getLogger(NoticeBizImpl.class);
	
	@Override
	public List<NoticeDto> selectList(Pagination pagination) {
		return noticeDao.selectList(pagination);
	}

	@Override
	public NoticeDto selectOne(int notice_no) {
		return noticeDao.selectOne(notice_no);
	}

	@Override
	public int insert(NoticeDto dto) {
		return noticeDao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {
		return noticeDao.update(dto);
	}

	@Override
	public int delete(int notice_no) {
		return noticeDao.delete(notice_no);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return noticeDao.getBoardListCnt();
	}

}
