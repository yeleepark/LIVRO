package com.kh.livro.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.ArtistDao;
import com.kh.livro.dto.MemberDto;

@Repository
public class ArtistDaoImpl implements ArtistDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(ArtistDao.class);

	@Override
	public MemberDto selectArtist(String member_id) {
		
		MemberDto dto = new MemberDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectArtist", member_id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[ERROR]");
		}
		
		return dto;
	}

}
