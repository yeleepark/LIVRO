window.addEventListener('load', () =>{
		let member_id = document.getElementsByName('member_id')[0].value;
		let dona_nickname = document.getElementsByName('member_nickname')[0].value;
		
		// 아티스트별 후원 통계
		$.ajax({
			url: 'selectByMember.do',
			type: 'GET',
			contentType: 'application/json',
			dataType: 'json',
			data: {member_id},
			error: function(){
				console.log('통신실패');
			}
		}).done(function(list){
			var donaAll = document.getElementById('donaAll');
			var a = 0;
			for(var key in list){
				chartData.data.labels.push(list[key].DONA_NICKNAME);
				chartData.data.datasets[0].data.push(list[key].DONA_PRICE);
				a += list[key].DONA_PRICE;
			}
			donaAll.innerHTML = a;
		})
		
		$.ajax({
			url: 'selectAmountByUser.do',
			type: 'GET',
			contentType: 'application/json',
			dataType: 'json',
			data: {dona_nickname},
			error: function(){
				console.log('통신실패');
			}
		}).done(function(dto){
			console.log(dto);
			var donaAll_1 = document.getElementById('donaAll_1');
			donaAll_1.innerHTML = dto.dona_price;
			
		})
		// artist의 월별 일일 후원 받은 통계
		let date = new Date();
		let dona_month = date.getMonth() + 1;
		console.log(dona_month)
		$.ajax({
			url: 'selectDaily.do',
			type: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify({dona_nickname, dona_month}),
			error: function(){
				console.log('통신실패');
			}
		}).done(function(list){
			let a = 0;
			for(var key in list){
				chartData_1.data.labels.push(list[key].DONA_DATE);
				chartData_1.data.datasets[0].data.push(list[key].DONA_PRICE);
				a += list[key].DONA_PRICE;
			}
			
			donaMonth_1.innerHTML = a;
		})
	})
	
function selectMonth(){
	let dona_nickname = document.getElementsByName('member_nickname')[0].value;
	let selMonth = document.getElementById("selectMonth");
	let dona_month = selMonth.options[selMonth.selectedIndex].value;
	console.log(dona_month);
			$.ajax({
			url: 'selectDaily.do',
			type: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify({dona_nickname, dona_month}),
			error: function(){
				console.log('통신실패');
			}
		}).done(function(list){
			console.log(list);
			let a = 0;
			
			chartData_1.data.labels = [];
		    chartData_1.data.datasets[0].data= [];

			chart_1.update();
			
			for(var key in list){
				chartData_1.data.labels.push(list[key].DONA_DATE);
				chartData_1.data.datasets[0].data.push(list[key].DONA_PRICE);
				a += list[key].DONA_PRICE;
			}
			
			chart_1.update();
			
			donaMonth_1.innerHTML = a;
		})
}