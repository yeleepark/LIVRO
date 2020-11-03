package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ArtistMapBiz;
import com.kh.livro.dao.ArtistMapDao;

@Service
public class ArtistMapBizImpl implements ArtistMapBiz {

	
	@Autowired
	private ArtistMapDao artistmapDao;
}
