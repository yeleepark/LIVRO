function chkRole(){
	alert("로그인 후 이용해주세요!");
	location.href='loginForm.do';
}

 function alertMsg(){
		alert("해당 글은 작성자만 볼 수 있습니다.");
} 
	//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "qnalist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
	  //페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "qnalist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;	

		}

		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "qnalist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
