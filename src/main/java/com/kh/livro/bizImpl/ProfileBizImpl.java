package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ProfileBiz;
import com.kh.livro.dao.ProfileDao;

@Service
public class ProfileBizImpl implements ProfileBiz {
	
	@Autowired
	private ProfileDao profileDao;

	@Override
	public int profileInsert(String member_id) {
		return profileDao.profileInsert(member_id);
	}

	@Override
	public int profileUpdate(String member_id) {
		return profileDao.profileUpdate(member_id);
	}

}
