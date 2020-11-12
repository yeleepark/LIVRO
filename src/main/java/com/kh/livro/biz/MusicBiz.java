package com.kh.livro.biz;

import java.util.List;
import java.util.Map;

import com.kh.livro.dto.MusicDto;

public interface MusicBiz {

	
	
	public int insert(MusicDto dto);
	public int update(MusicDto dto);
	public int deletemusic(int music_no);
	public String musicSavename(int music_no);
}
