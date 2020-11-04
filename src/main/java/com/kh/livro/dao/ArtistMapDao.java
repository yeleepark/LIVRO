package com.kh.livro.dao;

import com.kh.livro.dto.ArtistMapDto;

public interface ArtistMapDao {
	
	String NAMESPACE ="artistmap.";
	
	//아티스트 주소 insert
	public int artistmapinsert(ArtistMapDto dto);
	
	//아티스트 주소 update
	public int artistmapupdate(ArtistMapDto dto);
	
	//아티스트 주소 delete
	public int artistmapdelete(String member_id);
	
	//아티스트 주소 불러오기
	public ArtistMapDto artistmapselectOne(String member_id);

}
