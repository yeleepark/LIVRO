package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ArtistBiz;
import com.kh.livro.dao.ArtistDao;
import com.kh.livro.dto.MemberDto;

@Service
public class ArtistBizImpl implements ArtistBiz{
	
	@Autowired
	private ArtistDao artistDao;
	

	@Override
	public MemberDto selectArtist(String member_id) {
		return artistDao.selectArtist(member_id);
	}

}
