// --------------------Support board
// 해당 아티스트의 아이디
var artist_id = document.getElementById('artistId').value;
// 해당 아티스트의 닉네임
var artist_nickname = document.getElementById('artistNickname').value;
// 로그인한 유저의 아이디
var login_id = document.getElementById('loginId').value;
// 로그인한 유저의 닉네임
var login_nickname = document.getElementById('loginNickname').value;
// support_content
var supportContent = document.getElementsByClassName('support-content')[0];
// showMore
var moreContent = document.getElementsByClassName('more-content')[0];

function list() {
	
	$.ajax({
		type : "post",
		url : "supportList.do?member_id=" + artist_id + "&lastnum=0",
		success : function(result) {
			supportContent.innerHTML = result;
			var countArea = document.getElementById('listCount');
			count = countArea.innerHTML;
			
			// 게시물이 5개 이상이면 쇼몰 블럭 출력
			if (count > 5) {
				var showMore = document.getElementsByClassName('showMoreBtn')[0];
				showMore.style.display = "block";
		    }
		}
	})
}

var lastnum = 0;
function showMore(e) {
	// 쇼몰 블럭 누를때마다 게시물 5개씩 늘어남
	
	lastnum += 5;
	
	// 마지막 인덱가 게시물 보다 많을때
	if (lastnum > count) {
		e.style.display = "none";
		//취소버튼 나타남
		e.nextSibling.nextSibling.style.display = "block";
	}

	// 안 많을때
	$.ajax({
		type : "post",
		url : "supportList.do?member_id=" + artist_id + "&lastnum=" + lastnum,
		success : function(result) {
			supportContent.innerHTML = result;
		}
	});
}

function closeMore(e) {

	var res = confirm('닫으시겠습니까?');

	if (res) { // 닫으면
		lastnum = 0;
		list();// 전체 리스트 다시 출력하고
		e.style.display = "none"; // 클로즈 버튼 사라지고
		document.documentElement.scrollTop = 0; // 상단으로 올라가고
		console.log(lastnum +"확")
	}
}

//------------------------------------------------------

////내가 작성한 글
function mine() {
	
	// 전체글 보기 나타남
	var mineBtn = document.getElementsByClassName('mineBtn')[0];
	mineBtn.style.display ="none";
	var allBtn = document.getElementsByClassName('allBtn')[0];
	allBtn.style.display ="block";

	//showMore 버튼 사라짐
	showMore = document.getElementsByClassName('showMoreBtn')[0];
	closeMore =  document.getElementsByClassName('closeMoreBtn')[0];
	showMore.style.display = "none";
	closeMore.style.display = "none";
	
	lastnum = 0; 
	
	$.ajax({
		type : "post",
		url : "mylist.do",
		headers : {
			"Content-Type" : "application/json"
		},
		dateType : "text",
		data : JSON.stringify({
			member_id : artist_id,
			writer_id : login_id,
			lastnum : lastnum
		}),
		success : function(result) {
			// 글 다섯개만 나타나고
			supportContent.innerHTML = result;
			countArea = document.getElementById('listCount');
			count = countArea.innerHTML;
			
			console.log('mine눌렀을때' + count);
			if (count > 5){
				var myShowMoreBtn = document.getElementsByClassName('myShowMoreBtn')[0];
				myShowMoreBtn.style.display ="block";
			}
		}
	})
}

function myShowMore(e){

	lastnum += 5;

	if (lastnum > count) {
		e.style.display = "none";
		e.nextSibling.nextSibling.style.display = "block";
	}

	$.ajax({
		type : "post",
		url : "mylist.do",
		headers : {
			"Content-Type" : "application/json"
		},
		dateType : "text",
		data : JSON.stringify({
			member_id : artist_id,
			writer_id : login_id,
			lastnum : lastnum
		}),
		success : function(result) {
			supportContent.innerHTML = result;
		}
	})
}

function myCloseMore(e) {

	var res = confirm('닫으시겠습니까?');

	if (res) {
		e.style.display = "none";
		mine();
		document.documentElement.scrollTop = 0;
	}
}

function allBtn(e) {
	
	e.style.display = "none";
	e.previousSibling.previousSibling.style.display = "block";
	myShowMore = document.getElementsByClassName('myShowMoreBtn')[0];
	myCloseMore = document.getElementsByClassName('myCloseMoreBtn')[0];
	myShowMore.style.display ="none";
	myCloseMore.style.display ="none";
	
	list();
	
}


// 글 작성 - 완료
function insertSupport(e) {
	var target = e.parentNode.previousSibling.previousSibling;
	var member_id = artist_id;
	var member_nickname = artist_nickname;
	var support_content = target.querySelector('#support_content').value;

	$.ajax({
		type : "post",
		url : "supportInsert.do",
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			member_id : member_id,
			member_nickname : member_nickname,
			support_content : support_content,
			writer_id : login_id,
			writer_nickname : login_nickname
		}),
		success : function(result) {
			target.querySelector('#support_content').value = '';
			listRest();
		}
	});
}

// 글 삭제 - 완료
function deleteSupport(e) {
	var target = e.nextSibling.nextSibling;
	var support_no = target.value;

	var res = confirm('삭제하시겠습니까?');
	if (res) {
		$.ajax({
			type : "post",
			url : "supportDelete.do?" + support_no,
			headers : {
				"Content-Type" : "application/json"
			},
			dateType : "text",
			data : JSON.stringify({
				support_no : support_no
			}),
			success : function(res) {
				if (res > 0) {
					listRest();
				} else {
					alert('댓글이 있는 게시물은 삭제할 수 없습니다');
				}
			}
		});
	}
}

