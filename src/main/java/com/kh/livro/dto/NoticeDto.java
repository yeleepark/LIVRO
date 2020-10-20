package com.kh.livro.dto;

import java.util.Date;

public class NoticeDto {

	private int notice_no;
	private String member_id;
	private String notice_title;
	private String notice_content;
	private Date notice_regdate;
	public NoticeDto() {}
	public NoticeDto(int notice_no, String member_id, String notice_title, String notice_content, Date notice_regdate) {
		this.notice_no = notice_no;
		this.member_id = member_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_regdate = notice_regdate;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	
}
