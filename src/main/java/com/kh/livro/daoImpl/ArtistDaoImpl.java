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
import com.kh.livro.dto.ProfileDto;
import com.kh.livro.dto.SupportCommDto;
import com.kh.livro.dto.SupportDto;

@Repository
public class ArtistDaoImpl implements ArtistDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(ArtistDao.class);

	@Override
	public List<MusicDto> selectList(String member_id) {
		List<MusicDto> list = new ArrayList<MusicDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MusicDto selectOne(String member_id) {
		MusicDto dto = new MusicDto();
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<SupportDto> supportList(String member_id) {
		List<SupportDto> list = new ArrayList<SupportDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "supportList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int supportInsert(SupportDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "supportInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int supportUpdate(SupportDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "supportUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int supportDelete(int support_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "supportDelete", support_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commInsert(SupportCommDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"commInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<SupportCommDto> commList(int support_no) {
		List<SupportCommDto> list = new ArrayList<SupportCommDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"commList", support_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

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
