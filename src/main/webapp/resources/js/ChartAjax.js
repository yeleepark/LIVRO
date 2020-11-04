window.addEventListener('load', () =>{
		var member_id = document.getElementsByName('member_id')[0].value;
		var dona_nickname = document.getElementsByName('member_nickname')[0].value;
		
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
		
		// artist의 일별 후원 받은 통계
		$.ajax({
			url: 'selectDaily.do',
			type: 'GET',
			contentType: 'application/json',
			dataType: 'json',
			data: {dona_nickname},
			error: function(){
				console.log('통신실패');
			}
		}).done(function(list){
			var donaAll_1 = document.getElementById('donaAll_1');
			var a = 0;
			for(var key in list){
				chartData_1.data.labels.push(list[key].DONA_DATE);
				chartData_1.data.datasets[0].data.push(list[key].DONA_PRICE);
				a += list[key].DONA_PRICE;
			}
			donaAll_1.innerHTML = a;
		})
	})