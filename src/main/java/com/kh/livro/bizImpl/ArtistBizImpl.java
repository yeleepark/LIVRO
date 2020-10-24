package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ArtistBiz;
import com.kh.livro.dao.ArtistDao;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

@Service
public class ArtistBizImpl implements ArtistBiz{
	
	@Autowired
	private ArtistDao artistDao;
	

	@Override
	public MemberDto selectArtist(String member_id) {
		return artistDao.selectArtist(member_id);
	}
	
	@Override
	public List<MusicDto> selectList(String member_id) {
		return artistDao.selectList(member_id);
	}

	@Override
	public MusicDto selectOne(String member_id) {
		return artistDao.selectOne(member_id);
	}


}
