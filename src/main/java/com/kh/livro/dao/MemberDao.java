package com.kh.livro.dao;

import com.kh.livro.dto.MemberDto;

public interface MemberDao {

	String NAMESPACE = "member.";

	// 회원가입 insert메소드
	public int join(MemberDto dto);

	// 아이디 중복체크
	public int idChk(MemberDto dto);

	// 닉네임 중복체크
	public int nickChk(MemberDto dto);

	// 일반 로그인
	public MemberDto selectOne(MemberDto dto);

	// 암호화 여부확인
	public MemberDto encryptchk(String member_id);

	// 아이디 찾기
	public MemberDto idfind(MemberDto dto);

	// 비밀번호 찾기
	public MemberDto pwfind(MemberDto dto);

	// sns 회원가입
	public int snsjoin(MemberDto dto);

	// PW 변경
	public int pwupdate(MemberDto dto);

	// USER 정보수정
	public int userupdate(MemberDto dto);
	
	//Artist 정보수정
	public int arupdate(MemberDto dto);

}
