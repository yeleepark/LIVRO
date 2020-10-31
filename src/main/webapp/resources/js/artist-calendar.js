// 해당 아티스트의 아이디
var artist_id = document.getElementById('artistId').value;
// 로그인한 유저의 아이디
var login_id = document.getElementById('loginId').value;
// 로그인한 유저의 닉네임
var login_nickname = document.getElementById('loginNickname').value;
// 일정 리스트 
var getCalNo = document.getElementsByClassName('cal_no');
var getMemberId = document.getElementsByClassName('cal_member_id');
var getCalTitle = document.getElementsByClassName('cal_title');
var getCalStart = document.getElementsByClassName('cal_start');
var getCalEnd = document.getElementsByClassName('cal_end');
// 버튼
var today = document.getElementById('today');
var prevBtn = document.getElementById('prevBtn');
var nextBtn = document.getElementById('nextBtn');
var dayBtn = document.getElementById('dayBtn');
var weekBtn = document.getElementById('weekBtn');
var monthBtn = document.getElementById('monthBtn');

// ------------------------ 캘린더
var tab3 = document.getElementById('tab3');
var calendarArea = document.getElementById('calendar');

var Calendar = tui.Calendar;
var calendar = new Calendar('#calendar', {
	useDetailPopup: true,
	useCreationPopup: true,
	taskView: false,
	theme: {
		'week.timegridOneHour.height': '30px',
		'week.timegridHalfHour.height': '15px',
	},
	isReadOnly : (artist_id==login_id)? false:true,
});


// 캘린더 탭 눌렀을 때 달력 리로드
tab3.addEventListener('click', () => {
	calendar.changeView('month', true);
})

//오늘 날짜로 이동
today.addEventListener('click', () => {
	calendar.today();
});

// 현재 뷰 기준 이전으로 이동
prevBtn.addEventListener('click', () => {
	calendar.prev();
});

// 현재 뷰 기준 다음으로 이동
nextBtn.addEventListener('click', () => {
	calendar.next();
});

// 일간 뷰로 변경
dayBtn.addEventListener('click', () => {
	calendar.changeView('day', true);
});

// 주간 뷰로 변경
weekBtn.addEventListener('click', () => {
	calendar.changeView('week', true);
});

// 월간 뷰로 변경
monthBtn.addEventListener('click', () => {
	calendar.changeView('month', true);
});


// 캘린더 아이디 - 아티스트 별로 캘린더 생성
calendar.setCalendars([
	{
		id: artist_id, // 아티스트 아이디
		name: artist_id+'님의 공연', // 카테고리에 뜰 이름
		color: '#ffffff',
		bgColor: '#ff5583',
		dragBgColor: '#ff5583',
		borderColor: '#ff5583'
	}
]);



// 일정생성
calendar.on('beforeCreateSchedule', scheduleData => {
	
	console.log('일정생성클릭하면');
	console.log(scheduleData.title);
	console.log(scheduleData.calendarId);
	console.log(scheduleData.start.toDate());
	console.log(scheduleData.end.toDate());
	console.log('ajax로 이동');
	
	$.ajax({
		type : "post",
		url : "calInsert.do" ,
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
            cal_title : scheduleData.title,
            member_id : scheduleData.calendarId,
            cal_start : scheduleData.start.toDate(),
            cal_end : scheduleData.end.toDate(),
        }),
		success : function(result) {
			alert('일정 생성 완료');
			
			calendar.createSchedules([
			    {
			        id: result[0].cal_no,
			        calendarId: result[0].member_id,
			        title: result[0].cal_title,
			        category: 'time',
			        start: result[0].cal_start,
			        end: result[0].cal_end
			    }
			])
		}
	});
});

//----------------------------------------------------------------------------------------
// 일정수정
calendar.on('beforeUpdateSchedule', event => {
	const { schedule, changes } = event;
	
	var member_id = schedule.calendarId; // 아티스트 아이디
	var cal_no = schedule.id;
	
	var cal_title = schedule.title;
	var cal_start = schedule.start.toDate();
	var cal_end = schedule.end.toDate();
	
	if(changes.title != null){
		cal_title = changes.title;
	}
	
	if(changes.start != null){
		cal_start = changes.start.toDate();
	}
	
	if(changes.end != null){
		cal_end = changes.end.toDate();
	}
	
	$.ajax({
		type : "post",
		url : "calUpdate.do" ,
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			cal_no : cal_no,
            cal_title : cal_title,
            member_id : member_id,
            cal_start : cal_start,
            cal_end : cal_end
        }),
		success : function() {
			alert('일정 수정 완료');
			calendar.updateSchedule(schedule.id, schedule.calendarId, changes);
		}
	});
});

// 일정삭제
calendar.on('beforeDeleteSchedule', scheduleData => {
	const { schedule } = scheduleData;
	var cal_no = schedule.id;
	$.ajax({
		type : "post",
		url : "calDelete.do" ,
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			cal_no : cal_no
        }),
		success : function() {
			alert('일정 삭제 완료');
			calendar.deleteSchedule(schedule.id, schedule.calendarId);
		}
	});
});


//팝업 디테일 - 리스트 출력 완료
for (var i = 0; getCalNo.length; i++){
	calendar.createSchedules([
		{
			id: getCalNo[i].value, // 스케쥴 번호 (시퀀스)
			calendarId: getMemberId[i].value, // 테이블 번호 (즉 아티스트 아이디)
			title: getCalTitle[i].value, // 일정 타이틀
			category: 'time', // 일반 일정 디폴트 값 time
			start: getCalStart[i].value, // 시작 시간
			end: getCalEnd[i].value  // 끝나는 시간
		}
	]);
	
}



