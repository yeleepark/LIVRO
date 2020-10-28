package com.kh.livro.bizImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.QnaBiz;
import com.kh.livro.dao.QnaDao;
import com.kh.livro.dto.QnaDto;
@Service
public class QnaBizImpl implements QnaBiz{

	@Autowired
	private QnaDao qnaDao;
	
	private Logger logger = LoggerFactory.getLogger(QnaBizImpl.class);
	
	@Override
	public List<QnaDto> selectList() {
		return qnaDao.selectList();
	}

	@Override
	public QnaDto selectOne(int qna_no) {
		return qnaDao.selectOne(qna_no);
	}

	@Override
	public int insert(QnaDto dto) {
		return qnaDao.insert(dto);
	}

	@Override
	public int update(QnaDto dto) {
		return qnaDao.update(dto);
	}

	@Override
	public int delete(int notice_no) {
		return qnaDao.delete(notice_no);
	}

}
