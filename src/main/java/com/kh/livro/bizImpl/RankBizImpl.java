package com.kh.livro.bizImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.RankBiz;
import com.kh.livro.dao.RankDao;
import com.kh.livro.dto.FollowerDto;

@Service
public class RankBizImpl implements RankBiz {

	@Autowired
	private RankDao followDao;
	
	@Override
	public List<FollowerDto> rank() {
		return followDao.rank();
	}
	
	@Override
	public List<HashMap<String, Object>> ranktest() {
		
		return followDao.ranktest();
	}

}
