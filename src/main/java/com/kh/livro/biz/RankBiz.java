package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.SupportDto;

public interface RankBiz {
	
	public List<FollowerDto> rank();
	public List<SupportDto> support();
	public List<MemberDto> newArtist();
	
}
