package com.kh.livro.dao;

import com.kh.livro.dto.MemberDto;

public interface MemberDao {

	String NAMESPACE = "member.";



	// 회원가입 insert메소드
	public int join(MemberDto dto);

	// 아이디 중복체크
	public int idChk(MemberDto dto);

	// 비밀번호 체크

	// 닉네임 중복체크
	public int nickChk(MemberDto dto);

	// 일반 로그인
	public MemberDto selectOne(MemberDto dto);

}
