package com.kh.livro.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.livro.dto.BroadcastDto;

public interface BroadcastDao {
	
	String NAMESPACE ="broadcast.";
	
	public List<BroadcastDto> selectList();
	public BroadcastDto selectOne(int broadcast_no);
	public int broadInsert(BroadcastDto dto);
	public int broadUpdate(BroadcastDto dto);
	public int broadDelete(int broadcast_no);

}
