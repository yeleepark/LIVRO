function pay(){
					let price = $('#price').val();			// 선택한 금액
					let member_id = $('#member_Id').val();	// 멤버 아이디
					let username = $('#member_name').val(); // 멤버 이름
					let email = $('#member_email').val();	// 멤버 이메일
					let dona_id =  $('#artist_id').text();  // 후원받는 아이디
					let artist_nickname = $('#artist_nickname').text()
					
                    BootPay.request({
                    price,								    //실제 결제되는 가격
                    application_id: "5f8d191a4f74b4001d74141d",
                    name: artist_nickname + '님에게 후원',		//결제창에서 보여질 이름
                    pg: 'inicis',
                    method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
                    show_agree_window: 0,                   // 부트페이 정보 동의 창 보이기 여부
                    items: [
                        {
                            item_name: '나는 아이템',			//상품명
                            qty: 1, 					    //수량
                            unique: '123', 					//해당 상품을 구분짓는 primary key
                            price 							//상품 단가
                        }
                    ],
                    user_info: {
                        username,							//결제시 보여지는 멤버 이름
                        email,								//결제내역 전송을 위한 멤버 이메일
                    }, 
                    order_id: '고유order_id_1234', 			//고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
                    params: { member_id, dona_id },
                    account_expire_at: '2020-10-25', 		// 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
                }).error(function (data) {
                    console.log(data);
                }).cancel(function (data) {
                    console.log(data);
                }).ready(function (data) {
                    console.log(data);
                }).confirm(function (data) {
                    console.log(data);
                    var enable = true; 
                    if (enable) {
                        BootPay.transactionConfirm(data); 
                    } else {
                        BootPay.removePaymentWindow(); 
                    }
                }).close(function (data) {					//결제 여부와 상관 없이 창이 닫힐 때 수행
                    console.log(data);
                }).done(function (data) {					//결제 완료시 수행
					console.log(data);
					
					let dona_info = {
                              		 member_id,
                                     dona_price: price,
								   /*dona_date: data.purchased_at,*/
                               		 dona_id};

                    $.ajax({								//DB에 데이터 전송
                        url: 'donation.do',
                        type: 'post',
						contentType: 'application/json',
                        data: JSON.stringify(dona_info),
						dataType: "text",
                        success: function(msg){
							console.log(msg);
                        },
                        error: function(msg){
							console.log(msg);
                        }
                    }).done(function(){						//INSERT 완료시 수행
						let donaDone = '님이' + price + '원을 후원하셨습니다!';
                        donaNo();
						appendDIV(donaDone);				//멤버 채팅창에 메시지 출력
						connection.send(donaDone);			//상대방 채팅창에 메시지 출력
                    })
                });
            }