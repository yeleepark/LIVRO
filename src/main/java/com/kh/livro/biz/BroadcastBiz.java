package com.kh.livro.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.livro.dto.BroadcastDto;

public interface BroadcastBiz {

	public List<BroadcastDto> selectList();
	public BroadcastDto selectOne(int broadcast_no);
	public int broadInsert(BroadcastDto dto);
	public int broadUpdate(BroadcastDto dto);
	public int broadDelete(int broadcast_no);
	
	//프로필 가져오기
	public BroadcastDto profile(String member_id); 
	
}
