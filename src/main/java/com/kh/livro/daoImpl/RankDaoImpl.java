package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.RankDao;
import com.kh.livro.dto.FollowerDto;

@Repository
public class RankDaoImpl implements RankDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FollowerDto> rank() {
		List<FollowerDto> list = new ArrayList<FollowerDto>();
		list = sqlSession.selectList(NAMESPACE+"rank");
		return list;
	}

}
