package com.kh.livro.dao;

import com.kh.livro.dto.ProfileDto;

public interface MypageDao {

	String NAMESPACE = "mypage.";
	
	public ProfileDto selectProfile(String member_id);
	
}
