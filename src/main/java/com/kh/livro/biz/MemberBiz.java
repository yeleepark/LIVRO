package com.kh.livro.biz;

import org.springframework.stereotype.Service;

import com.kh.livro.dto.MemberDto;

public interface MemberBiz {

	// 회원가입
	public int join(MemberDto dto);

	// 아이디 중복체크
	public int idChk(MemberDto dto);

	// 닉네임 중복체크
	public int nickChk(MemberDto dto);

	// 일반 로그인
	public MemberDto selectOne(MemberDto dto);

	// 암호화 여부확인
	public MemberDto encryptchk(String member_id);
}
