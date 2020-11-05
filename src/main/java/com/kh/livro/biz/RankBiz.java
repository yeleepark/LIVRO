package com.kh.livro.biz;

import java.util.HashMap;
import java.util.List;

import com.kh.livro.dto.FollowerDto;

public interface RankBiz {
	
	public List<FollowerDto> rank();
	
	public List<HashMap<String, Object>> ranktest();
}
