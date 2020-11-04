
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
      
    }
}

var calId = document.getElementsByClassName('calId');
var calDate = document.getElementsByClassName('calDate');

function dateToYear(date) {
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    if (month < 10)  {
        month = '0' + month;
    }
    var date = date.getDate();
    if (date < 10) {
        date = '0' + date;
    }
    var hours = date.getHours(); // 시간 
    var minutes = date.getMinutes(); // 분
    
    return year + '-' + month + '-' + date + " " + hours + ":" + minutes;
}


function clock() {
    var date = new Date();
    // date Object를 받아오고 
    var year = date.getFullYear();	// 연도
    var month = date.getMonth() + 1; // 월 : 월 함수는 0부터 시작이므로 + 1
    var clockDate = date.getDate(); // 일 
    var hours = date.getHours(); // 시간 
    var minutes = date.getMinutes(); // 분
    
    var timeIs = (`${year}-${month}-${clockDate < 10 ? `0${clockDate}` : clockDate} ${hours < 10 ? `0${hours}` : hours}:${minutes < 10 ? `0${minutes }`  : minutes }`);
    // 시간 분 초는 한자리수이면 시계가 어색해보일까봐 10보다 작으면 앞에0을 붙혀주는 작업을 3항연산으로 처리. 

    console.log(timeIs);
    
    for(var i = 0; i < calDate.length; i++) {
        var calYear = calDate[i].value.substr(24, 4);
        var calMonth = calDate[i].value.substr(4, 3);
        switch (calMonth) {
        case 'Jan' :
        	calMonth = '01'
        	break;
        case 'Feb' :
        	calMonth = '02'
        	break;
        case 'Mar' :
        	calMonth = '03'
        	break;
        case 'Apr' :
        	calMonth = '04'
        	break;
        case 'May' :
        	calMonth = '05'
        	break;
        case 'Jun' :
        	calMonth = '06'
        	break;
        case 'Jul' :
        	calMonth = '07'
        	break;
        case 'Aug' :
        	calMonth = '08'
        	break;
        case 'Sep' :
        	calMonth = '09'
        	break;
        case 'Oct' :
        	calMonth = '10'
        	break;
        case 'Nov' :
        	calMonth = '11'
        	break;
        case 'Dec' :
        	calMonth = '12'
        	break;
        }
        var calClockDate = calDate[i].value.substr(8,2);
        var calHours = calDate[i].value.substr(11, 2);
        var calMinutes = calDate[i].value.substr(14, 2);
        
        var showTimeIs = (calYear+"-"+calMonth+"-"+calClockDate+" "+calHours+":"+calMinutes);
        console.log(showTimeIs);
        if (timeIs == showTimeIs) {
        	var notification = new Notification('Notification title', {
                icon: 'resources/img/livro_icon.png',
                body: 'Notification text',
            });

            notification.onclick = function () {
                window.open('http://google.com');
            };
        	
        }
    }
    
}

function init() {

	clock(); // 최초에 clock함수를 한번 실행 
	setInterval(clock, 5000);
	// setInterval이라는 함수로 매초마다 실행.
	// setInterval은 첫번째 파라메터는 함수이고 두번째는 시간인데 밀리초단위. 1000 = 1초 

}


init();


