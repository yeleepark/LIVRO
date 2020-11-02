package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.QnareBiz;
import com.kh.livro.dao.QnareDao;
import com.kh.livro.dto.QnareDto;

@Service
public class QnareBizImpl implements QnareBiz {

	@Autowired
	private QnareDao qnareDao;

	// 댓글등록
	@Override
	public int insert(QnareDto dto) {
		return qnareDao.insert(dto);
	}

	// 댓글삭제
	@Override
	public int delete(int qnare_no) {
		return qnareDao.delete(qnare_no);
	}

	//댓글리스트
	@Override
	public List<QnareDto> selectList(int qna_no) {

		return qnareDao.selectList(qna_no);
	}
	
	//댓글수정
	@Override
	public int update(QnareDto dto) {
		
		return qnareDao.update(dto);
	}

}
