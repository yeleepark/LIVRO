package com.kh.livro.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.ProfileDto;

public interface BroadcastBiz {

	public List<BroadcastDto> selectList();
	public BroadcastDto selectOne(int broadcast_no);
	public int broadInsert(BroadcastDto dto);
	public int broadUpdate(BroadcastDto dto);
	public int broadDelete(int broadcast_no);
	
	//프로필 가져오기
	public ProfileDto profile(String member_id);
	//방송 종료하기
	public int broadCastClose(BroadcastDto dto);
	
	
	//스크롤페이징
	public List<BroadcastDto> nextList(int lastnum);
}
