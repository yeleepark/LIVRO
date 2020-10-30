package com.kh.livro.dto;

import java.util.Date;

public class QnareDto {
	
	private int qnare_no;
	private int qna_no;
	private String member_nickname;
	private String qnare_content;
	private Date qnare_regdate;

	public QnareDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnareDto(int qnare_no, int qna_no, String member_nickname, String qnare_content, Date qnare_regdate) {
		super();
		this.qnare_no = qnare_no;
		this.qna_no = qna_no;
		this.member_nickname = member_nickname;
		this.qnare_content = qnare_content;
		this.qnare_regdate = qnare_regdate;
	}
	
	public int getQnare_no() {
		return qnare_no;
	}
	public void setQnare_no(int qnare_no) {
		this.qnare_no = qnare_no;
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
	public String getQnare_content() {
		return qnare_content;
	}
	public void setQnare_content(String qnare_content) {
		this.qnare_content = qnare_content;
	}
	public Date getQnare_regdate() {
		return qnare_regdate;
	}
	public void setQnare_regdate(Date qnare_regdate) {
		this.qnare_regdate = qnare_regdate;
	}


	
	
}	