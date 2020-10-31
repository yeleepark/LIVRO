package com.kh.livro.dto;

import java.util.Date;

public class DonationDto {

	private int dona_no;
	private String member_id;
	private String dona_price;
	private Date dona_date;
	private String dona_id;
	
	public DonationDto() {
		
	}
	
	public DonationDto(int dona_no, String member_id, String dona_price, Date dona_date, String dona_id) {
		this.dona_no = dona_no;
		this.member_id = member_id;
		this.dona_price = dona_price;
		this.dona_date = dona_date;
		this.dona_id = dona_id;
	}

	public int getDona_no() {
		return dona_no;
	}

	public void setDona_no(int dona_no) {
		this.dona_no = dona_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getDona_price() {
		return dona_price;
	}

	public void setDona_price(String dona_price) {
		this.dona_price = dona_price;
	}

	public Date getDona_date() {
		return dona_date;
	}

	public void setDona_date(Date dona_date) {
		this.dona_date = dona_date;
	}

	public String getDona_id() {
		return dona_id;
	}

	public void setDona_id(String dona_id) {
		this.dona_id = dona_id;
	}

	
}
