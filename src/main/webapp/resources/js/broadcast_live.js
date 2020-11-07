var button = document.getElementById('btn-open-or-join-room');
console.log(button);

var title_res = document.getElementById("title_res");
console.log(title_res);

var category_res = document.getElementById("category_res");
console.log(category_res);


button.addEventListener("click", function(){
	console.log(" 버튼 클릭");
var title = document.getElementById("broadcast_title").value;
	title_res.innerHTML = title;
	
var category = document.getElementById("broadcast_category");
	category = category.options[category.selectedIndex].value;
	console.log(category);
	category_res.innerHTML = category;
	
})
