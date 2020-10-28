var tab3 = document.getElementById('tab3');
var calendarArea = document.getElementById('calendar');

var Calendar = tui.Calendar;
var calendar = new Calendar('#calendar', {
	useDetailPopup: true,
	useCreationPopup: true,
	taskView: false,
	month: {
		visibleWeeksCount: 3 
	},
	theme: {
		'week.timegridOneHour.height': '30px',
		'week.timegridHalfHour.height': '15px',
	},
	// isReadOnly : true
});

// 3번째 탭 눌렀을 때 달력 리로드
tab3.addEventListener('click', () => {
	calendar.changeView('month', true);
})

var today = document.getElementById('today');
var prevBtn = document.getElementById('prevBtn');
var nextBtn = document.getElementById('nextBtn');
var dayBtn = document.getElementById('dayBtn');
var weekBtn = document.getElementById('weekBtn');
var monthBtn = document.getElementById('monthBtn');

// 오늘 날짜로 이동
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
	
// 캘린더 아이디 (아티스트 아이디)
calendar.setCalendars([
	{
		id: 'live', //아티스트 아이디
		name: '라이브',
		color: '#ffffff',
		bgColor: '#ff5583',
		dragBgColor: '#ff5583',
		borderColor: '#ff5583'
	}
]);

// 팝업 디테일
calendar.createSchedules([
	{
		id: '333', // 스케쥴 번호 (시퀀스)
		calendarId: 'live', // 테이블 번호 (즉 아티스트 아이디)
		title: '스케쥴 이름', // 일정 타이틀
		category: 'time', // 일반 일정 디폴트 값 time
		start: '2020-10-28T10:00:00', // 시작 시간
		end: '2020-10-28T11:00:00' // 끝나는 시간
	}
]);

// 일정생성
calendar.on('beforeCreateSchedule', scheduleData => {
	const schedule = {
		calendarId: scheduleData.calendarId, // 멤버 정보
		id: String(Math.random() * 100000000000000000), // 일정번호
		title: scheduleData.title,
		start: scheduleData.start,
		end: scheduleData.end,
		category: scheduleData.isAllDay ? 'allday' : 'time'
	};
		calendar.createSchedules([schedule]);
		alert('일정 생성 완료');
});


// 일정수정
calendar.on('beforeUpdateSchedule', event => {
	const { schedule, changes } = event;
		calendar.updateSchedule(schedule.id, schedule.calendarId, changes);
});

// 일정삭제
calendar.on('beforeDeleteSchedule', scheduleData => {
	const { schedule } = scheduleData;
		calendar.deleteSchedule(schedule.id, schedule.calendarId);
});