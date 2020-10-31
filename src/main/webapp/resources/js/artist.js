// Tab menu
var tabsLi = document.querySelectorAll('.tabs li');

tabsLi.forEach(tab =>{
	tab.addEventListener('click', (e)=>{
		var tab_id = tab.getAttribute('data-tab');
		
		var tabActive = document.querySelector('.tabCurrent');
		tabActive.classList.remove('tabCurrent');
		e.target.classList.add('tabCurrent');

		var tabContent = document.querySelectorAll('.tab-content');
		for (var i = 0; i < tabContent.length; i++){
			tabContent[i].classList.remove('tabCurrent');
		}
		
		var tab_id_ = document.getElementById(tab_id);
		tab_id_.classList.add('tabCurrent');
		
	})
})

// --------------------Support board

// 해당 아티스트의 아이디
var artist_id = document.getElementById('artistId').value;
// 로그인한 유저의 아이디
var login_id = document.getElementById('loginId').value;
// 로그인한 유저의 닉네임
var login_nickname = document.getElementById('loginNickname').value;

// 댓글 보기
var showReply = document.querySelectorAll('.showReply');
showReply.forEach(show =>{
show.addEventListener('click', (e)=>{
		var target = e.target.parentNode.parentNode;
		
		var res = target.getElementsByClassName('replyArea')[0];
		res.classList.add('replyActive');
		
		e.target.style.display = "none";
		target.getElementsByClassName('closeReply')[0].style.display ="inherit";
		
		var support_no = target.getElementsByClassName('supportNo')[0].value;
		
		$.ajax({
			type : "post",
			url : "showList.do?support_no=" + support_no,
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				support_no : support_no
			}),
			success : function(result) {
				res.innerHTML = result;
			}
		});
	})
})

// 댓글 닫기
var closeReply = document.querySelectorAll('.closeReply');
closeReply.forEach(close =>{
close.addEventListener('click', (e)=>{
	var target = e.target.parentNode.parentNode;
	
	var res = target.getElementsByClassName('replyArea')[0];
	res.classList.remove('replyActive');
	
	e.target.style.display = "none";
	target.getElementsByClassName('showReply')[0].style.display ="block";
	})
})

// 글 작성
var insertBtn = document.querySelectorAll('.insertBtn');
insertBtn.forEach(insert =>{
	insert.addEventListener('click', ()=>{
		 var member_id = artist_id; // 아티스트 아이디
		 var member_nickname = login_nickname; // 글 작성자 닉네임
		 var support_content = document.getElementById('support_content').value;// 컨텐츠

		    $.ajax({
		        type : "post",
		        url : "supportInsert.do",
		        headers : {
		            "Content-Type" : "application/json"
		        },
		        data : JSON.stringify({
		            member_id : member_id,
		            member_nickname : member_nickname,
		            support_content : support_content
		        }),
		        success : function(result) {
		        	console.log(result);
		        	listRest();
		        }
		    });
	})
});


// 글 삭제 -- 댓글 있는 글은 삭제 안됨
var deleteBtn = document.getElementsByClassName('deleteBtn');
for (var i= 0; i< deleteBtn.length; i++){
    deleteBtn[i].addEventListener('click', (e)=>{
    	var res = confirm('삭제하시겠습니까?');
    	if(res){
    		var target = e.target.parentNode;
    		var support_no = target.getElementsByClassName('supportNo')[0].value;
    		console.log(support_no + " 삭제할번호");
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
    				console.log(res);
    				listRest();
    			}
    		});
    	}
    })
}


// 글 수정 - 완료
var updateBtn = document.getElementsByClassName('updateBtn');
for (var i= 0; i< updateBtn.length; i++){
    updateBtn[i].addEventListener('click', (e)=>{ 
    	
    	var target = e.target.parentNode.parentNode;
    	var res = target.getElementsByClassName('change')[0];
    	res.removeAttribute("readonly"); 
    	res.classList.add("changeActive");
    	e.target.style.display = "none";
    	target.getElementsByClassName('updateRes')[0].style.display = "block";
    })
}

