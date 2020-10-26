package com.kh.livro.dto;

import java.util.Date;

public class SupportCommDto {

	private int comm_no;
	private int support_no;
	private String member_id;
	private String comm_content;
	private Date comm_regdate;

	public SupportCommDto() {
		super();
	}

	public SupportCommDto(int comm_no, int support_no, String member_id, String comm_content, Date comm_regdate) {
		super();
		this.comm_no = comm_no;
		this.support_no = support_no;
		this.member_id = member_id;
		this.comm_content = comm_content;
		this.comm_regdate = comm_regdate;
	}

	public int getComm_no() {
		return comm_no;
	}

	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
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

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public Date getComm_regdate() {
		return comm_regdate;
	}

	public void setComm_regdate(Date comm_regdate) {
		this.comm_regdate = comm_regdate;
	}
	
	
}