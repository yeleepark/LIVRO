package com.kh.livro.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.MemberDao;
import com.kh.livro.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);

	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"login", dto);
		} catch (Exception e) {
			logger.info("[Error] login");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int join(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"join", dto);
		} catch (Exception e) {
			logger.info("[Error] join");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public MemberDto idChk(String id) {
		
		return null;
	}

	

}
