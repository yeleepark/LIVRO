package com.kh.livro.dto;

public class ArtistMapDto {

	private String member_id;
	private String artist_loc;
	
	public ArtistMapDto() {
		
		super();
	}

	public ArtistMapDto(String member_id, String artist_loc) {
		super();
		this.member_id = member_id;
		this.artist_loc = artist_loc;
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



	

}
