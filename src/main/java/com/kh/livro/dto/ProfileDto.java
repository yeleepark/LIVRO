package com.kh.livro.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProfileDto {

	private String member_id;
	private String profile_savedname;
	private String profile_realname;
	private Date profile_regdate;
	private String profile_delflag;
	private MultipartFile profile;

	public ProfileDto() {

	};

	public ProfileDto(String member_id, String profile_savedname, String profile_realname, Date profile_regdate,
			String profile_delflag, MultipartFile profile) {
		super();
		this.member_id = member_id;
		this.profile_savedname = profile_savedname;
		this.profile_realname = profile_realname;
		this.profile_regdate = profile_regdate;
		this.profile_delflag = profile_delflag;
		this.profile = profile;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProfile_savedname() {
		return profile_savedname;
	}

	public void setProfile_savedname(String profile_savedname) {
		this.profile_savedname = profile_savedname;
	}

	public String getProfile_realname() {
		return profile_realname;
	}

	public void setProfile_realname(String profile_realname) {
		this.profile_realname = profile_realname;
	}

	public Date getProfile_regdate() {
		return profile_regdate;
	}

	public void setProfile_regdate(Date profile_regdate) {
		this.profile_regdate = profile_regdate;
	}

	public String getProfile_delflag() {
		return profile_delflag;
	}

	public void setProfile_delflag(String profile_delflag) {
		this.profile_delflag = profile_delflag;
	}

	public MultipartFile getProfile() {
		return profile;
	}

	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}

}
