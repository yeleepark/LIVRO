package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.ArtistDao;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

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
	
	@Override
	public List<MusicDto> selectList(String member_id) {
		List<MusicDto> list = new ArrayList<MusicDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList",member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MusicDto selectOne(String member_id) {
		MusicDto dto = new MusicDto();
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne",member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
