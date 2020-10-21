package com.kh.livro.dao;

import org.springframework.stereotype.Repository;

import com.kh.livro.dto.MemberDto;

public interface MemberDao {
	
	String NAMESPACE ="member.";
	
	public MemberDto login(MemberDto dto);
	//회원가입 insert메소드
	public int join(MemberDto dto);

	
}
