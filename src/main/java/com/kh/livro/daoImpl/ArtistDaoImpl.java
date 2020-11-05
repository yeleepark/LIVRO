package com.kh.livro.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.livro.dao.ArtistDao;
import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.CalendarDto;
import com.kh.livro.dto.FollowDto;
import com.kh.livro.dto.FollowerDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;
import com.kh.livro.dto.ProfileDto;
import com.kh.livro.dto.SupportCommDto;
import com.kh.livro.dto.SupportDto;

@Repository
public class ArtistDaoImpl implements ArtistDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(ArtistDao.class);

	@Override
	public List<MusicDto> selectList(String member_id) {
		List<MusicDto> list = new ArrayList<MusicDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MemberDto selectOne(String member_id) {
		MemberDto dto = new MemberDto();
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<SupportDto> supportList(String member_id) {
		List<SupportDto> list = new ArrayList<SupportDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "supportList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int supportInsert(SupportDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "supportInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int supportUpdate(SupportDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "supportUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int supportDelete(int support_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "supportDelete", support_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commInsert(SupportCommDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "commInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<SupportCommDto> commList(int support_no) {
		List<SupportCommDto> list = new ArrayList<SupportCommDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "commList", support_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProfileDto selectProfile(String member_id) {
		ProfileDto dto = new ProfileDto();

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectProfile", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int calInsert(CalendarDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "calInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	};

	@Override
	public List<BroadcastDto> broadList(String member_id) {
		List<BroadcastDto> list = new ArrayList<BroadcastDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "broadList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CalendarDto> calList(String member_id) {
		List<CalendarDto> list = new ArrayList<CalendarDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "calList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int calUpdate(CalendarDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "calUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int calDelete(int cal_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "calDelete", cal_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commDelete(int comm_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "commDelete", comm_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int commUpdate(SupportCommDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "commUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int follow(FollowDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "follow", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int follwer(FollowerDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "follower", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int unfollow(FollowDto dto) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "unfollow", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int unfollower(FollowerDto dto) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "unfollower", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<FollowerDto> followerList(String member_id) {
		List<FollowerDto> list = new ArrayList<FollowerDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "followerList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<FollowerDto> followerCount(String member_id) {
		List<FollowerDto> list = new ArrayList<FollowerDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "followerCount", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SupportDto> myList(SupportDto dto) {
		List<SupportDto> list = new ArrayList<SupportDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"myList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
