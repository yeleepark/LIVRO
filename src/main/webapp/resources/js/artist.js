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

//------팔로우
function follow(e){
	var target = e.nextSibling.nextSibling;
	e.style.display = "none";
	target.style.display = "block";
}

//------언팔로우
function unfollow(e){
	var ask = confirm('언팔로우 하시겠습니까?');
	var target = e.previousSibling.previousSibling;
	if(ask){
		e.style.display = "none";
		target.style.display = "block";
	}
}

//------프로필변경
function updateProfile(){
    window.name = "artistPage.do";
    window.open("updateForm.do", "insert",
                "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
}