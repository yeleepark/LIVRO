package com.kh.livro.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.MypageDao;
import com.kh.livro.dto.ProfileDto;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ProfileDto selectProfile(String member_id) {
		
		ProfileDto dto = new ProfileDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectProfile", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
