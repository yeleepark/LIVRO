package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.RankBiz;
import com.kh.livro.dao.RankDao;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.SupportDto;

@Service
public class RankBizImpl implements RankBiz {

	@Autowired
	private RankDao rankDao;
	
	@Override
	public List<FollowerDto> rank() {
		return rankDao.rank();
	}

	@Override
	public List<SupportDto> support() {
		return rankDao.support();
	}

	@Override
	public List<MemberDto> newArtist() {
		return rankDao.newArtist();
	}
	

}
