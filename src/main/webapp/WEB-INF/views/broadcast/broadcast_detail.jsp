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
   <input type="hidden" value="${logindto.member_id }" id="user_id">
   
      <div id="section2">
       <div id="section2_left">
          <div id="remote-videos-container"></div>
      
          <div id="profileSection">
            <p> 썸네일 확인~~</p>
            <p> 썸네일 확인~~</p>
            <p> 썸네일 확인~~</p>
            <p> 썸네일 확인~~</p>
            <p> 썸네일 확인~~</p>
            <p> 썸네일 확인~~</p>
          </div>
       </div>

       <div id="section2_right">
           <div id="chat-output"></div>

            <div id="chat-input">
                <div id="input-chat">
                    <input type="text" id="input-text-chat" placeholder="로그인이 필요합니다" onclick="needLogin();">
                </div>
                <div>
                	<button id="donation" onclick="donaDo();">후원하기</button>
                    <button id="close-broadcast">연결 종료</button>
                    <button id="disconnect-room">방송 종료</button>
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
     		<span>${logindto.member_id }님에게 후원하기</span>
     		<div id="donaFirst">
     			<div id="donaPrice1" style="border: 1px solid blue">1000</div>
     			<div id="donaPrice2" style="border: 1px solid blue">5000</div>
     			<div id="donaPrice3" style="border: 1px solid blue">10000</div>
     		</div>
     		<div id="donaSecond">
     			<input type="range" id="scale" name="scale" min=1000 max=10000 step=10 onchange="setPrice();" value="1000">
     			<div id="donaSlide"></div>
     			<input type="text" id="donaSlidePrice"></input>
     		</div>
     		<div id="donaThird">
     			<button id="donaYes" onclick="pay();">후원하기</button>
     			<button id="donaNo" onclick="donaNo()">취소</button>
     		</div>
      	</div>
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
                     document.getElementById('section2').style.display = 'flex';
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
           $('#needLogin').fadeIn();
        }
        
        function closeLogin(){
        	$('#needLogin').fadeOut();
        }
        
		function donaDo(){
        	$('#donaProcess').fadeIn();
		}
        
		function donaNo(){
        	$('#donaProcess').fadeOut();
		}
		function setPrice(){
		document.getElementById('donaSlidePrice').value = this.value
		}
     </script>
</body>
</html>