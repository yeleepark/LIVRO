package com.kh.livro.dto;

import java.util.Date;

public class SupportDto {

	private int support_no;
	private String member_id;
	private String member_nickname;
	private String writer_id;
	private String writer_nickname;
	private String support_content;
	private Date support_regdate;

	public SupportDto() {
		super();
	}

	public SupportDto(int support_no, String member_id, String member_nickname, String writer_id, String writer_nickname, String support_content, Date support_regdate) {
		super();
		this.support_no = support_no;
		this.member_id = member_id;
		this.member_nickname = member_nickname;
		this.writer_id = writer_id;
		this.writer_nickname = writer_nickname;
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

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getWriter_nickname() {
		return writer_nickname;
	}

	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
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
