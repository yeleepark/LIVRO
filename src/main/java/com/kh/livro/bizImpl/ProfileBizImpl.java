package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ProfileBiz;
import com.kh.livro.dao.ProfileDao;
import com.kh.livro.dto.ProfileDto;

@Service
public class ProfileBizImpl implements ProfileBiz {
	
	@Autowired
	private ProfileDao profileDao;

	@Override
	public int profileInsert(ProfileDto dto) {
		return profileDao.profileInsert(dto);
	}

	@Override
	public int profileUpdate(ProfileDto dto) {
		return profileDao.profileUpdate(dto);
	}

	@Override
	public List<ProfileDto> profileList(String member_id) {
		// TODO Auto-generated method stub
		return profileDao.prifileList(member_id);
	}

}
