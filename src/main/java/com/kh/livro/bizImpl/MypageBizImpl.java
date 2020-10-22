package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.MypageBIz;
import com.kh.livro.dao.MypageDao;
import com.kh.livro.dto.ProfileDto;

@Service
public class MypageBizImpl implements MypageBIz {
	
	@Autowired
	private MypageDao mypageDao;

	@Override
	public ProfileDto selectProfile(String member_id) {
		return mypageDao.selectProfile(member_id);
	}

}
