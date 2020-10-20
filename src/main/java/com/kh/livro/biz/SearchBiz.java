package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.MemberDto;

public interface SearchBiz {

	public List<BroadcastDto> BroadcastList(String keyword);
	public List<MemberDto> MemberList(String keyword);
}
