package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.BroadcastBiz;
import com.kh.livro.dao.BroadcastDao;
import com.kh.livro.dto.BroadcastDto;

@Service
public class BroadcastBizImpl implements BroadcastBiz {
	
	@Autowired
	private BroadcastDao broadcastDao;

	@Override
	public List<BroadcastDto> selectList() {
		return broadcastDao.selectList();
	}

	@Override
	public BroadcastDto selectOne(int broadcast_no) {
		return broadcastDao.selectOne(broadcast_no);
	}

	@Override
	public int broadInsert(BroadcastDto dto) {
		return broadcastDao.broadInsert(dto);
	}

	@Override
	public int broadUpdate(BroadcastDto dto) {
		return broadcastDao.broadUpdate(dto);
	}

	@Override
	public int broadDelete(int broadcast_no) {
		return broadcastDao.broadDelete(broadcast_no);
	}

}
