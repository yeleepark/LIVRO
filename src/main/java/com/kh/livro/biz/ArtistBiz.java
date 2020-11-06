package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.CalendarDto;
import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;
import com.kh.livro.dto.ProfileDto;
import com.kh.livro.dto.SupportCommDto;
import com.kh.livro.dto.SupportDto;

public interface ArtistBiz {

	// 응원글 리스트
	public List<SupportDto> supportList(SupportDto dto);

	// 내가 쓴 응원글
	public List<SupportDto> myList(SupportDto dto);

	// 응원글 게시물 수
	public SupportDto listCount(String member_id);

	// 응원글 작성
	public int supportInsert(SupportDto dto);

	// 응원글 수정
	public int supportUpdate(SupportDto dto);

	// 응원글 삭제
	public int supportDelete(int support_no);

	// 음원 리스트
	public List<MusicDto> selectList(String member_id);

	// 멤버 정보
	public MemberDto selectOne(String member_id);

	// 응원 댓글 리스트
	public List<SupportCommDto> commList(int support_no);

	// 응원 댓글
	public int commInsert(SupportCommDto dto);

	// 응원 댓글 삭제
	public int commDelete(int comm_no);

	// 응원 댓글 수정 
	public int commUpdate(SupportCommDto dto);

	// 프로필 정보
	public ProfileDto selectProfile(String member_id);

	// 일정 작성
	public int calInsert(CalendarDto dto);

	// 일정 목록
	public List<CalendarDto> calList(String member_id);

	// 일정 수정
	public int calUpdate(CalendarDto dto);

	// 일정 삭제
	public int calDelete(int cal_no);

	// 방송 기록
	public List<BroadcastDto> broadList(String member_id);

	// 팔로우
	public int follow(FollowDto dto);

	// 팔로우 -> 팔로워
	public int follwer(FollowerDto dto);

	// 언팔로우
	public int unfollow(FollowDto dto);

	// 언팔로우->팔로워
	public int unfollower(FollowerDto dto);

	//팔로워 목록
	public List<FollowerDto> followerList(String member_id);

	//팔로워 카운트
	public List<FollowerDto> followerCount(String member_id);

}
