<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/css/broadcast_list.css">

<title>LIVRO</title>
<style type="text/css">
#section {
	padding-top: 80px;
}
</style>
</head>
<body>
	<script>
		var lastnum = 10;
		console.log(lastnum);
		$(document)
				.ready(
						function() {

							/* var lastnum= ${fn:length(list)} */

							$(window).scroll(
									function() {
										if ($(window).scrollTop()+ $(window).height() == $(document).height()) {
												getList();
										}
									});

							function getList() {
								//ajax 실행 데이터 가져오기
								$.ajax({
											url : 'infinitescroll.do',
											data : {
												"lastnum" : lastnum
											},
											type : 'post',
											success : function(data) {
												var str = "";
												console.log("데이터 가져옴");
												$.each(data,function(i) {
																	str += "<div class='brolist_wrapper'>"
																			+"<div class='broadcast-thumnail'>"
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
																			+ data[i].broadcast_category+data[i].broadcast_no
																			+ "</p>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																})
																console.log("10개중에"+data.length+"개 가져옴");
																
												var ele = document.createElement('div');
												ele.innerHTML = str;
												$(".broadcast-table>div").last().after(ele);
												lastnum += 10;
											},
											error : function(error) {
												alert("통신실패!");
											}
										});
							}
						});
	</script>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section id="section">
		<c:if test="${logindto.member_role == 'A' }">
			<input type="button" id="broadgo" value="방송하기"
				onclick="location.href='live.do?member_id=${logindto.member_id}'">

		</c:if>

		<div class="broadcast-table" id="broadcast-table-cnt">
			<c:forEach items="${list }" var="dto" varStatus="status">

				<c:if test="${dto.broadcast_flag eq 'Y' }">
					<div value="${status.count}" class="brolist_wrapper">
						<div class="broadcast-thumnail">
							<a><img
								src="/resources/profileimg/${profiledto.profile_savedname }"></a>
						</div>
						<div class="broadcast-name">
							<div>
								<p>
									아티스트 : <a href="artist.do?member_id=${dto.member_id }">${dto.member_nickname }</a>
								</p>
							</div>
							<div>
								<p>
									방송 제목 : <a
										href="broadDetail.do?broadcast_no=${dto.broadcast_no }">${dto.broadcast_title }</a>
								</p>
							</div>
							<div>
								<p>방송 내용 : ${dto.broadcast_content }</p>
							</div>
							<div>
								<p>방송 카테고리 : ${dto.broadcast_category }</p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>
</body>
</html>