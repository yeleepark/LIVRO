package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.MusicDao;
import com.kh.livro.dto.MusicDto;

@Repository
public class MusicDaoImpl implements MusicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

	@Override
	public int insert(MusicDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(MusicDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(String member_id) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"delete", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
