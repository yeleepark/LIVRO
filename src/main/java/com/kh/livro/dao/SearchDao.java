package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

public interface SearchDao {

	String NAMESPACE = "search.";
	
	public List<BroadcastDto> BroadcastList(String keyword);
	public List<MemberDto> MemberList(String keyword);
	
	public List<MusicDto> selectList(String memeber_id);
	public MusicDto selectOne(String member_id);
}