var updateRes = document.getElementsByClassName('updateRes'); 
for (var i= 0; i< updateRes.length; i++){
updateRes[i].addEventListener('click', (e)=>{
	
	var target = e.target.parentNode.parentNode;
	var res = target.getElementsByClassName('change')[0];
	
	var support_content = target.getElementsByClassName('change')[0].value;
	var support_no = target.getElementsByClassName('supportNo')[0].value;
	
	$.ajax({
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
			e.target.style.display = "none";
			target.getElementsByClassName('updateBtn')[0].style.display = "block";
		}
	})
})
}

// 게시글 리스트 출력
function listRest() {
	console.log("출력확인");
	$.ajax({
		type : "get",
		url : "artist.do?member_id="+artist_id,
		success : function(result) {
			// 시간날 때 효율적으로 다시 짜기
			var htmlObj = $(result);
			/*
			 * var res = htmlObj.find('.supportTable');
			 * $('.supportTable').replaceWith(res);
			 */
			$(htmlObj).find('ul.tabs li').removeClass('tabCurrent');
			$(htmlObj).find('#tab-1').removeClass('tabCurrent');
			$(htmlObj).find('ul.tabs li:nth-child(2)').addClass('tabCurrent');
			$(htmlObj).find('#tab-2').addClass('tabCurrent');
			$('body').html(htmlObj);
		}
	});
}

// 댓글입력
function replyInsert(e){
	var target = e.parentNode.parentNode.querySelector('.replyContent');
	var comm_content = target.value;
	var member_id = login_id;
	var supportTarget =e.parentNode.parentNode.parentNode.parentNode;
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
			support_no : support_no
		}),
		success: function(result){
			console.log(result)
			replyRest(support_no, supportTarget);
		}
    })
}

//댓글수정
function replyUpdate(e){
	e.style.display = "none";
	var doneBtn = e.parentNode.getElementsByClassName('updateDone')[0];
	doneBtn.style.display = "block";
	
	var content = e.parentNode.parentNode.querySelector('.comm_content');
	content.readOnly = false;
	content.classList.add('commActive');
}

function updateDone(e){
	var comm_no = e.parentNode.querySelector('.replyNum').value;
	var target= e.parentNode.parentNode.querySelector('.comm_content');
	var comm_content = target.value;
	
	$.ajax({
        type : "post",
        url : "commUpdate.do?comm_no="+comm_no,
        headers : {
			"Content-Type" : "application/json"
		},
		dateType : "text",
		data : JSON.stringify({
			comm_no : comm_no,
			comm_content : comm_content
		}),
		success: function(result){
			console.log(result)
		}
    }).done(function(){
    	e.style.display ="none";
    	var updateBtn = e.parentNode.getElementsByClassName('replyUpdate')[0];
    	updateBtn.style.display = "block";
    	target.readOnly = true;
    	target.classList.remove('commActive');
    });
};

//댓글삭제
function replyDelete(e){
	var res = confirm('삭제하시겠습니까?');
	var supportTarget =e.parentNode.parentNode.parentNode.parentNode;
	
	if(res){
		var comm_no = e.parentNode.querySelector('.replyNum').value;
		var support_no = e.parentNode.querySelector('.supportNum').value;
		
		$.ajax({
		        type : "post",
		        url : "commDelete.do?comm_no="+comm_no,
		        success : function(result) {
		        	console.log(result);
		        	replyRest(support_no, supportTarget);
		        }
		    });
	}
}

//댓글 rest 출력
function replyRest(support_no, supportTarget){
	$.ajax({
		type : "post",
		url : "showList.do?support_no=" + support_no,
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			support_no : support_no
		}),
		success : function(result) {
			supportTarget.querySelector('.replyArea').innerHTML = result;
		}
	});
}

//------프로필
function updateProfile(){
    window.name = "artistPage.do";
    window.open("updateForm.do", "insert",
                "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
}