package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.MusicDto;

public interface MusicBiz {

	
	public List<MusicDto> selectList(String member_id);
	public MusicDto selectOne(String member_id);
	public int insert(MusicDto dto);
	public int update(MusicDto dto);
	public int delete(String member_id);
}
