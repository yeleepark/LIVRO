package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.MusicBiz;
import com.kh.livro.dto.MusicDto;

@Service
public class MusicBizImpl implements MusicBiz {

	@Autowired
	private MusicBiz musicBiz;
	
	@Override
	public List<MusicDto> selectList() {
		return musicBiz.selectList();
	}

	@Override
	public MusicDto selectOne(String member_id) {
		return musicBiz.selectOne(member_id);
	}

	@Override
	public int insert(MusicDto dto) {
		return musicBiz.insert(dto);
	}

	@Override
	public int update(MusicDto dto) {
		return musicBiz.update(dto);
	}

	@Override
	public int delete(String member_id) {
		return musicBiz.delete(member_id);
	}

}
