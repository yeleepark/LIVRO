package com.kh.livro.bizImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.DonationBiz;
import com.kh.livro.dao.DonationDao;
import com.kh.livro.dto.DonationDto;

@Service
public class DonationBizImpl implements DonationBiz {

	@Autowired
	private DonationDao donationDao;
	
	@Override
	public List<DonationDto> selectList() {
		return donationDao.selectList();
	}

	@Override
	public List<DonationDto> selectUser(String member_id) {
		return donationDao.selectUser(member_id);
	}

	@Override
	public List<HashMap<String, Object>> selectAmountById(String member_id) {
		return donationDao.selectAmountById(member_id);
	}
	
	@Override
	public int insert(DonationDto dto) {
		return donationDao.insert(dto);
	}

	@Override
	public int delete(int dona_no) {
		return donationDao.delete(dona_no);
	}


}
