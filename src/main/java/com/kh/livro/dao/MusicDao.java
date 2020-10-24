package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.MusicDto;

public interface MusicDao {

	public String NAMESPACE = "music.";
	
	public int insert(MusicDto dto);
	public int update(MusicDto dto);
	public int delete(String member_id);
}
