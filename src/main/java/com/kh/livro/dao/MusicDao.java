package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.MusicDto;

public interface MusicDao {

	public String NAMESPACE = "music.";
	public List<MusicDto> selectList();
	public MusicDto selectOne(String member_id);
	public int insert(MusicDto dto);
	public int update(MusicDto dto);
	public int delete(String member_id);
}
