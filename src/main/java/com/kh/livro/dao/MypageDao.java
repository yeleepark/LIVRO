package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.ProfileDto;

public interface MypageDao {

	String NAMESPACE = "mypage.";

	public ProfileDto selectProfile(String member_id);

	//일반 - 팔로우한 사람 출력
	public List<FollowDto> showFollow(String member_id);
	
	//아티스트 - 팔로워 목록
	public List<FollowerDto> showFollower(String member_id);
}
