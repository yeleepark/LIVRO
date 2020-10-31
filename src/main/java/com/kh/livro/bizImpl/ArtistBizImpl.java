package com.kh.livro.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.livro.biz.ArtistBiz;
import com.kh.livro.dao.ArtistDao;
import com.kh.livro.dto.BroadcastDto;
import com.kh.livro.dto.CalendarDto;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.MusicDto;
import com.kh.livro.dto.ProfileDto;
import com.kh.livro.dto.SupportCommDto;
import com.kh.livro.dto.SupportDto;

@Service
public class ArtistBizImpl implements ArtistBiz {

	@Autowired
	private ArtistDao artistDao;

	@Override
	public List<SupportDto> supportList(String member_id) {
		return artistDao.supportList(member_id);
	}

	@Override
	public int supportInsert(SupportDto dto) {
		return artistDao.supportInsert(dto);
	}

	@Override
	public int supportUpdate(SupportDto dto) {
		return artistDao.supportUpdate(dto);
	}

	@Override
	public int supportDelete(int support_no) {
		return artistDao.supportDelete(support_no);
	}

	@Override
	public List<MusicDto> selectList(String member_id) {
		return artistDao.selectList(member_id);
	}

	@Override
	public MusicDto selectOne(String member_id) {
		return artistDao.selectOne(member_id);
	}

	@Override
	public List<SupportCommDto> commList(int support_no) {
		return artistDao.commList(support_no);
	}

	@Override
	public int commInsert(SupportCommDto dto) {
		return artistDao.commInsert(dto);
	}

	@Override
	public ProfileDto selectProfile(String member_id) {
		return artistDao.selectProfile(member_id);
	}

	@Override
	public List<BroadcastDto> broadList(String member_id) {
		return artistDao.broadList(member_id);
	}

	@Override
	public int calInsert(CalendarDto dto) {
		return artistDao.calInsert(dto);
	}

	@Override
	public List<CalendarDto> calList(String member_id) {
		return artistDao.calList(member_id);
	}

	@Override
	public int calUpdate(CalendarDto dto) {
		return artistDao.calUpdate(dto);
	}

	@Override
	public int calDelete(int cal_no) {
		return artistDao.calDelete(cal_no);
	}

	@Override
	public int commDelete(int comm_no) {
		return artistDao.commDelete(comm_no);
	}

	@Override
	public int commUpdate(SupportCommDto dto) {
		return artistDao.commUpdate(dto);
	}

}
