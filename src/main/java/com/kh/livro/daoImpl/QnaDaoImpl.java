package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.QnaDao;
import com.kh.livro.dto.QnaDto;
import com.kh.livro.utils.QnaSearch;


@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(QnaDaoImpl.class);

	@Override
	public List<QnaDto> selectList(QnaSearch search) {
		logger.info("[qnaDao selectList]");
		List<QnaDto> qnalist = new ArrayList<QnaDto>();
		try {
			qnalist = sqlSession.selectList(NAMESPACE + "selectList" , search);
		} catch (Exception e) {
			logger.info("[error] qnaDao selectList");
			e.printStackTrace();
		}
		
		return qnalist;
	}

	@Override
	public QnaDto selectOne(int qna_no) {
		logger.info("[qnaDao selectOne]");
		QnaDto dto = new QnaDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+ "selectOne" , qna_no );
		} catch (Exception e) {
			logger.info("[error] qnaDao selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(QnaDto dto) {
		logger.info("qnaDao insert");
		int res =0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert" , dto);
		} catch (Exception e) {
			logger.info("[error] qnaDao insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(QnaDto dto) {
		logger.info("qnaDao update");
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update" , dto);
		} catch (Exception e) {
			logger.info("error : qnaDao update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int qna_no) {
		logger.info("[qnaDao delete]");
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", qna_no);
		} catch (Exception e) {
			logger.info("[error] qnaDao delete");
			e.printStackTrace();
		}
		return res;
	}

	//페이징
	@Override
	public int getQnaListCnt(QnaSearch search) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getQnaListCnt" , search);
	}

	//검색
	@Override
	public List<QnaDto> searchList(QnaDto dto) {
		
		return sqlSession.selectList(NAMESPACE+"searchList", dto);
	}

	//답변여부 업데이트
	@Override
	public int flagupdate(int qna_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "flagupdate",qna_no);
		} catch (Exception e) {
			logger.info("[error] flagupdate qnadaoimpl");
			e.printStackTrace();
		}
		
		return res;
	}

	//답변여부 다시 n으로 , 댓글 삭제 시
	@Override
	public int flagdowndate(int qna_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE +"flagdowndate" , qna_no);
		} catch (Exception e) {
			logger.info("[error] flagdowndate qnadaoimpl");
			e.printStackTrace();
		}
		
		return res;
	}



}
