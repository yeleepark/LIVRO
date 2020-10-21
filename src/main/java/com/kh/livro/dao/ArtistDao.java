package com.kh.livro.dao;

import com.kh.livro.dto.MemberDto;

public interface ArtistDao {
	
	String NAMESPACE = "artist.";

	public MemberDto selectArtist(String member_nickname);
}
