package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;
import com.kh.livro.dto.ProfileDto;
import com.kh.livro.dto.SupportCommDto;
import com.kh.livro.dto.SupportDto;

public interface ArtistBiz {

	// 응원글 리스트
	public List<SupportDto> supportList(String member_id);

	// 응원글 작성
	public int supportInsert(SupportDto dto);

	// 응원글 수정
	public int supportUpdate(SupportDto dto);

	// 응원글 삭제
	public int supportDelete(int support_no);

	// 음원 리스트
	public List<MusicDto> selectList(String member_id);

	// 멤버 정보
	public MusicDto selectOne(String member_id);

	// 응원 리스트
	public List<SupportCommDto> commList(int support_no);

	// 응원 댓글
	public int commInsert(SupportCommDto dto);

	// 프로필 정보
	public ProfileDto selectProfile(String member_id);
}
