package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.QnareDao;
import com.kh.livro.dto.QnareDto;

@Repository
public class QnareDaoImpl implements QnareDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(QnareDaoImpl.class);

	//댓글등록
	@Override
	public int insert(QnareDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "qnareinsert", dto);
		} catch (Exception e) {
			logger.info("[error] : qnareDaoImpl insert ");
			e.printStackTrace();
		}
		return res;
	}

	//댓글삭제 
	@Override
	public int delete(int qnare_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "qnaredelete", qnare_no);
		} catch (Exception e) {
			logger.info("[error] : qnareDaoImpl delete ");
			e.printStackTrace();
		}
		return res;
	}

	//댓글 리스트
	@Override
	public List<QnareDto> selectList(int qna_no) {
		List<QnareDto> list = new ArrayList<QnareDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "qnareselectList", qna_no);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;

	}

	//댓글수정 =
	@Override
	public int update(QnareDto dto) {
		int res =0;
		logger.info("dao도착");
		try {
			res = sqlSession.update(NAMESPACE + "qnareupdate", dto);
		} catch (Exception e) {
			logger.info("[error] : qnareDaoImpl update");
			e.printStackTrace();
		}
		return res;
	}
}
