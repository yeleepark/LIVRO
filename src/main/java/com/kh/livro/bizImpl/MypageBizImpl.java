package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.MypageBIz;
import com.kh.livro.dao.MypageDao;
import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.ProfileDto;

@Service
public class MypageBizImpl implements MypageBIz {
	
	@Autowired
	private MypageDao mypageDao;

	@Override
	public ProfileDto selectProfile(String member_id) {
		return mypageDao.selectProfile(member_id);
	}

	@Override
	public List<FollowDto> showFollow(String member_id) {
		return mypageDao.showFollow(member_id);
	}

	@Override
	public List<FollowerDto> showFollower(String member_id) {
		return mypageDao.showFollower(member_id);
	}

	@Override
	public List<FollowerDto> countNrank(String member_id) {
		return mypageDao.countNrank(member_id);
	}

}
