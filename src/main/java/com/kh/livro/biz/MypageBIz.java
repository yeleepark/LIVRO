package com.kh.livro.biz;

import com.kh.livro.dto.ProfileDto;

public interface MypageBIz {
	
	public ProfileDto selectProfile(String member_id);

}
