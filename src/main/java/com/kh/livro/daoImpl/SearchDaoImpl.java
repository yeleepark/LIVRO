package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.SearchDao;
import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

@Repository
public class SearchDaoImpl implements SearchDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);
	
	@Override
	public List<BroadcastDto> BroadcastList(String keyword) {

		List<BroadcastDto> broadlist = new ArrayList<BroadcastDto>();

		
		try {
			broadlist = sqlSession.selectList(NAMESPACE+"broadlist",keyword);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[BraodCastList ERROR]");
		}
		
		return broadlist;
	}

	@Override
	public List<MemberDto> MemberList(String keyword) {

		List<MemberDto> memberlist = new ArrayList<MemberDto>();
		

		
		try {
			memberlist = sqlSession.selectList(NAMESPACE+"memberlist",keyword);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[MemberList ERROR]");
		}
		return memberlist;
	}
	
	

}
