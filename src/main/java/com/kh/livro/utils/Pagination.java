package com.kh.livro.utils;

public class Pagination {

	private int listSize = 10;	//초기값 목록 개수 10
	private int rangeSize = 10;	//초기값 페이지 범위 10
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	//현승 : notice 키워드 
	private String noticeKeyword;

	
	public int getRangeSize() {
		return rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getStartList() {
		return startList;
	}
	public String getNoticeKeyword() {
		return noticeKeyword;
	}
	public void setNoticeKeyword(String noticeKeyword) {
		this.noticeKeyword = noticeKeyword;
	}

	
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		//전체 페이지 수
		this.pageCnt = (int) Math.ceil(listCnt/listSize) + 1;
		
		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;
		
		//끝 페이지
		this.endPage = range * rangeSize;
		
		//게시판 시작번호
		this.startList = (page - 1) * listSize;
		
		//이전 버튼 상태
		this.prev = range == 1 ? false : true;
		
		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = pageCnt;
			this.next = false;
		}
	}
	public void pageSearchInfo(int page, int range, int listCnt, String noticeKeyword) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		this.noticeKeyword = noticeKeyword;
		
		//전체 페이지 수
		this.pageCnt = (int) Math.ceil(listCnt/listSize) + 1;
		
		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;
		
		//끝 페이지
		this.endPage = range * rangeSize;
		
		//게시판 시작번호
		this.startList = (page - 1) * listSize;
		
		//이전 버튼 상태
		this.prev = range == 1 ? false : true;
		
		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = pageCnt;
			this.next = false;
		}
	}
}
