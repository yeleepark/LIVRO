let menuIcon = document.getElementById('menuIcon'), 
	sideBar = document.getElementsByClassName('side-bar')[0];

menuIcon.addEventListener('click', function() {
	sideBar.classList.toggle('active');
	if (sideBar.classList.contains('active') || null) {
		sideBar.classList.remove('side-bar')
	} else {
		sideBar.classList.add('side-bar');
	}
});