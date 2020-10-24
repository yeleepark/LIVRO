package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

public interface SearchBiz {

	public List<BroadcastDto> BroadcastList(String keyword);
	public List<MemberDto> MemberList(String keyword);
	
	public List<MusicDto> selectList(String member_id);
	public MusicDto selectOne(String member_id);
}
