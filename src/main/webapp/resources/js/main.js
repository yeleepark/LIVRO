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

let mainArea = document.getElementsByTagName('main')[0];

mainArea.addEventListener('click', function() {
	sideBar.classList.add('side-bar')
	sideBar.classList.remove('active')
})
