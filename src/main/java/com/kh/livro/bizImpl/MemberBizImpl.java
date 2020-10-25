package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.MemberBiz;
import com.kh.livro.dao.MemberDao;
import com.kh.livro.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao memberDao;
 
	@Override
	public MemberDto login(MemberDto dto) {
		
		return memberDao.login(dto);
	}

	@Override
	public int join(MemberDto dto) {
		
		return memberDao.join(dto);
	}

	@Override
	public int idChk(MemberDto dto) {
		
		return memberDao.idChk(dto);
	}

	@Override
	public int nickChk(MemberDto dto) {
		
		return memberDao.nickChk(dto);
	}

	   //일반로그인
	   @Override
	   public MemberDto selectOne(MemberDto dto) {
	      return memberDao.selectOne(dto);
	   }

}
