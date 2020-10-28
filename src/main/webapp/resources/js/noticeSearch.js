// 이전 버튼 이벤트 

function fn_prev(page, range, rangeSize) {
	var noticeKeyword = document.getElementById("noticeKeyword");
	
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "noticeSearch.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&noticeKeyword=" + noticeKeyword;
	location.href = url;
	
}

//페이지 번호 클릭 
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var noticeKeyword = document.getElementById("noticeKeyword").value;
	var url = "noticeSearch.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&noticeKeyword=" + noticeKeyword;
		
	
	location.href = url;
}

//다음 번호 이벤트
function fn_next(page, range, rangeSize) {
	var noticeKeyword = document.getElementById("noticeKeyword");
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "noticeSearch.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&noticeKeyword=" + noticeKeyword;
	
	location.href = url;
}