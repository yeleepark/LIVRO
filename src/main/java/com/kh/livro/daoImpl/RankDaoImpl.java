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

@Repository
public class RankDaoImpl implements RankDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(BroadcastDao.class);

	@Override
	public List<FollowerDto> rank() {
		List<FollowerDto> list = new ArrayList<FollowerDto>();
		list = sqlSession.selectList(NAMESPACE+"rank");
		return list;
	}
	
	@Override
	public List<HashMap<String, Object>> ranktest() {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"ranktest");
		} catch (Exception e) {
			logger.info("[ERROR ranktest]");
			e.printStackTrace();
		}
		return list;
	}

}
