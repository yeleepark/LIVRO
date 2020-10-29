<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방송 시청</title>
	<link rel="stylesheet" href="resources/css/broadcast_live.css" />
	<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
    <script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
	<script src="resources/js/getHTMLMediaElement.js"></script>
    <script src="resources/js/adapter.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	<input type="hidden" value="${logindto.member_id }" id="user_id">		
	<div id="video-chat">
       <div id="video-container">
       		<div id="local-videos-container"></div>
          	<div id="remote-videos-container"></div>
      </div>
        <div id="chat-box">
           <div id="chat-output"></div>
           <div id="input-chat">
           <input type="text" id="input-text-chat" placeholder="로그인이 필요합니다" onclick="needLogin();">
           </div>
        </div>
     </div>
     <div id="needlogin">
		<jsp:include page="/WEB-INF/views/login/login.jsp" ></jsp:include>
     </div>
     <script>
     	window.enableAdapter = true; // adapter.js 활성화
     	
     	//RTCMultiConnection Default Settings
     	var connection = new RTCMultiConnection();
     	
     	connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

        connection.socketMessageEvent = 'textchat-plus-fileshare-demo';

        connection.session = {
            audio: true,
            video: true,
            data: true
        };


        connection.sdpConstraints.mandatory = {
            OfferToReceiveAudio: true,
            OfferToReceiveVideo: true
        };
     	
     	connection.open = (event) => {
     	}
     	
     	connection.onmessage = appendDIV;
     	
     	connection.onopen = (event) => {
            //connection.send('hello everyone'); //연결하나당 들어왔을 때 모두에게 보이는 MESSAGE
        }
     	connection.onclose = function() {
     		if (connection.getAllParticipants().length) {
     			document.querySelector('h1').innerHTML =
     				connection.getAllParticipants().join(' ') + '와 연결되어 있습니다.';
     		} else {          //getAll: userid전부 불러오는 거
                document.querySelector('h1').innerHTML = '나 혼자 남았네요...ㅠ';
            }
     	}
     	
     	connection.onleave = (event) => {
     		console.log(event.userid + '님의 상태 :' + event.status);
     	}
     	
     	var localVideosContainer = document.getElementById('local-videos-container');
     	var remoteVideosContainer = document.getElementById('remote-videos-container');
     	
     	var roomId = document.getElementById('broadcast_title');
     	var userId = document.getElementById('user_id');
     	console.log(userId);
     	if(userId.value == ''){
     		userId.value = connection.token();
     	}else{
     		let inputTextChat = document.getElementById('input-text-chat');
             inputTextChat.removeAttribute('onclick');
             inputTextChat.placeholder = '내용을 입력하세요';
     	}
     	connection.userid = userId.value;
     	console.log(userId.value);
     	console.log(roomId.value);
        /*******************************방송 시청하기********************************/
       
        	connection.checkPresence(roomId.value, (isRoomExist) => {
        		 if (isRoomExist === true) {
                     console.log('join했습니다');
                     connection.join(roomId.value);
                     connection.onstream = (event) => {
                         let video = event.mediaElement;
                         connection.attachStreams.forEach((localStream) => {
                             localStream.stop();
                         });
                         remoteVideosContainer.appendChild(video);
                     }
                 }else{
        			alert('오류');
        			location.href='broadcast.do';
        		}
        	})
		// 채팅전송
        let inputText = document.getElementById('input-text-chat').onkeyup = function (e) {
            if (e.keyCode != 13) return; // 13 = enter, enter가 아니면 return 해라인데.. 
            // removing trailing/leading whitespace
            this.value = this.value.replace(/^\s+|\s+$/g, '');
            if (!this.value.length) return;
            console.log(this.value);
            connection.send(this.value);
            appendDIV(this.value);
            this.value = '';
            // 값이 있으면 return 
        };
        
    	 // 채팅 입력 태그
        let chatContainer = document.querySelector('#chat-output');

        // 채팅 내용 담기는 부분
        function appendDIV(event) {
            let div = document.createElement('div');
            if (event.userid == null) { // 보내는 사람이 undefined면.. 즉, 내가 보냈다면
                div.innerHTML = (connection.userid) + ': ' + (event.data || event);
            } else {
                div.innerHTML = (event.userid) + ':' + (event.data || event);
            }
            console.log(event.userid + ' <-상대방 || 나->' + connection.userid);
            chatContainer.appendChild(div);
            div.tabIndex = 0;
            div.focus();

            document.getElementById('input-text-chat').focus();
        }
        function joinDIV(event){
            console.log('----------joinDIV-----------')
        	console.log(event.userid)
        	connection.send(event.userid)
        	let div = document.createElement('div');
        	div.innerHTML = event.userid + '님이 들어왔습니다.';
        	chatContainer.appendChild(div);
        	div.tabIndex = 0;
        	div.focus();
        	document.getElementById('input-text-chat').focus();
        }
        
        function needLogin(){
        	console.log('로그인요청');
        	let needLogin = document.getElementById('needlogin');
        	needLogin.style.display = 'block';
        }
     </script>
</body>
</html>