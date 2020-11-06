	var lastnum = 10;
		console.log(lastnum);
		$(document)
				.ready(
						function() {

							/* var lastnum= ${fn:length(list)} */

							$(window).scroll(
									function() {
										if ($(window).scrollTop()
												+ $(window).height() == $(
												document).height()) {
											getList();
										}
									});

							function getList() {
								//ajax 실행 데이터 가져오기
								$
										.ajax({
											url : 'infinitescroll.do',
											data : {
												"lastnum" : lastnum
											},
											type : 'post',
											success : function(data) {
												var str = "";
												console.log("데이터 가져옴");
												$
														.each(
																data,
																function(i) {
																	str += "<div class='brolist_wrapper'>"
																			+ "<div class='broadcast-thumnail'>"
																			+ "<a><img src='/resources/profileimg/"+data[i].member_profile+"'></a>"
																			+ "</div>"
																			+ "<div class='broadcast-name'>"
																			+ "<div>"
																			+ "<p> 아티스트 : <a href='artist.do?member_id="
																			+ data[i].member_id
																			+ "'>"
																			+ data[i].member_nickname
																			+ "</a>"
																			+ "</p>"
																			+ "</div>"
																			+ "<div>"
																			+ "<p> 방송 제목 : <a href='broadDetail.do?broadcast_no="
																			+ data[i].broadcast_no
																			+ "'>"
																			+ data[i].broadcast_title
																			+ "</a>"
																			+ "</p>"
																			+ "</div>"
																			+ "<div>"
																			+ "<p>방송 내용 : "
																			+ data[i].broadcast_content
																			+ "</p>"
																			+ "</div>"
																			+ "<div>"
																			+ "<p>방송 카테고리 : "
																			+ data[i].broadcast_category
																			+ data[i].broadcast_no
																			+ "</p>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																})
												console
														.log("10개중에"
																+ data.length
																+ "개 가져옴");

												var ele = document
														.createElement('div');
												ele.innerHTML = str;
												$(".broadcast-table>div")
														.last().after(ele);
												lastnum += 10;
											},
											error : function(error) {
												alert("통신실패!");
											}
										});
							}
						});
						
						
						/*방송 없을 떄*/

	let ele = document.getElementsByClassName(('broadcast-table'))[0];
	let h1 = document.createElement('h1');

	if (ele.childElementCount < 1) {

		// 방송이 하나도 없을 때 출력되는 메시지
		h1.innerHTML = '진행중인 방송이 없습니다 헤헤';

		ele.appendChild(h1);

	}
