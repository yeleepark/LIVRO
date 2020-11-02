package com.kh.livro.bizImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ReportBiz;
import com.kh.livro.dao.BroadcastDao;
import com.kh.livro.dao.ReportDao;
import com.kh.livro.dto.ReportDto;

@Service
public class ReportBizImpl implements ReportBiz {
	
	@Autowired
	private ReportDao reportdao;
	
	private Logger logger = LoggerFactory.getLogger(BroadcastDao.class);

	@Override
	public int reportInsert(ReportDto dto) {
		
		return reportdao.reportInsert(dto);
	}

}
