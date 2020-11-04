package com.kh.livro.dto;

public class ArtistMapDto {

	private String member_id;
	private String artist_loc;
	private String artist_detail_loc;
	private String artist_postcode;

	public ArtistMapDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArtistMapDto(String member_id, String artist_loc, String artist_detail_loc , String artist_postcode) {
		super();
		this.member_id = member_id;
		this.artist_loc = artist_loc;
		this.artist_detail_loc = artist_detail_loc;
		this.artist_postcode = artist_postcode;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getArtist_loc() {
		return artist_loc;
	}

	public void setArtist_loc(String artist_loc) {
		this.artist_loc = artist_loc;
	}

	public String getArtist_detail_loc() {
		return artist_detail_loc;
	}

	public void setArtist_detail_loc(String artist_detail_loc) {
		this.artist_detail_loc = artist_detail_loc;
	}
	
	
	public String getArtist_postcode() {
		return artist_postcode;
	}
	public void setArtist_postcode(String artist_postcode) {
		this.artist_postcode = artist_postcode;
	}
	
	

}
