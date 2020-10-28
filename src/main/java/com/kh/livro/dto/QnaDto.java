package com.kh.livro.dto;

import java.util.Date;

public class QnaDto {


	private int qna_no;
	private String member_nickname;
	private String qna_title;
	private String qna_content;
	private Date qna_regdate;
	private String qna_flag;
	private String qna_secret;

	public QnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaDto(int qna_no, String member_nickname, String qna_title, String qna_content, Date qna_regdate,
			String qna_flag, String qna_secret) {
		super();
		this.qna_no = qna_no;
		this.member_nickname = member_nickname;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regdate = qna_regdate;
		this.qna_flag = qna_flag;
		this.qna_secret = qna_secret;
	}
	
	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public String getQna_flag() {
		return qna_flag;
	}

	public void setQna_flag(String qna_flag) {
		this.qna_flag = qna_flag;
	}

	public String getQna_secret() {
		return qna_secret;
	}

	public void setQna_secret(String qna_secret) {
		this.qna_secret = qna_secret;
	}


}
