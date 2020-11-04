package com.kh.livro.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.ArtistMapDao;
import com.kh.livro.dto.ArtistMapDto;

@Repository
public class ArtistMapDaoImpl implements ArtistMapDao {
	
	private Logger logger = LoggerFactory.getLogger(ArtistMapDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int artistmapinsert(ArtistMapDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "artistmapinsert" , dto);
		} catch (Exception e) {
			logger.info("[artistmapimpl insert 오류]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int artistmapupdate(ArtistMapDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "artistmapupdate" , dto);
		} catch (Exception e) {
			logger.info("[artistmapimpl update 오류]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int artistmapdelete(String member_id) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "artistmapdelete" , member_id);
		} catch (Exception e) {
			logger.info("[artistmap delete 오류]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public ArtistMapDto artistmapselectOne(String member_id) {
		ArtistMapDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "artistmapselectOne" , member_id);
		} catch (Exception e) {
			logger.info("[artistmap selectone 오류]");
			e.printStackTrace();
		}
		
		
		return res;
	}

}
