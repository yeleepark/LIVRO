package com.kh.livro.dto;

import java.util.Date;

public class SupportDto {

	private int support_no;
	private String member_id;
	private String support_title;
	private String support_content;
	private Date support_regdate;

	public SupportDto() {
		super();
	}

	public SupportDto(int support_no, String member_id, String support_title, String support_content,
			Date support_regdate) {
		super();
		this.support_no = support_no;
		this.member_id = member_id;
		this.support_title = support_title;
		this.support_content = support_content;
		this.support_regdate = support_regdate;
	}

	public int getSupport_no() {
		return support_no;
	}

	public void setSupport_no(int support_no) {
		this.support_no = support_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSupport_title() {
		return support_title;
	}

	public void setSupport_title(String support_title) {
		this.support_title = support_title;
	}

	public String getSupport_content() {
		return support_content;
	}

	public void setSupport_content(String support_content) {
		this.support_content = support_content;
	}

	public Date getSupport_regdate() {
		return support_regdate;
	}

	public void setSupport_regdate(Date support_regdate) {
		this.support_regdate = support_regdate;
	}

}
