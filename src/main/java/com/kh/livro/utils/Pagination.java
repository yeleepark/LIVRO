package com.kh.livro.utils;

public class Pagination {

	private int listSize = 10; // 초기값 목록 개수 10
	private int rangeSize = 10; // 초기값 페이지 범위 10
	private int page; // 현재페이지
	private int range; // 현재 페이지 범위
	private int listCnt; // 총 게시물 갯수
	private int pageCnt; // 총 페이지 범위의 개수
	private int startPage; // 시작번호
	private int startList;
	private int endPage; // 끝번호
	private boolean prev; // 이전페이지
	private boolean next; // 다음페이지
	private int MylistCnt; // 내가 쓴 글 갯수

	// 현승 : notice 키워드
	private String noticeKeyword;

	private String member_nickname;

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	// getter setter
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

	// 현승 notice 검색 getter , setter

	public String getNoticeKeyword() {
		return noticeKeyword;
	}

	public void setNoticeKeyword(String noticeKeyword) {
		this.noticeKeyword = noticeKeyword;
	}
	
	// 유정 내가 쓴 글 검색
	public int getMylistCnt() {
		return MylistCnt;
	}

	public void setMylistCnt(int mylistCnt) {
		MylistCnt = mylistCnt;
	}

	// 게시글 페이징
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		// 전체 페이지 수
		this.pageCnt = (int) Math.ceil(listCnt / listSize) + 1;

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		// 다음에 나올 다음 버튼의 활성화 여부를 판단하기 위함
		this.endPage = range * rangeSize;

		// 게시판 시작번호
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = pageCnt;
			this.next = false;
		}
	}

	// 현승 notice 검색 페이징
	public void pageSearchInfo(int page, int range, int listCnt, String noticeKeyword) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		this.noticeKeyword = noticeKeyword;

		// 전체 페이지 수
		this.pageCnt = (int) Math.ceil(listCnt / listSize) + 1;

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		this.endPage = range * rangeSize;

		// 게시판 시작번호
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = pageCnt;
			this.next = false;
		}
	}

}
