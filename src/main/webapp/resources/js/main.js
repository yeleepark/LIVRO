var menuIcon = document.getElementById('menuIcon'), 
	sideBar = document.getElementsByClassName('side-bar')[0];

menuIcon.addEventListener('click', function() {
	sideBar.classList.toggle('mainActive');
	if (sideBar.classList.contains('mainActive') || null) {
		sideBar.classList.remove('side-bar')
	} else {
		sideBar.classList.add('side-bar');
	}
});