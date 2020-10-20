package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.SearchBiz;
import com.kh.livro.dao.SearchDao;
import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.MemberDto;

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

}
