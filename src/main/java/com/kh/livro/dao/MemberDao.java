package com.kh.livro.dao;

import org.springframework.stereotype.Repository;

import com.kh.livro.dto.MemberDto;

public interface MemberDao {
	
	String NAMESPACE ="member.";
	
	public MemberDto login(MemberDto dto);
	//회원가입 insert메소드
	public int join(MemberDto dto);
	//아이디 중복확인
	public MemberDto idChk(String id);
}
