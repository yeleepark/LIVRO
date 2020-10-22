package com.kh.livro.biz;

import com.kh.livro.dto.MemberDto;

public interface ArtistBiz {

	public MemberDto selectArtist(String member_id);
}
