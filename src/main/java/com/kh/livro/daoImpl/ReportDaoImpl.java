package com.kh.livro.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.BroadcastDao;
import com.kh.livro.dao.ReportDao;
import com.kh.livro.dto.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(BroadcastDao.class);
	
	
	@Override
	public int reportInsert(ReportDto dto) {
		logger.info("[InsertReportDao]");
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR reportinsert]");
			e.printStackTrace();
		}
		return res;
	}

}
