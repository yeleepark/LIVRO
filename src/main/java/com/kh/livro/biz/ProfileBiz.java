package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.ProfileDto;

public interface ProfileBiz {

	public int profileInsert(ProfileDto dto);
	public int profileUpdate(String member_id);
	public List<ProfileDto> profileList(String member_id);
}
