package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.ProfileDto;

public interface ProfileDao {
	
	String NAMESPACE = "profile.";
	
	public int profileInsert(ProfileDto dto);
	public int profileUpdate(String member_id);
	public List<ProfileDto> prifileList(String member_id);

}
