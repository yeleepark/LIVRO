package com.kh.livro.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.ProfileDao;

@Repository
public class ProfileDaoImpl implements ProfileDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int profileInsert(String member_id) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"profileInsert", member_id);
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
	
	
}
