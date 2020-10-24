package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

public interface ArtistBiz {

	public MemberDto selectArtist(String member_id);
	
	public List<MusicDto> selectList(String member_id);
	public MusicDto selectOne(String member_id);
}
