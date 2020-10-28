package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.QnaDao;
import com.kh.livro.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(QnaDaoImpl.class);

	@Override
	public List<QnaDto> selectList() {
		logger.info("[qnaDao selectList]");
		List<QnaDto> qnalist = new ArrayList<QnaDto>();
		
		try {
			qnalist = sqlSession.selectList(NAMESPACE + "selectList");
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

}
