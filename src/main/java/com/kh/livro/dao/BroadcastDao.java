package com.kh.livro.dao;

import java.util.List;

import com.kh.livro.dto.BroadcastDto;

public interface BroadcastDao {
	
	String NAMESPACE ="broadcast.";
	
	public List<BroadcastDto> selectList();
	public BroadcastDto selectOne(int broadcast_no);
	public int broadInsert(BroadcastDto dto);
	public int broadUpdate(BroadcastDto dto);
	public int broadDelete(int broadcast_no);
	
	//프로필 가져오기
	public BroadcastDto profile(String member_id);
	//방송 종료하기
	public int broadCastClose(BroadcastDto dto);
	
	//스크롤페이징
	public List<BroadcastDto> nextList(int lastnum);

}
