package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.MemberBiz;
import com.kh.livro.dao.MemberDao;
import com.kh.livro.dto.CalendarDto;
import com.kh.livro.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao memberDao;

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

	// 일반로그인
	@Override
	public MemberDto selectOne(MemberDto dto) {
		return memberDao.selectOne(dto);
	}

	// 암호화 여부 확인
	@Override
	public MemberDto encryptchk(String member_id) {
		return memberDao.encryptchk(member_id);
	}
	
	 
    // 아이디 찾기
    @Override
    public MemberDto idfind(MemberDto dto) {
       return memberDao.idfind(dto);
    }
    
    //비밀번호 찾기
   @Override
   public MemberDto pwfind(MemberDto dto) {
      return memberDao.pwfind(dto);
   }

   //sns 회원가입
   @Override
   public int snsjoin(MemberDto dto) {
      return memberDao.snsjoin(dto);
   }

   //USER 정보 수정
   @Override
   public int userupdate(MemberDto dto) {
   
      return memberDao.userupdate(dto);
   }

   //PW update
   @Override
   public int pwupdate(MemberDto dto) {
      
      return memberDao.pwupdate(dto);
   }
   
   //USER 정보 수정
   @Override
   public int arupdate(MemberDto dto) {
   
      return memberDao.arupdate(dto);
   }

	@Override
	public List<CalendarDto> showNoti(String member_id) {
		return memberDao.showNoti(member_id);
	}

}
