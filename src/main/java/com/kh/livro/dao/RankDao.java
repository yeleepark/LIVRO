package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.FollowerDto;

public interface RankDao {

	String NAMESPACE = "rank.";
	
	public List<FollowerDto> rank();
}
