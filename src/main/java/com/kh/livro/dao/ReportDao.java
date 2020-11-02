package com.kh.livro.dao;

import com.kh.livro.dto.ReportDto;

public interface ReportDao {

	String NAMESPACE ="report.";
	
	public int reportInsert(ReportDto dto);
	
}
