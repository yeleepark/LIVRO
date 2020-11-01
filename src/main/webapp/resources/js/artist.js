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


//------프로필변경
function updateProfile(){
    window.name = "artistPage.do";
    window.open("updateForm.do", "insert",
                "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
}