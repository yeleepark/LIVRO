var button = document.getElementById('btn-open-or-join-room');
var title_res = document.getElementById("title_res");
var category_res = document.getElementById("category_res");
var content_res = document.getElementById('content_res');
var header = document.getElementById('header');

button.addEventListener("click", function(){
	console.log(" 버튼 클릭");
var title = document.getElementById("broadcast_title").value;
	title_res.innerHTML = title;
	
var category = document.getElementById("broadcast_category");
	category = category.options[category.selectedIndex].value;
	console.log(category);
	category_res.innerHTML = category;
	
var content = document.getElementById('broadcast_content');
	content_res.innerHTML = content.value;
	
	header.style.backgroundColor = 'black';
})

