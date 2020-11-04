var menuIcon = document.getElementById('menuIcon'), sideBar = document
		.getElementsByClassName('side-bar')[0];

menuIcon.addEventListener('click', function() {
	sideBar.classList.toggle('mainActive');
	sideBar.classList.add('side-bar');

	if (sideBar.classList.contains('mainActive') || null) {
		sideBar.classList.remove('side-bar')
	}

	var mainActive = document.getElementsByClassName('mainActive')[0];

	if (mainActive != undefined) {
		mainActive.addEventListener('click', function() {
			sideBar.classList.remove('mainActive');
			sideBar.classList.add('side-bar');
		})
	}

});



var Notification = window.Notification || window.mozNotification || window.webkitNotification;

window.onload = function() {
	Notification.requestPermission();
	if (Notification.permission === "granted") {
        new Notification("Hi, Notification");
        console.log("실패")
      } else {
        alert('Notification denied');
      }
}