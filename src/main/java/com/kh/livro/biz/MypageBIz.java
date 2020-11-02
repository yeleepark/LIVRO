package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.ProfileDto;

public interface MypageBIz {

	public ProfileDto selectProfile(String member_id);

	//팔로우한 사람 출력
	public List<FollowDto> showFollow(String member_id);
	
	//팔로워 출력
	public List<FollowerDto> showFollower(String member_id);

}
