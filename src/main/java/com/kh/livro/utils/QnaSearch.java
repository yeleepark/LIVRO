package com.kh.livro.utils;

public class QnaSearch extends Pagination {

	//qna 검색 클래스
	private String searchType;
	private String keyword;
	//내가 쓴 글 검색 
	private String member_nickname;

	
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
