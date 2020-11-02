package com.kh.livro.dto;

import java.util.Date;

public class ReportDto {

	private int report_no;
	private String send_id;
	private String send_nickname;
	private String receive_id;
	private String receive_nickname;
	private String report_title;
	private String report_content;
	private Date report_regdate;

	public ReportDto() {

	}

	public ReportDto(int report_no, String send_id, String send_nickname, String receive_id, String receive_nickname,
			String report_title, String report_content, Date report_regdate) {
		super();
		this.report_no = report_no;
		this.send_id = send_id;
		this.send_nickname = send_nickname;
		this.receive_id = receive_id;
		this.receive_nickname = receive_nickname;
		this.report_title = report_title;
		this.report_content = report_content;
		this.report_regdate = report_regdate;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getSend_nickname() {
		return send_nickname;
	}

	public void setSend_nickname(String send_nickname) {
		this.send_nickname = send_nickname;
	}

	public String getReceive_id() {
		return receive_id;
	}

	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}

	public String getReceive_nickname() {
		return receive_nickname;
	}

	public void setReceive_nickname(String receive_nickname) {
		this.receive_nickname = receive_nickname;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_regdate() {
		return report_regdate;
	}

	public void setReport_regdate(Date report_regdate) {
		this.report_regdate = report_regdate;
	}
	
	
}
