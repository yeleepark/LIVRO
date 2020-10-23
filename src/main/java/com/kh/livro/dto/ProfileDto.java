package com.kh.livro.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProfileDto {

	private String member_id;
	private String profile_savedname;
	private String profile_realname;
	private String profile_path;
	private Date profile_regdate;
	private MultipartFile profile;

	public ProfileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProfileDto(String member_id, String profile_savedname, String profile_realname, String profile_path,
			Date profile_regdate, MultipartFile profile) {
		super();
		this.member_id = member_id;
		this.profile_savedname = profile_savedname;
		this.profile_realname = profile_realname;
		this.profile_path = profile_path;
		this.profile_regdate = profile_regdate;
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

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public Date getProfile_regdate() {
		return profile_regdate;
	}

	public void setProfile_regdate(Date profile_regdate) {
		this.profile_regdate = profile_regdate;
	}

	public MultipartFile getProfile() {
		return profile;
	}

	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}

}
