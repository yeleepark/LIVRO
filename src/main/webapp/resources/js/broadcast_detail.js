        function needLogin(){
           console.log('로그인요청');
           $('#needLogin').fadeIn();
           document.getElementById('member_id').focus();
        }
        
        function closeLogin(){
        	$('#needLogin').fadeOut();
        	document.getElementById('member_id').value = '';
        	document.getElementById('member_pw').value = '';
        }
        
		function donaDo(){
        	$('#donaProcess').fadeIn();
		}
        
		function donaNo(){
        	$('#donaProcess').fadeOut();
		}	
		
		const donaPrice = document.getElementById('donaFirst');
		donaPrice.addEventListener('click', (e) => {
			document.getElementById('donaSlidePrice').value = e.target.value;
		})
		
		const price = document.getElementById('price');
		price.addEventListener('input', (e) => {
			document.getElementById('donaSlidePrice').value = e.currentTarget.value;
		})