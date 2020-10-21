package com.kh.livro.dto;

import java.util.Date;

public class MusicDto {

	private String member_id;
	private String music_title;
	private String music_content;
	private String music_savename;
	private String music_realname;
	private int music_size;
	private Date music_date;
	
	public MusicDto() {}

	public MusicDto(String member_id, String music_title, String music_content, String music_savename,
			String music_realname, int music_size, Date music_date) {
		this.member_id = member_id;
		this.music_title = music_title;
		this.music_content = music_content;
		this.music_savename = music_savename;
		this.music_realname = music_realname;
		this.music_size = music_size;
		this.music_date = music_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMusic_title() {
		return music_title;
	}

	public void setMusic_title(String music_title) {
		this.music_title = music_title;
	}

	public String getMusic_content() {
		return music_content;
	}

	public void setMusic_content(String music_content) {
		this.music_content = music_content;
	}

	public String getMusic_savename() {
		return music_savename;
	}

	public void setMusic_savename(String music_savename) {
		this.music_savename = music_savename;
	}

	public String getMusic_realname() {
		return music_realname;
	}

	public void setMusic_realname(String music_realname) {
		this.music_realname = music_realname;
	}

	public int getMusic_size() {
		return music_size;
	}

	public void setMusic_size(int music_size) {
		this.music_size = music_size;
	}

	public Date getMusic_date() {
		return music_date;
	}

	public void setMusic_date(Date music_date) {
		this.music_date = music_date;
	}

	
}
