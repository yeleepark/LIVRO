package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.SearchBiz;
import com.kh.livro.dao.SearchDao;
import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;

@Service
public class SearchBizImpl implements SearchBiz {

	@Autowired
	private SearchDao searchdao;
	
	@Override
	public List<BroadcastDto> BroadcastList(String keyword) {

		return searchdao.BroadcastList(keyword);
	}

	@Override
	public List<MemberDto> MemberList(String keyword) {

		return searchdao.MemberList(keyword);
	}
	
	@Override
	public List<MusicDto> selectList(String member_id) {
		return searchdao.selectList(member_id);
	}

	@Override
	public MusicDto selectOne(String member_id) {
		return searchdao.selectOne(member_id);
	}

}
