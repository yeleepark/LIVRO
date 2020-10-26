package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.NoticeDao;
import com.kh.livro.dto.NoticeDto;
import com.kh.livro.utils.Pagination;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);
	
	@Override
	public List<NoticeDto> selectList(Pagination pagination) {
		logger.info("noticeDao selectList");
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", pagination);
		} catch (Exception e) {
			logger.info("error : noticeDao selectList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public NoticeDto selectOne(int notice_no) {
		logger.info("noticeDao selectOne");
		NoticeDto dto = new NoticeDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne",notice_no);
		} catch (Exception e) {
			logger.info("error : noticeDao selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(NoticeDto dto) {
		logger.info("notiaceDao insert");
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			logger.info("error : noticeDao insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(NoticeDto dto) {
		logger.info("notiaceDao update");
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"update",dto);
		} catch (Exception e) {
			logger.info("error : noticeDao update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int notice_no) {
		logger.info("notiaceDao delete");
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"delete",notice_no);
		} catch (Exception e) {
			logger.info("error : noticeDao delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int getBoardListCnt() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getBoardListCnt");
	}

}
