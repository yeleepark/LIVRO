package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.QnareBiz;
import com.kh.livro.dao.QnareDao;
import com.kh.livro.dto.QnareDto;
@Service
public class QnareBizImpl implements QnareBiz {

	@Autowired
	private QnareDao qnareDao;
	
	@Override
	public int insert(QnareDto dto) {
		return qnareDao.insert(dto);
	}

	@Override
	public int delete(int qnare_no) {
		return qnareDao.delete(qnare_no);
	}

}
