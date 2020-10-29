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
<style type="text/css">
	.broad span,
	.broad input,
	.broad textarea,
	.broad select{
		display: block;
	}

	#room_info{
		position : absolute;
		top : 50%;
		left : 50%;
		transform : translate(-50%, -50%);
		margin-top : 300%;
		margin: 0 auto;
		border : 1px solid yellow;
		display : flex;
		justify-content : center;
		align-items : center;
		flex-direction : column;
		width : 500px;
		padding: 20px;
		
	}
	#main_title{
		width : 100%;
		border : 1px solid blue;
	}
	#chat-box{
		display: none;
		
	}
	#video-chat{
		display: none;
			
	}
	
	#profileSection{
		width : 100%;
		border : 3px dotted black ;
	}
	
	#local-video-container video {
		width : 100% !important;
	}
	
</style>

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

<header>
   <jsp:include page="/WEB-INF/views/header/header.jsp"/>
</header>

   <div id="section">
  
      <div id="room_info">
      	<div id="main_title">
	   	<h3>스트리밍 정보 입력</h3>
      	</div>
      	<div class="broad">
      		<label>방 제목</label>
          <input type="text" id="broadcast_title" placeholder="Unique Room ID" required="required" />
      	</div>
          
          <div class="broad">
          	<label for="member_id">Creator</label>
	          <!-- 추후 hidden 변경  -->
             <input type="text" id="member_id" name="member_id" placeholder="Unique ID" value="${logindto.member_id }" required="required">
          </div>
         
          <div class="broad">
             	<label for="broadcast_content">내용</label>
             	<textarea rows="10" cols="25" style="resize: none;" id="broadcast_content" name="broadcast_content" placeholder="내용을 입력하세요" required="required"></textarea>                         
          </div>
          
          <div class="broad">
          		<label for="broadcast_category">카테고리</label> 
          		<select name="category" id="broadcast_category" style="width:185px;" required="required">
          			<option value="perpomence">공연</option>
          			<option value="dance">댄스</option>
          			<option value="sing">노래</option>
          			<option value="playing">연주</option>
          		</select>         	
          <div class="broad">
          	<label>※주의사항!</label>
          	<textarea rows="5" cols="25" readonly="readonly" style="resize: none;">주의사항 뭐 쓸지 생각해 봅시다 ㅎ</textarea>
          </div>
          		          	
          <div class="broad">
          <button id="btn-open-or-join-room" class="goJoinBtn">
              	방송시작!!!
          </button>
          </div>
          
          
          </div>
      </div>
   </div>
  
  	
     <div id="video-chat">
       <div id="video-container">
          <div id="local-videos-container"></div>
          <div id="remote-videos-container"></div>
       </div>
       <div id="chat-box">
           <div id="chat-output"></div>
           <div id="input-chat">
           <input type="text" id="input-text-chat" placeholder="채팅을 입력해주세요">
           </div>
           <div>
          <button id="close-broadcast">연결 종료</button>
          <button id="disconnect-room">방송 종료</button>
           </div>
       </div>       
    </div>
       
          <div id="profileSection">
			<p> 썸네일 확인~~</p>
			<p> 썸네일 확인~~</p>
			<p> 썸네일 확인~~</p>
			<p> 썸네일 확인~~</p>
			<p> 썸네일 확인~~</p>
			<p> 썸네일 확인~~</p>
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

        connection.onopen = (event) => {
            //connection.send('hello everyone'); //연결하나당 들어왔을 때 모두에게 보이는 MESSAGE
            document.getElementById('input-text-chat').disabled = false;
            document.getElementById('input-text-chat').style.visibility = 'visible';
            document.querySelector('h1').innerHTML = connection.getAllParticipants().join(' ') + '와 연결되었습니다!';
        }

        connection.onmessage = appendDIV;

        // 누군가가 방을 나갔을 때 화면에 보여지는 부분 변경 <-- 수정해야함
        connection.onclose = function () {
            if (connection.getAllParticipants().length) {
                document.querySelector('h1').innerHTML = '계속 ' + connection.getAllParticipants().join(' ') + '와 연결되어 있습니다.';
            } else {                                                          //getAll이건 userid전부 불러오는 거
                document.querySelector('h1').innerHTML = '나 혼자 남았네요...ㅠ';
            }
        };
        var localVideosContainer = document.getElementById('local-videos-container');
        var remoteVideosContainer = document.getElementById('remote-videos-container');
        
        /* value.trim() -> 공백으로 값을 채워지지 않게 각 변수에 공백 제거 설정 */
        var roomid = document.getElementById('broadcast_title'); // 입력한 ID 변수에 담기
        // roomid.value = connection.token(); <-- token생성 가능
        var userId = document.getElementById('member_id');
        
        var roomcontent = document.getElementById("broadcast_content");
        var roomcategory = document.getElementById("broadcast_category");

        /********************************방 생성********************************/
        
        if(roomid.value.trim() != null && userId.value.trim() != null && roomcontent.value.trim() != null && roomcategory.value.trim() != null){
        	 
        document.getElementById('btn-open-or-join-room').onclick = function () {
            this.disabled = true;
            console.log(roomid.value);
            connection.userid = userId.value;
            console.log(userId.value);
            connection.checkPresence(roomid.value, (isRoomExist) => {

                if (isRoomExist === true) {
                    console.log('join했습니다');
                    connection.join(roomid);
                    connection.onstream = (event) => {
                        test();
                        let video = event.mediaElement;
                        connection.attachStreams.forEach((localStream) => {
                            localStream.stop();
                        });
                        remoteVideosContainer.appendChild(video);
                    }
                } else {
                    console.log('open했습니다');
                    var member_id = $("#member_id").val();
                    var broadcast_title = $("#broadcast_title").val();
                    var broadcast_content = $("#broadcast_content").val();
                    var broadcast_category = $("#broadcast_category").val();
                    console.log(member_id, broadcast_title, broadcast_content, broadcast_category);
                    $.ajax({
                       type : "POST",
                       url : "liveinsert.do",
                       data : {member_id : member_id, 
                             broadcast_title : broadcast_title, 
                             broadcast_content : broadcast_content,
                             broadcast_category : broadcast_category},
                       success : function(){
                          console.log("전송성공");
                          test();
                          

                       },
                       error : function(){
                          console.log("전송실패");
                       }      
                    });
                    connection.open(roomid.value);
                    connection.onstream = (event) => {
                        let video = event.mediaElement;
                        localVideosContainer.appendChild(video);
                    }
                }
            });
       	 }
        }
        
        function test() {
           let section = document.getElementById("section");
            section.style.display = "none";
            let chat = document.getElementById("chat-box");
            chat.style.display = "block";
            let video = document.getElementById("video-chat");
            video.style.display = "block";
            let profileSection = document.getElementById("profileSection");
            profileSection.style.display = "block";
            if(video.style.display = "block"){
            	video.style.display = "flex";
            }
        }
        
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


        closeBroadcast = document.getElementById('close-broadcast');
        closeBroadcast.onclick = function() {
            // disconnect with all users
            // 내 화면이 disconnect이므로 아티스트가 누를 경우
            // 해당 화면에 방송 종료를 알리는 메시지나 이미지 삽입 필요
            //connection.getAllParticipants().forEach(function (pid) {
            //    connection.disconnectWith(pid);
            //});
            
            // 내 화면 끄기
            // stop으로 local에서 stream을 멈추면 start하는 기능도 있을 것..
            // start를 찾으면 방송 중간에 참여혹은 on / off 가능
            connection.attachStreams.forEach(function (localStream) {
                localStream.stop();
            });

            // close socket.io connection
            // socket.io 연결을 끊었기 때문에, connection으로 연결된(?)
            // video, audio는 살아있음 -> 상대방과의 연결이 끊김
            connection.closeSocket();
        }

      /*   openBroadcast = document.getElementById('open-broadcast');
        openBroadcast.onclick = function() {
            connection.attachStreams.forEach(function (localStream) {
                localStream.start(); // is not a function
            });
        } */

        // Stream을 제거하는 건데, 저 stream-id 부분에 뭐가 들어가야 하는지
        // 잘 모르겠다. 더 찾아봐야한다
        /* let removeStream = document.getElementById('remove-stream');
        removeStream.onclick = function() {
            // remove all screen streams.
            // you can use "remove all video streams" by passing "video"
            // or "remove all audio streams" by passing "audio"
            connection.removeStream('screen');

            // remove-all but multiple streams
            // i.e. remove all audio and video streams
            // or remove all audio and screen streams
            connection.removeStream({
                screen: true,
                audio: true
            });

            // remove a media-stream by id
            connection.removeStream('stream-id');
        } */

        let disconnectRoom = document.getElementById('disconnect-room');
        disconnectRoom.onclick = function() {
            console.log('방송종료');
            this.disabled = true;

            // 만약 방을 나가는 사람이 방을 만든 사람이면 전체 세션을 닫는다. //USERID가 없어서
            // 만든 사람인지 알 수 없는 것이 아닐까 싶다.. 들어온 사람은 나가짐..
            // 방송 나가기 버튼으로도 활용 가능할 듯
            if (connection.isInitiator) {
                connection.close();
            } else {
            connection.closeEntireSession(function () {
            document.querySelector('h1').innerHTML = 'Entire session has been closed.';
                });
            }
        }
        
    </script>
</body>
</html>