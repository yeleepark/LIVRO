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
		
		var res = target.getElementsByClassName('replyArea');
		var res2 = target.getElementsByClassName('replyInsertArea')[0];
		
		for(var i =0; i < res.length ; i ++){
			res[i].classList.add('replyActive');
		}
		res2.classList.add('insertActive');
		
		e.target.style.display = "none";
		target.getElementsByClassName('closeReply')[0].style.display ="inherit";
		
		var support_no = target.getElementsByClassName('supportNo')[0].value;
		console.log(support_no + " 댓글보기클릭")
		
		$.ajax({
			type : "post",
			url : "showList.do?support_no=" + support_no,
			headers : {
				"Content-Type" : "application/json"
			},
			dateType : "text",
			data : JSON.stringify({
				support_no : support_no
			}),
			success : function(result) {
			/*	for(var i = 0; i < result.length; i++){
					var firstDiv = document.createElement('div');
					firstDiv.classList.add('rows-left');
					var p = document.createElement('p');
					var first = firstDiv.appendChild(p);
					first.innerHTML = result[i].member_id;
					
					var secondDiv = document.createElement('div');
					secondDiv.classList.add('rows-center');
					var textArea = document.createElement('textarea');
					var second = secondDiv.appendChild(textArea);
					second.innerHTML = result[i].comm_content;
					
					var thirdDiv = document.createElement('div');
					thirdDiv.classList.add('rows-right');
					var inputUpdate = document.createElement('input');
					inputUpdate.setAttribute('type', 'button');
					inputUpdate.setAttribute('value', '수정');
					inputUpdate.classList.add('commUpdate')
					var inputUpdateRes = document.createElement('input');
					inputUpdateRes.setAttribute('type', 'button');
					inputUpdateRes.setAttribute('value', '완료');
					inputUpdateRes.classList.add('commUpdateRes')
					var inputDelete = document.createElement('input');
					inputDelete.setAttribute('type', 'button');
					inputDelete.setAttribute('value', '삭제');
					inputDelete.classList.add('commDelete')
					thirdDiv.appendChild(inputUpdate);
					thirdDiv.appendChild(inputUpdateRes);
					thirdDiv.appendChild(inputDelete);	
					
					console.log('-------');
					console.log(firstDiv)
					console.log(secondDiv)
					console.log(thirdDiv)
					console.log('-------');
					
					res[i].appendChild(firstDiv);
					res[i].appendChild(secondDiv);
					res[i].appendChild(thirdDiv);
					
				}*/
			}
		});
	})
})

// 댓글 닫기
var closeReply = document.querySelectorAll('.closeReply');
closeReply.forEach(close =>{
close.addEventListener('click', (e)=>{
	var target = e.target.parentNode.parentNode;
	
	
	var res = target.getElementsByClassName('replyArea');
	var res2 = target.getElementsByClassName('replyInsertArea')[0];
	
	for(var i =0; i < res.length; i++){
		res[i].classList.remove('replyActive');
	}
	
	res2.classList.remove('insertActive');
	
	e.target.style.display = "none";
	target.getElementsByClassName('showReply')[0].style.display ="block";
	
	})
})

// 글 작성
var insertBtn = document.querySelectorAll('.insertBtn');
insertBtn.forEach(insert =>{
	insert.addEventListener('click', ()=>{
		console.log('인서트 클릭');
		 var member_id = artist_id; // 아티스트 아이디
		 var member_nickname = login_nickname; // 글 작성자 닉네임
		 var support_content = document.getElementById('support_content').value;// 컨텐츠
		 console.log(support_content);

		    $.ajax({
		        type : "post",
		        url : "supportInsert.do",
		        headers : {
		            "Content-Type" : "application/json"
		        },
		        dateType : "html", // 서버에서 반환되는 데이터 형식
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

// 댓글입력 --
var replyDone = document.querySelectorAll('.replyDone');
replyDone.forEach(reply =>{
	reply.addEventListener('click', (e)=>{
		console.log('댓글 작성 클릭');
		var target = e.target.parentNode;
		var support_no = target.getElementsByClassName('supportNo')[0].value;
		var member_id = artist_id;
		var comm_content = target.parentNode.getElementsByClassName('replyContent')[0].value;
		console.log(support_no + " " + member_id + " " + comm_content);
		
		    $.ajax({
		        type : "post",
		        url : "commInsert.do",
		        headers : {
		            "Content-Type" : "application/json"
		        },
		        data : JSON.stringify({
		            support_no : support_no,
		            member_id : member_id,
		            comm_content : comm_content
		        }),
		        success : function(result) {
		        	console.log("댓글입력 성공" + result);
// showReply(support_no);
		        }
		    });
	})
});

function showReply(support_no) {
	
	console.log(support_no + " 댓글 게시글 번호");
	$.ajax({
		type : "post",
		url : "showList.do?support_no=" + support_no,
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			support_no : support_no
		}),
		success : function(data) {
			alert('댓글 보여준다!')
			console.log(data); // 일단 성공
			console.log(typeof (data))
		}
	})
}


//------프로필
function updateProfile(){
    window.name = "artistPage.do";
    window.open("updateForm.do", "insert",
                "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
}