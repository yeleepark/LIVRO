package com.kh.livro.biz;

import org.springframework.stereotype.Service;

import com.kh.livro.dto.MemberDto;

@Service
public interface MemberBiz {

	public MemberDto login(MemberDto dto);
}
