package com.kh.livro.dto;

import java.util.Date;

public class BroadcastDto {

	private int broadcast_no;
	private String member_id;
	private String member_profile;
	private String broadcast_title;
	private String broadcast_content;
	private String broadcast_category;
	private String broadcast_flag;
	private Date broadcast_startdate;
	private Date broadcast_enddate;
	private String member_nickname;
	
	public BroadcastDto() {
	}

	public BroadcastDto(int broadcast_no, String member_id, String member_profile, String broadcast_title,
			String broadcast_content, String broadcast_category, String broadcast_flag, Date broadcast_startdate,
			Date broadcast_enddate, String member_nickname) {
		this.broadcast_no = broadcast_no;
		this.member_id = member_id;
		this.member_profile = member_profile;
		this.broadcast_title = broadcast_title;
		this.broadcast_content = broadcast_content;
		this.broadcast_category = broadcast_category;
		this.broadcast_flag = broadcast_flag;
		this.broadcast_startdate = broadcast_startdate;
		this.broadcast_enddate = broadcast_enddate;
		this.member_nickname = member_nickname;
	}
	
	public BroadcastDto(String member_id, String broadcast_title, String broadcast_content,
			String broadcast_category, String member_nickname) {
		this.member_id = member_id;
		this.broadcast_title = broadcast_title;
		this.broadcast_content = broadcast_content;
		this.broadcast_category = broadcast_category;
		this.member_nickname = member_nickname;
		
	}

	public int getBroadcast_no() {
		return broadcast_no;
	}
	
	public void setBroadcast_no(int broadcast_no) {
		this.broadcast_no = broadcast_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_profile() {
		return member_profile;
	}

	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}

	public String getBroadcast_title() {
		return broadcast_title;
	}

	public void setBroadcast_title(String broadcast_title) {
		this.broadcast_title = broadcast_title;
	}

	public String getBroadcast_content() {
		return broadcast_content;
	}

	public void setBroadcast_content(String broadcast_content) {
		this.broadcast_content = broadcast_content;
	}

	public String getBroadcast_category() {
		return broadcast_category;
	}

	public void setBroadcast_category(String broadcast_category) {
		this.broadcast_category = broadcast_category;
	}

	public String getBroadcast_flag() {
		return broadcast_flag;
	}

	public void setBroadcast_flag(String broadcast_flag) {
		this.broadcast_flag = broadcast_flag;
	}

	public Date getBroadcast_startdate() {
		return broadcast_startdate;
	}

	public void setBroadcast_startdate(Date broadcast_startdate) {
		this.broadcast_startdate = broadcast_startdate;
	}

	public Date getBroadcast_enddate() {
		return broadcast_enddate;
	}

	public void setBroadcast_enddate(Date broadcast_enddate) {
		this.broadcast_enddate = broadcast_enddate;
	}
	
	public String getMember_nickname() {
		return member_nickname;
	}
	
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	

	
}
