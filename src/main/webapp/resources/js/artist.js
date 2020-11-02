//------Tab menu
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

// 해당 아티스트의 아이디
var artist_id = document.getElementById('artistId').value;
// 해당 아티스트의 닉네임
var artist_nickname = document.getElementById('artistNickname').value; 
// 로그인한 유저의 아이디
var member_id = document.getElementById('loginId').value;
// 로그인한 유저의 닉네임
var member_nickname = document.getElementById('loginNickname').value;

console.log("아티스트 아이디 " + artist_id);
console.log("아티스트 닉네임 " + artist_nickname);
console.log("로그인 아이디 " + member_id);
console.log("로그인 닉네임 = " + member_nickname);

// ------팔로우
function follow(e){
	var target = e.nextSibling.nextSibling;
	
	$.ajax({
        type : "post",
        url : "follow.do",
        headers : {
            "Content-Type" : "application/json"
        },
        data : JSON.stringify({
            member_id : member_id,
            member_nickname : member_nickname,
            artist_id : artist_id,
        	artist_nickname : artist_nickname
        }),
        success : function(result) {
        	if(result > 1){
        		e.style.display = "none";
        		target.style.display = "block";
        	}
        }
    });
}

// ------언팔로우
function unfollow(e){
	var target = e.previousSibling.previousSibling;
	var ask = confirm('언팔로우 하시겠습니까?');
	if(ask){
		$.ajax({
	        type : "post",
	        url : "unfollow.do",
	        headers : {
	            "Content-Type" : "application/json"
	        },
	        data : JSON.stringify({
	            member_id : member_id,
	            artist_id : artist_id
	        }),
	        success : function(result) {
	        	if(result > 1){
	        		e.style.display = "none";
	        		target.style.display = "block";
	        	}
	        }
	    });
	}
}

// ------프로필변경
function updateProfile(){
    window.name = "artistPage.do";
    window.open("updateForm.do", "insert",
                "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
}