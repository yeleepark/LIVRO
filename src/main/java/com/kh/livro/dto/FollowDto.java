package com.kh.livro.dto;

import java.util.Date;

public class FollowDto {

	private String member_id;
	private String member_nickname;
	private String artist_id;
	private String artist_nickname;
	private int following_no;
	private Date following_date;

	public FollowDto() {
		super();
	}

	public FollowDto(String member_id, String member_nickname, String artist_id, String artist_nickname, int following_no, Date following_date) {
		super();
		this.member_id = member_id;
		this.member_nickname = member_nickname;
		this.artist_id = artist_id;
		this.artist_nickname = artist_nickname;
		this.following_no = following_no;
		this.following_date = following_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}

	public String getArtist_nickname() {
		return artist_nickname;
	}

	public void setArtist_nickname(String artist_nickname) {
		this.artist_nickname = artist_nickname;
	}

	public int getFollowing_no() {
		return following_no;
	}

	public void setFollowing_no(int following_no) {
		this.following_no = following_no;
	}

	public Date getFollowing_date() {
		return following_date;
	}

	public void setFollowing_date(Date following_date) {
		this.following_date = following_date;
	}

}
