package com.kh.livro.daoImpl;

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
	
	@Override
	public int insert(QnareDto dto) {
		int res  = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "qnareinsert" , dto);
		} catch (Exception e) {
			logger.info("[error] : qnareDaoImpl insert ");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int qnare_no) {
		int res =0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "qnaredelete" , qnare_no);
		} catch (Exception e) {
			logger.info("[error] : qnareDaoImpl delete ");
			e.printStackTrace();
		}
		return res;
	}

}
