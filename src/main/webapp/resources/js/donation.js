function pay(){
					let price = $('#scale').val();
					let member_id = $('#user_id').val();
					let dona_id =  $('#artist_id').text();
					let username = $('#member_name').val(); 
					let email = $('#member_email').val();
					
                    BootPay.request({
                    price, //실제 결제되는 가격
                    application_id: "5f8d191a4f74b4001d74141d",
                    name: dona_id + '님에게 후원', //결제창에서 보여질 이름
                    pg: 'inicis',
                    method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
                    show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
                    items: [
                        {
                            item_name: '나는 아이템', //상품명
                            qty: 1, //수량
                            unique: '123', //해당 상품을 구분짓는 primary key
                            price //상품 단가
                        }
                    ],
                    user_info: {
                        username,
                        email,
                    }, 
                    order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
                    params: { member_id, dona_id },
                    account_expire_at: '2020-10-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
                }).error(function (data) {
                    //결제 진행시 에러가 발생하면 수행됩니다.
                    console.log(data);
                }).cancel(function (data) {
                    //결제가 취소되면 수행됩니다.
                    console.log(data);
                }).ready(function (data) {
                    // 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
                    console.log(data);
                }).confirm(function (data) {
                    //결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다. 
                    //주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
                    console.log(data);
                    var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
                    if (enable) {
                        BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
                    } else {
                        BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
                    }
                }).close(function (data) {
                    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
                    console.log(data);
                }).done(function (data) {
                    //결제가 정상적으로 완료되면 수행됩니다
                    //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
					console.log(data);
					
					let dona_info = {
                              		 member_id,
                                     dona_price: price,
/*                                     dona_date: data.purchased_at,*/
                               		 dona_id};

                    $.ajax({
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
                    }).done(function(){
						let donaDone = '님이' + price + '원을 후원하셨습니다!';
                        donaNo();
						appendDIV(donaDone);
						connection.send(donaDone);
                    })
					
                });
            }