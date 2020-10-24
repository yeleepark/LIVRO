package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

public interface ArtistDao {
	
	String NAMESPACE = "artist.";

	public MemberDto selectArtist(String member_id);
	
	public List<MusicDto> selectList(String memeber_id);
	public MusicDto selectOne(String member_id);
}
