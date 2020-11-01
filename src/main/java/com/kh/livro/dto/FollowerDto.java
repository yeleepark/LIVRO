package com.kh.livro.dto;

public class FollowerDto {

	private String artist_id;
	private String member_id;
	private String member_nickname;
	private int follower_no;

	public FollowerDto() {
		super();
	}

	public FollowerDto(String artist_id, String member_id, String member_nickname, int follower_no) {
		super();
		this.artist_id = artist_id;
		this.member_id = member_id;
		this.member_nickname = member_nickname;
		this.follower_no = follower_no;
	}

	public String getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
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

	public int getFollower_no() {
		return follower_no;
	}

	public void setFollower_no(int follower_no) {
		this.follower_no = follower_no;
	}

}
