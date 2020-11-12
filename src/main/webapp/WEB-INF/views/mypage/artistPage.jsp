<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/artistPage.css">
<script type="text/javascript"src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="resources/js/ChartAjax.js"></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />
	
	<section>
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">회원정보수정</li>
					<li class="tab-link" data-tab="tab-2">팔로잉목록</li>
					<li class="tab-link" data-tab="tab-3">팔로워목록</li>
					<li class="tab-link" data-tab="tab-4">후원내역조회</li>
					<li class="tab-link" data-tab="tab-5">후원받은조회</li>
				</ul>
			
			<!-- 회원 정보 수정 탭 -->
			<div class="tab-content current" id="tab-1">
				<h2><i class="fas fa-lock"></i> 정보수정</h2>
				<div class="tab-1-container">
					<div class="tab-1-left">
						<label for ="member_id">아이디</label>
						<input type="text" name="member_id" id="member_id" value="${logindto.member_id }" readonly="readonly">
						
						<label for ="member_nickname">닉네임</label>
						<input type="text" name="member_nickname" id="member_nickname" value="${logindto.member_nickname }">
						<input type="button" class="btn" id="nick_chk" onclick="nick_Chk();" value="중복체크"/>
						<div class="msg_check" id="nickname_check"></div>
                  		
						
						<label for ="member_email">이메일</label>
						<input type="text" name="member_email" id="member_email" value="${logindto.member_email }">
						<input type="button" class="btn" id="email_chk" onclick="email_Chk();" value="중복체크"/>
                 		<div class="msg_check" id="email_check"></div>
						
						<label for ="member_addr">주소</label>
						<input type="text" name="member_addr" id="member_addr" value="${logindto.member_addr }">
						
						<label for ="member_phone">전화번호</label>
						<input type="text" name="member_phone" id="member_phone" value="${logindto.member_phone }">
						 <div class="msg_check" id="phone_check"></div>
                 		 <div id="upcheck"></div>
						 <div id="archeck"></div>
						<input type="hidden" name="memebr_role" id="member_role" value="${logindto.member_role }">
						<input type="button" value="수정" onclick="arup()" class="btn"/>
						<input type="button" value="비밀번호 수정" onclick="location.href='userPw.do'" class="pbtn">
						
						 <form action="deleteres.do">
                  			<input type="hidden" name="delMem" value="${logindto.member_id}">	
                  			<input type="submit" value="회원탈퇴" class="deleteres" >
                		 </form>
						
					</div>
					<div class="tab-1-right">
						<p>프로필 사진</p>
						<div class="profileImg"><img src="resources/img/BG.jpg" id="profile"></div>
						<%-- <div class="profileImg"><img src="/resources/profileimg/${profiledto.profile_savedname }"></div> --%>
						<p>서버에 저장된 프로필 사진 이름 : ${profiledto.profile_savedname }</p>
						<p>프로필 사진의 실제 파일 이름 : ${profiledto.profile_realname }</p>
						<p>프로필 사진 등록된 시간 : ${profiledto.profile_regdate }</p>
						<input type="button" value="프로필사진수정" onclick="updateProfile();">	
					</div>
				</div>
			</div>
			
			<!-- 팔로우 목록 탭 -->
			<div class="tab-content" id="tab-2">
				<h2><i class="fas fa-users"></i> 팔로잉 목록</h2>
				<c:choose>
					<c:when test="${empty followdto }">
						<p>팔로우한 아티스트가 없습니다</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${followdto }" var="follow">
							<div class="follow-row">
							<p><a href="artist.do?member_id=${follow.artist_id }">
							<i class="far fa-thumbs-up"></i> <c:out value="${follow.artist_nickname }"/></a></p>
							<span>
							<fmt:formatDate value="${follow.following_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</span>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>		
			</div>
			
			<!-- 팔로워 목록 탭 -->
			<div class="tab-content" id="tab-3">
				<h2><i class="fas fa-users"></i> 팔로워 목록</h2>
				<c:choose>
					<c:when test="${empty followerdto }">
						<p>나를 팔로우한 사용자가 없습니다</p>
					</c:when>
					<c:otherwise>
						<div class="rankNcount">
						<c:forEach items="${rankdto }" var="rank">
							<p><i class="fas fa-thumbtack"></i> 나의 팔로워 순위는 <span>${rank.rank }</span>등입니다</p>
							<p><i class="fas fa-thumbtack"></i> 총 <span>${rank.count }</span>명이 ${logindto.member_nickname}님을 팔로우 하고 있습니다 </p>
						</c:forEach>
						</div>
						<c:forEach items="${followerdto }" var="follower">
							<div class="follow-row">
							<p>
							<i class="far fa-user-circle"></i>
							<c:out value="${follower.follower_nickname }"/></p>
							<span><fmt:formatDate value="${follower.follower_date }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>		
			</div>
			
			<!-- 후원내역조회 -->
			<div class="tab-content" id="tab-4">
				<h2><i class="fas fa-hand-holding-usd"></i> 후원 내역 조회</h2>
				<div class="tab-4-container">
					<div class="tab-4-left">
						<div class="tab-4-1">
							<div class="tab-4-1-1">
								<span class="totalPrice">총후원금액</span>
							</div>
							<div id="donaAll" class="tab-4-1-2"></div>
						</div>
						<div class="tap-4-2">
							<input type="button" onclick="horizonBar(chartData)" value="수직바">
							<input type="button" onclick="pie(chartData);" value="파이">
							<input type="hidden" name="member_nickname" value="${logindto.member_nickname}">
							<div class="myCharts">
							<canvas id="myChart" class="chartjs">
								This text is displayed if your browser does not support HTML5 Canvas.
							</canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="tab-content" id="tab-5">
				<h2><i class="fas fa-hand-holding-usd"></i> 후원 받은 조회</h2>
				<div class="tab-5-container">
					<div class="tab-5-left">
						<div class="tab-5-1">
							<div class="tab-5-1-1">
								<span class="totalPrice">총후원금액</span>
							</div>
							<div id="donaAll_1" class="tab-5-1-2"></div>
						</div>
						<div class="tap-5-2">
							<input type="button" onclick="horizonBar(chartData_1)" value="수직바">
							<input type="button" onclick="pie(chartData_1);" value="파이">
							<input type="hidden" name="member_nickname" value="${logindto.member_nickname}">
							<div class="myCharts">
							<canvas id="myChart-1" class="chartjs">
								This text is displayed if your browser does not support HTML5 Canvas.
							</canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp" />
	<script src="resources/js/Chart.js"></script>
	<script>
		$(function(){
			$("#archeck").hide();
		});
	
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});

		})
		
		function updateProfile(){
	           window.name = "artistPage.do";
	           window.open("updateForm.do", "insert",
	                       "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
		}
		
			//닉네임 정규식(한글, 소문자, 대문자 사용가능 )
		   var nickR = /^[가-힣a-zA-Z]{3,16}$/;
		   //이메일 검사 정규식
		   var mailR = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		   // 휴대폰번호 정규식
		   var phoneR = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		   var arr = new Array(4);
		   arr.fill(false);

		   
		   function nick_Chk() {
		   	$.ajax({
		   		url: "nickChk.do",
		   		type: "post",
		   		dataType: "json",
		   		data: {
		   			"member_nickname": $("#member_nickname").val().trim()
		   		},
		   		success: function(data) {
		   			if (data == 1) {
		   				$('#nickname_check').text('이미 존재하는 닉네임 입니다.');
		   				$('#nickname_check').css({'color': 'red','font-size': '12px'});

		   			} else {
		   				if (nickR.test($("#member_nickname").val()) && $("#member_nickname").val().length < 11) {

		   					$('#nickname_check').text('사용가능한 닉네임입니다.');
		   					$('#nickname_check').css({'color': 'blue','font-size': '12px'});

		   					arr[1] = true;

		   				} else if ($("#member_nickname").val().length > 10) {

		   					$('#nickname_check').text('닉네임은 10자 이내로 만들어주세요.');
		   					$('#nickname_check').css({'color': 'red','font-size': '11px'
		   					});

		   				} else {
		   					$('#nickname_check').text(
		   						'닉네임은 3~10자 이내 한글, 영문 사용가능합니다.(공백사용불가)');
		   					$('#nickname_check').css({'color': 'red','font-size': '11px'});
		   				}

		   			}
		   		}
		   	})
		  }
		
		   
		 //이메일 유효성 검사
			  function email_Chk() {
				arr[2] = false;
				
			    $.ajax({
		   		url: "emailChk.do",
		   		type: "post",
		   		dataType: "json",
		   		data: {
		   			"member_email" : $("#member_email").val().trim()
		   		},
		   		success: function(data) {
		   			console.log(data);
		   			if (data == 1) {
		   				$('#email_check').text('이미 존재하는 이메일 입니다.');
		   				$('#email_check').css({'color': 'red','font-size': '12px'});

		   			} else {
		   				if(data == 0 && mailR.test($("#member_email").val())){
		   					$('#email_check').text('사용가능한 이메일 입니다.');
		   					$('#email_check').css({'color': 'blue','font-size': '12px'});
					
		   					arr[2] = true;
		   				} else{
							
		   					$('#email_check').text('이메일 형식을 지켜주세요.');
		   					$('#email_check').css({'color': 'red','font-size': '12px'});
		   					
		   			} 
		   				
		   			}
		   		}
		   	})
		   }
		
				//휴대폰번호 정규식 확인
				$("#member_phone").keydown(function() {
					arr[5] = false;
					var member_phone = $("#member_phone").val().trim();
					if (phoneR.test(member_phone) == false) {
						$("#phone_check").text('휴대폰번호를 다시 입력해주세요.');
						$('#phone_check').css({'color': 'red','font-size': '11px'});
					}else {
						$("#phone_check").text('');
						arr[5] = true;
					}
				})
		
		
		
		
		
		
		 function arup(){
	            
	           var arVal = {
	                  "member_id" : $("#member_id").val(),
	                  "member_nickname" : $("#member_nickname").val(),
	                  "member_email" : $("#member_email").val(),
	                  "member_addr" : $("#member_addr").val(),
	                  "member_phone" : $("#member_phone").val(),
	                  "member_role" : $("#member_role").val()
	            };
	           console.log(arVal);
	            
	               $.ajax({
	                   type : "post",
	                   url : "arupdate.do",
	                   data : JSON.stringify(arVal),
	                   contentType : "application/json",
	                   dataType : "json",
	                   success : function(msg){
	                     if(msg.check == true){
	                         console.log(msg.check);
	                         alert("정보 수정 완료!");
	                         location.href = 'mypageIndex.do'
	                      
	                      }else{ 
	                         $("#archeck").show();
	                         $("#upcheck").html("정보수정 실패").css({
	                           'color' : 'red',
	                           'font-size' : '13px'
	                         });
	                      }
	                   },
	                   
	                   
	                  });
	         
	            
	       }

	</script>
</body>
</html>