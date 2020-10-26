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
	public int idChk(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"idChk",dto);
		} catch (Exception e) {
			logger.info("[Error] idChk");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int nickChk(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"nickChk",dto);
		} catch (Exception e) {
			logger.info("[Error] nickChk");
			e.printStackTrace();
		}
		
		return res;
	}


	@Override
	   public MemberDto selectOne(MemberDto dto) {
	      
	      MemberDto res = null;
	      
	      try {
	         res = sqlSession.selectOne(NAMESPACE+"login", dto);
	         logger.info(">> selectOne by userInfo " + dto.getMember_no());
	      } catch (Exception e) {
	         logger.info("[ERROR] USERINFO selectOne by userInfo");
	         e.printStackTrace();
	      }
	      return res;
	   }

	

}
