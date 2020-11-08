<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방송 시청</title>
	<link rel="stylesheet" href="resources/css/broadcast_live.css" />
	<link rel="stylesheet" href="resources/css/broadcast_detail.css">
	<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
    <script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
	<script src="resources/js/getHTMLMediaElement.js"></script>
    <script src="resources/js/adapter.js"></script>
    <script src="resources/js/donation.js" ></script>
    <script>
    $(document).ready(function(){
        $('section').css('background-image', 'none' );
        
    })
    </script>
</head>
<body>
   <header>
       <jsp:include page="/WEB-INF/views/header/header.jsp"/>
   </header>
   <input type="hidden" value="${broadDto.broadcast_title }" id="broadcast_title">
   <input type="hidden" value="${broadDto.broadcast_category }" id="broadcast_category">
   <input type="hidden" value="${logindto.member_id }" id="member_Id">
   <input type="hidden" value="${logindto.member_nickname }" id="member_nickname">
   <input type="hidden" value="${logindto.member_email }" id="member_email">
   <input type="hidden" value="${logindto.member_name}" id="member_name">
   
	<div id="section2">
       <div id="section2_left">
			<div id="local-videos-container"></div>
      		<div id="profileSection">
          		<div class="profileSection-tab-img">
          		<!-- 프로필 사진 사이즈 전해 줘야 함!!! -->
          			<div class="profileImg">
          				<%-- <img src="/resources/profileimg/${broadDto.member_profile }"> --%>
          				<img src="resources/img/broadcast_back.png">
          			</div>
        	  	</div>
        	  	<div class="profileSection-tab-text">            
					<div>
	   	      		   	<span id="title_res"></span>
					</div>
					<p>${broadDto.member_nickname }</p>
					<div>
						<div id="category_res"></div>
					</div>
				</div>
			</div>
		</div>

       <div id="section2_right">
           <div id="chat-output"></div>

           <div id="chat-input">
                <div class="chat-btn-block">
	                <div>
	                	<button id="donation" onclick="donaDo();">
	                		<i class="fas fa-hand-holding-usd"></i>
	                	</button>
	                </div>
	                <div>
	                   <!--  <button id="close-broadcast">연결 종료</button> -->
	                    <button id="disconnect-room">
	                    	<i class="fas fa-sign-out-alt"></i>
	                    </button>
	                </div>
	                <div>
	                    <button id="report" onclick="report()">
	                    	<i class="fas fa-exclamation-circle"></i>
	                    </button>
	                </div>
                </div>
                <div id="input-chat">
                    <input type="text" id="input-text-chat" placeholder="로그인이 필요합니다" onclick="needLogin();">
                </div>
           </div>
        </div>           
    </div>
    
     <div id="needLogin">
     	<div id="closeLogin" onclick="closeLogin();" >x</div>
      	<jsp:include page="/WEB-INF/views/login/login.jsp" ></jsp:include>
     </div>
     
     <div id="donaProcess">
     	<div id="donaRound">
     		<span>${broadDto.member_nickname }님에게 후원하기</span>
     		<div id="donaFirst">
     			<input type="button" class="donaPrice" style="border: 1px solid blue" value="1000" />
     			<input type="button" class="donaPrice" style="border: 1px solid blue" value="5000"/>
     			<input type="button" class="donaPrice" style="border: 1px solid blue" value="10000"/>
     		</div>
     		<div id="donaSecond">
     			<input type="range" id="price" min=1000 max=10000 step=1000 value="1000">
     			<div id="donaSlide"></div>
     			<input type="text" id="donaSlidePrice"></input>
     		</div>
     		<div id="donaThird">
     			<button id="donaYes" onclick="pay();">후원하기</button>
     			<button id="donaNo" onclick="donaNo()">취소</button>
     		</div>
      	</div>
     </div>
     
     <script src="resources/js/broadcast_detail_rtc.js"></script>
     <script src="resources/js/broadcast_detail.js"></script>
     <script type="text/javascript">
     function report(broad_nickname){
			var broad_nickname = "${broadDto.member_nickname}";
			if(userId.value == ''){
				alert("로그인 후 이용이 가능합니다");
				$('#needLogin').fadeIn();			
			}else{
				open("report.do?receive_nickname=${broadDto.member_nickname}&receive_id=${broadDto.member_id}", "","width=700, height=550");
			}
		}
     </script>
</body>
</html>