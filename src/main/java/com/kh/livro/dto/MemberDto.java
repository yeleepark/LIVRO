package com.kh.livro.dto;

import java.sql.Date;

public class MemberDto {

	private String member_id;
	private String member_pw;
	private String member_pwchk;
	private int member_no;
	private String member_name;
	private String member_nickname;
	private String member_addr;
	private String member_email;
	private String member_phone;
	private String member_role;
	private String member_enabled;
	private Date regdate; // import 확인
	private String member_profile;

	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String member_id, String member_pw, String member_pwchk, int member_no, String member_name,
			String member_nickname, String member_addr, String member_email, String member_phone, String member_role,
			String member_enabled, Date regdate, String member_profile) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_pwchk = member_pwchk;
		this.member_no = member_no;
		this.member_name = member_name;
		this.member_nickname = member_nickname;
		this.member_addr = member_addr;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_role = member_role;
		this.member_enabled = member_enabled;
		this.regdate = regdate;
		this.member_profile = member_profile;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_pwchk() {
		return member_pwchk;
	}

	public void setMember_pwchk(String member_pwchk) {
		this.member_pwchk = member_pwchk;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}

	public String getMember_enabled() {
		return member_enabled;
	}

	public void setMember_enabled(String member_enabled) {
		this.member_enabled = member_enabled;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getMember_profile() {
		return member_profile;
	}

	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}

}
