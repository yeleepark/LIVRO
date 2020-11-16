<%@page import="com.kh.livro.dto.MemberDto"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.kh.livro.dto.BroadcastDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/join.css">
	
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
    <script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
    <script src="resources/js/getHTMLMediaElement.js"></script>
    <script src="resources/js/adapter.js"></script>
    <link rel="stylesheet" href="resources/css/broadcast_live.css" />
   <script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
   <script type="text/javascript">
   $(window).on("beforeunload", () => {
      let member_id = $("#member_id").val();
       let member_nickname = $('#member_nickname').val();
       let broadcast_title = $("#broadcast_title").val();
       let broadcast_content = $("#broadcast_content").val();
       let broadcast_category = $("#broadcast_category").val();
       console.log(member_id, broadcast_title, broadcast_content, broadcast_category);
       $.ajax({
          type : "POST",
          url : "closeAjax.do",
          data : { member_id,
                   member_nickname,
				   broadcast_title, 
				   broadcast_content,
				   broadcast_category}
  		})
   });
    $(document).ready(function(){
        $('#header').css('background-color', 'rgba( 255, 255, 255, 0 )');
    })
   </script>
<header>
   <jsp:include page="/WEB-INF/views/header/header.jsp"/>
</header>

   <div id="section1">
      <div id="room_info">         
         <div id="main_title">
         <h2>스트리밍 정보 입력</h2>
         </div>
         <div class="broad_radius">
          	<div class="broad" id="broad_tab_1">
          		<span>${logindto.member_nickname }</span>
          		<span>님의 방송</span>
				<input type="hidden" id="member_nickname" name="member_nickname" value="${logindto.member_nickname }" readonly="readonly">
				<input type="hidden" id="member_id" name="member_id" value="${logindto.member_id }" required="required">
       	    </div>
          
			<div class="broad" id="broad_title">
				<label>방 제목</label>
      	    	<input type="text" id="broadcast_title" placeholder="방 제목을 입력하세요" required="required" />
			</div>
          
			<div class="broad">
                <label for="broadcast_content">내용</label>
                <textarea rows="10" cols="25" style="resize: none;" id="broadcast_content" name="broadcast_content" placeholder="내용을 입력하세요" required="required"></textarea>                         
			</div>
          
          	<div class="broad">
                <label for="broadcast_category">카테고리</label> 
                <select name="category" id="broadcast_category" required="required">
                   <option value="공연">공연</option>
                   <option value="댄스">댄스</option>
                   <option value="노래">노래</option>
                   <option value="연주">연주</option>
                </select>            
			</div>
			<div class="broad">
				<label>안내사항</label>
				<textarea rows="5" cols="15" readonly="readonly" style="resize: none;" id="notice">LIVRO는 누구나 버스킹 할 수 있는 플랫폼입니다.&#10;깨끗한 운영을 위해 함께 노력해주세요!</textarea>
			</div>
                             
			<div class="broad">
				<button id="btn-open-or-join-room" class="goJoinBtn">
                	 방송 시작
				</button>
			</div>
    	  </div>
      </div>
   </div>
  
     
     <div id="section2">
       <div id="section2_left">
          <div id="local-videos-container"></div>
          <!--
              <div id="remote-videos-container"></div>
            -->
              
          <div id="profileSection">
          	<%-- <input type="hidden" id="hidden_no" value="${livedto.broadcast_no }"> --%>
          	<div class="profileSection-tab-img">
          		<!-- 프로필 사진 사이즈 전해 줘야 함!!! -->
          			<div class="profileImg">
          				 <img src="/resources/profileimg/${profile.member_profile }"> 
          				<!-- <img src="resources/img/broadcast_back.png"> -->
          			</div>
        	  	</div>
        	  	<div class="profileSection-tab-text">            
					<div>
	   	      		   	<span id="title_res"></span>
					</div>
					<p id="nickname_res">${logindto.member_nickname }</p>
					<div>
						<span id="category_res"></span>
					</div>
					<div>
						<span id="content_res"></span>
					</div>
				</div>
          </div>
       </div>

       <div id="section2_right">
           <div id="chat-output"></div>

           <div id="chat-input">
                <div class="chat-btn-block">
	                <div>
	                   <!--  <button id="close-broadcast">연결 종료</button> -->
	                    <button id="disconnect-room" class="chat-btn">
	                    	<i class="fas fa-sign-out-alt"></i>
	                    </button>
	                </div>
                </div>
                <div id="input-chat">
                    <input type="text" id="input-text-chat" placeholder="채팅을 입력하세요" onclick="needLogin();">
                </div>
           </div>
        </div>                   
    </div>
    
    <script src="resources/js/broadcast_live_rtc.js"></script>
    <script src="resources/js/broadcast_live.js"></script>
</body>
</html>