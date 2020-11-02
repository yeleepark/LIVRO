package com.kh.livro.biz;

import java.util.List;

import com.kh.livro.dto.DonationDto;

public interface DonationBiz {

	public List<DonationDto> selectList();
	public List<DonationDto> selectUser(String member_id);
	public List<DonationDto> selectAmountById(String member_id);
	public int insert(DonationDto dto);
	public int delete(int dona_no);
}
