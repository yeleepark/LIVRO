package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.ProfileDao;
import com.kh.livro.dto.ProfileDto;

@Repository
public class ProfileDaoImpl implements ProfileDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int profileInsert(ProfileDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "profileInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int profileUpdate(String member_id) {
		int res = 0;
				
		try {
			res = sqlSession.update(NAMESPACE+"profileUpdate", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ProfileDto> prifileList(String member_id) {
		List<ProfileDto> list = new ArrayList<ProfileDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"profileList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
}
