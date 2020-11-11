package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.MemberDao;
import com.kh.livro.dto.CalendarDto;
import com.kh.livro.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);

	@Override
	public int join(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "join", dto);
		} catch (Exception e) {
			logger.info("[Error] join");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int idChk(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE + "idChk", dto);
		} catch (Exception e) {
			logger.info("[Error] idChk");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int nickChk(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE + "nickChk", dto);
		} catch (Exception e) {
			logger.info("[Error] nickChk");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public MemberDto selectOne(MemberDto dto) {

		MemberDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
			logger.info(">> selectOne by userInfo " + dto.getMember_no());
		} catch (Exception e) {
			logger.info("[ERROR] USERINFO selectOne by userInfo");
			e.printStackTrace();
		}
		return res;
	}

	// 암호화 여부 확인
	@Override
	public MemberDto encryptchk(String member_id) {
		MemberDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "encryptchk", member_id);
		} catch (Exception e) {
			logger.info("[error] encryptchk");
			e.printStackTrace();
		}
		return res;
	}

	// 비밀번호찾기
	@Override
	public MemberDto pwfind(MemberDto dto) {

		MemberDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "pwfind", dto);
			logger.info(">> PWFIND" + dto.getMember_pw());
		} catch (Exception e) {
			logger.info("[ERROR] PWFIND");
			e.printStackTrace();
		}

		return res;

	}

	// sns 회원가입
	@Override
	public int snsjoin(MemberDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "snsjoin", dto);
		} catch (Exception e) {
			logger.info("[ERROR] : SNSJOIN");
			e.printStackTrace();
		}
		return res;
	}

	// user정보수정
	@Override
	public int userupdate(MemberDto dto) {

		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "userupdate", dto);
		} catch (Exception e) {
			logger.info(">>> DAOIMPL USERUPDATE!!");
			e.printStackTrace();
		}

		return res;
	}

	// PW update
	@Override
	public int pwupdate(MemberDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "pwupdate", dto);
		} catch (Exception e) {
			logger.info(">>>>>DAOIMPL PWUPDATE");
			e.printStackTrace();
		}

		return res;
	}

	// 아이디 찾기
	@Override
	public MemberDto idfind(MemberDto dto) {

		MemberDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "idfind", dto);
			logger.info(">> INFIND" + dto.getMember_name());
		} catch (Exception e) {
			logger.info("[ERROR] IDFIND");
			e.printStackTrace();
		}

		return res;
	}
	
	// Artist정보수정
	@Override
	public int arupdate(MemberDto dto) {

		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "arupdate", dto);
		} catch (Exception e) {
			logger.info(">>> DAOIMPL ARTISTUPDATE!!");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<CalendarDto> showNoti(String member_id) {
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"showNoti",member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//정보수정에서 이메일 중복체크
	@Override
	public int mailChk(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE + "mailChk", dto);
		} catch (Exception e) {
			logger.info("[Error] mailChk");
			e.printStackTrace();
		}
		return res;
	}
	
	//userPage Pw변경
	@Override
	public int userPw(MemberDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+ "userPw", dto);
		} catch (Exception e) {
			logger.info("[ERROR] userPw");
			e.printStackTrace();
		}
		return res;
	}

	//회원탈퇴
	@Override
	public int delete(String delMem) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", delMem);
		} catch (Exception e) {
			logger.info("[ERROR] delete");
			e.printStackTrace();
		}
		return res;
	}
	
}
