package com.kh.livro.dao;

import com.kh.livro.dto.ArtistMapDto;

public interface ArtistMapDao {
	
	String NAMESPACE ="artistmap.";
	
	//아티스트 주소 insert
	public int artistmapinsert(ArtistMapDto dto);

}
