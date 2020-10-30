package com.kh.livro.dto;

import java.sql.Date;

public class CalendarDto {

	private int cal_no;
	private String member_id;
	private String cal_title;
	private Date cal_start;
	private Date cal_end;
	private String cal_category;

	public CalendarDto() {
		super();
	}

	public CalendarDto(int cal_no, String member_id, String cal_title, Date cal_start, Date cal_end, String cal_category) {
		super();
		this.cal_no = cal_no;
		this.member_id = member_id;
		this.cal_title = cal_title;
		this.cal_start = cal_start;
		this.cal_end = cal_end;
		this.cal_category = cal_category;
	}

	public int getCal_no() {
		return cal_no;
	}

	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public Date getCal_start() {
		return cal_start;
	}

	public void setCal_start(Date cal_start) {
		this.cal_start = cal_start;
	}

	public Date getCal_end() {
		return cal_end;
	}

	public void setCal_end(Date cal_end) {
		this.cal_end = cal_end;
	}

	public String getCal_category() {
		return cal_category;
	}

	public void setCal_category(String cal_category) {
		this.cal_category = cal_category;
	}

}
