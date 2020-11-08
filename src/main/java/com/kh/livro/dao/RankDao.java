package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.SupportDto;

public interface RankDao {

	String NAMESPACE = "rank.";
	
	public List<FollowerDto> rank();
	public List<SupportDto> support();
	public List<MemberDto> newArtist();
}
