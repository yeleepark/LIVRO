window.addEventListener('load', () =>{
		var member_id = document.getElementsByName('member_id')[0].value;
		$.ajax({
			url: 'selectMap.do',
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
	})