package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ArtistMapBiz;
import com.kh.livro.dao.ArtistMapDao;
import com.kh.livro.dto.ArtistMapDto;

@Service
public class ArtistMapBizImpl implements ArtistMapBiz {

	
	@Autowired
	private ArtistMapDao artistmapDao;

	@Override
	public int artistmapinsert(ArtistMapDto dto) {
		// TODO Auto-generated method stub
		return artistmapDao.artistmapinsert(dto);
	}

	@Override
	public int artistmapupdate(ArtistMapDto dto) {
		// TODO Auto-generated method stub
		return artistmapDao.artistmapupdate(dto);
	}

	@Override
	public int artistmapdelete(String member_id) {
		// TODO Auto-generated method stub
		return artistmapDao.artistmapdelete(member_id);
	}
	
	
	
}
