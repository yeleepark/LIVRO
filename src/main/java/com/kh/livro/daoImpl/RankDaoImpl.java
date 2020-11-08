package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.BroadcastDao;
import com.kh.livro.dao.RankDao;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.SupportDto;

@Repository
public class RankDaoImpl implements RankDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(BroadcastDao.class);

	@Override
	public List<FollowerDto> rank() {
		List<FollowerDto> list = new ArrayList<FollowerDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "rank");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SupportDto> support() {
		List<SupportDto> list = new ArrayList<SupportDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "supportRank");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MemberDto> newArtist() {
		List<MemberDto> list = new ArrayList<MemberDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"newArtist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
