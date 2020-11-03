package com.kh.livro.dto;

import java.util.Date;

public class FollowerDto {

	private int follower_no;
	private String member_id;
	private String member_nickname;
	private String follower_id;
	private String follower_nickname;
	private Date follower_date;
	private int rank;
	private int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public FollowerDto() {
		super();
	}

	public FollowerDto(int follower_no, String member_id, String member_nickname, String follower_id, String follower_nickname, Date follower_date) {
		super();
		this.follower_no = follower_no;
		this.member_id = member_id;
		this.member_nickname = member_nickname;
		this.follower_id = follower_id;
		this.follower_nickname = follower_nickname;
		this.follower_date = follower_date;
	}

	public int getFollower_no() {
		return follower_no;
	}

	public void setFollower_no(int follower_no) {
		this.follower_no = follower_no;
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

	public String getFollower_id() {
		return follower_id;
	}

	public void setFollower_id(String follower_id) {
		this.follower_id = follower_id;
	}

	public String getFollower_nickname() {
		return follower_nickname;
	}

	public void setFollower_nickname(String follower_nickname) {
		this.follower_nickname = follower_nickname;
	}

	public Date getFollower_date() {
		return follower_date;
	}

	public void setFollower_date(Date follower_date) {
		this.follower_date = follower_date;
	}

}
