package com.kh.livro.bizImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.MusicBiz;
import com.kh.livro.dao.MusicDao;
import com.kh.livro.dto.MusicDto;

@Service
public class MusicBizImpl implements MusicBiz {

	@Autowired
	private MusicDao musicDao;
	
	

	@Override
	public int insert(MusicDto dto) {
		return musicDao.insert(dto);
	}

	@Override
	public int update(MusicDto dto) {
		return musicDao.update(dto);
	}

	@Override
	public int delete(String member_id) {
		return musicDao.delete(member_id);
	}

}
