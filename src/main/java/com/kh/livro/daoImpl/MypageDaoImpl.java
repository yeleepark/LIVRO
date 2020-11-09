package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.MypageDao;
import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.ProfileDto;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ProfileDto selectProfile(String member_id) {

		ProfileDto dto = new ProfileDto();

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectProfile", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<FollowDto> showFollow(String member_id) {

		List<FollowDto> list = new ArrayList<FollowDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "showFollow", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<FollowerDto> showFollower(String member_id) {
		List<FollowerDto> list = new ArrayList<FollowerDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "showFollower", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FollowerDto> countNrank(String member_id) {
		List<FollowerDto> list = new ArrayList<FollowerDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "countNrank", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