// 글 수정
function updateSupport(e) {
	var target = e.parentNode.parentNode;
	var res = target.getElementsByClassName('change')[0];
	res.removeAttribute("readonly");
	res.classList.add("changeActive");
	e.style.display = "none";
	target.getElementsByClassName('updateRes')[0].style.display = "block";
}

function updateRes(e) {
	var target = e.parentNode.parentNode;
	var res = target.getElementsByClassName('change')[0];
	var support_content = target.getElementsByClassName('change')[0].value;
	var support_no = target.getElementsByClassName('supportNo')[0].value;

	var done = confirm('수정하시겠습니까?');

	if (done) {
		$
				.ajax({
					type : "post",
					url : "supportUpdate.do?suppport_no=" + support_no,
					headers : {
						"Content-Type" : "application/json"
					},
					dateType : "text",
					data : JSON.stringify({
						support_no : support_no,
						support_content : support_content
					}),
					success : function(result) {
						support_content = result.support_content;
						res.classList.remove("changeActive");
						res.readOnly = true;
						e.style.display = "none";
						target.getElementsByClassName('updateBtn')[0].style.display = "block";
					}

				})
	}
}





// 게시글 리스트 출력
function listRest() {
	$.ajax({
		type : "get",
		url : "supportList.do?member_id=" + artist_id,
		success : function(result) {

			supportContent.innerHTML = result;
		}
	});
}

// 댓글 보기
function showReply(e) {
	var target = e.parentNode.parentNode;

	var res = target.getElementsByClassName('replyArea')[0];
	res.classList.add('replyActive');

	e.style.display = "none";
	target.getElementsByClassName('closeReply')[0].style.display = "inherit";

	var support_no = target.getElementsByClassName('supportNo')[0].value;

	$.ajax({
		type : "post",
		url : "showList.do?support_no=" + support_no,
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			support_no : support_no,
			member_id : artist_id
		}),
		success : function(result) {
			res.innerHTML = result;
		}
	});

}

// 댓글 닫기
function closeReply(e) {
	var target = e.parentNode.parentNode;

	var res = target.getElementsByClassName('replyArea')[0];
	res.classList.remove('replyActive');

	e.style.display = "none";
	target.getElementsByClassName('showReply')[0].style.display = "block";
}

// 댓글입력
function replyInsert(e) {
	var target = e.parentNode.parentNode.querySelector('.replyContent');
	var comm_content = target.value;
	var member_id = login_id;
	var member_nickname = login_nickname;
	var supportTarget = e.parentNode.parentNode.parentNode.parentNode;
	var support_no = supportTarget.parentNode.querySelector('.supportNo').value;
	$.ajax({
		type : "post",
		url : "commInsert.do",
		headers : {
			"Content-Type" : "application/json"
		},
		dateType : "text",
		data : JSON.stringify({
			member_id : member_id,
			comm_content : comm_content,
			support_no : support_no,
			member_nickname : member_nickname
		}),
		success : function(result) {
			target.value = '';
			replyRest(support_no, supportTarget, member_id);
		}
	})
}

// 댓글수정
function replyUpdate(e) {
	e.style.display = "none";
	var doneBtn = e.parentNode.getElementsByClassName('updateDone')[0];
	doneBtn.style.display = "block";

	var content = e.parentNode.parentNode.querySelector('.comm_content');
	content.readOnly = false;
	content.classList.add('commActive');
}

function updateDone(e) {
	var comm_no = e.parentNode.querySelector('.replyNum').value;
	var target = e.parentNode.parentNode.querySelector('.comm_content');
	var comm_content = target.value;

	var res = confirm('수정하시겠습니까?');
	if (res) {
		$.ajax({
			type : "post",
			url : "commUpdate.do?comm_no=" + comm_no,
			headers : {
				"Content-Type" : "application/json"
			},
			dateType : "text",
			data : JSON.stringify({
				comm_no : comm_no,
				comm_content : comm_content
			}),
			success : function(result) {
			}
		}).done(
				function() {
					e.style.display = "none";
					var updateBtn = e.parentNode
							.getElementsByClassName('replyUpdate')[0];
					updateBtn.style.display = "block";
					target.readOnly = true;
					target.classList.remove('commActive');
				});
	}
};

// 댓글삭제
function replyDelete(e) {
	var res = confirm('삭제하시겠습니까?');
	var supportTarget = e.parentNode.parentNode.parentNode.parentNode;
	if (res) {
		var comm_no = e.parentNode.querySelector('.replyNum').value;
		var support_no = e.parentNode.querySelector('.supportNum').value;

		$.ajax({
			type : "post",
			url : "commDelete.do?comm_no=" + comm_no,
			success : function(result) {
				replyRest(support_no, supportTarget, artist_id);
			}
		});
	}
}

// 댓글 rest 출력
function replyRest(support_no, supportTarget, member_id) {
	$.ajax({
		type : "post",
		url : "showList.do?support_no=" + support_no,
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			support_no : support_no,
			member_id : member_id
		}),
		success : function(result) {
			supportTarget.querySelector('.replyArea').innerHTML = result;
		}
	});
}

// 신고하기 --
function report(e) {
	var target = e.parentNode.parentNode;
	var receive_id = target.getElementsByClassName('writerId')[0].value;
	var receive_nickname = target.getElementsByClassName('writerNick')[0].innerText;
	open("report.do?receive_id=" + receive_id + "&receive_nickname="
			+ receive_nickname, "", "width=700, height=550");
}
