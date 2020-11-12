package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public int deletemusic(int music_no) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"deletemusic", music_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String musicSavename(int music_no) {
		String music_savename = null;
		
		try {
			music_savename = sqlSession.selectOne(NAMESPACE+"musicSavename", music_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return music_savename;
	}

}
