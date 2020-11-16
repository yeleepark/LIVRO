package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.livro.dao.BroadcastDao;
import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.ProfileDto;

@Repository
public class BroadcastDaoImpl implements BroadcastDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(BroadcastDao.class);

	@Override
	public List<BroadcastDto> selectList() {
		List<BroadcastDto> list = new ArrayList<BroadcastDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[ERROR] 방송 목록 Dao 에러");
		}

		return list;
	}

	@Override
	public BroadcastDto selectOne(int broadcast_no) {
		BroadcastDto dto = new BroadcastDto();

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", broadcast_no);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[ERROR] 방송 목록 Dao 에러");
		}

		return dto;
	}

	// 방송하기 눌러서 방제 , 내용 등 입력하면 인서트 한다.
	@Override
	public int broadInsert(BroadcastDto dto) {
		logger.info("[InsertDao check]");
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[ERROR]");
		}
		return res;
	}

	@Override
	public int broadUpdate(BroadcastDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[ERROR]");
		}
		return res;
	}

	@Override
	public int broadDelete(int broadcast_no) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "delete", broadcast_no);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[ERROR]");
		}
		return res;
	}

	@Override
	public ProfileDto profile(String member_id) {
		ProfileDto dto = new ProfileDto();
		String trim = member_id.trim(); 
		String res= trim.substring(1, trim.length()-1);

		try {
			dto = sqlSession.selectOne(NAMESPACE + "select_profile", res);
			
		} catch (Exception e) {

			e.printStackTrace();
			logger.info("[ERROR profile]");
		}

		return dto;
	}

	@Override
	public int broadCastClose(BroadcastDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			logger.info("[ERROR close]");
			e.printStackTrace();
		}
		return res;
	}

	// 스크롤페이징
	@Override
	public List<BroadcastDto> nextList(int lastnum) {
		List<BroadcastDto> list = new ArrayList<BroadcastDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "infiniteScrollDown", lastnum);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("[ERROR] 방송 목록 Dao 에러");
		}

		return list;

	}

}
