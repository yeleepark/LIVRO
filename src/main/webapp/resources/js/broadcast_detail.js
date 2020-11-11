		const donaPrice = document.getElementById('donaFirst');
		const price = document.getElementById('price');
		const donaSlidePrice = document.getElementById('donaSlidePrice');
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
        	price.value = price.min;
        	donaSlidePrice.innerHTML= price.min;
		}
        
		function donaNo(){
        	$('#donaProcess').hide();
        	donaSlidePrice.innerHTML = '';
		}	
		
		donaPrice.addEventListener('click', (e) => {
		if(e.target.value != null){
			donaSlidePrice.innerHTML = e.target.value;
			price.value = e.target.value;
			}
		})
		
		price.addEventListener('input', (e) => {
			donaSlidePrice.innerHTML = e.currentTarget.value;
		})