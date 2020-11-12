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
        
		//새로고침 막기
		function doNotReload(){
		    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
		        event.keyCode = 0;
		        event.cancelBubble = true;
		        event.returnValue = false;
		    } 
		}
		document.onkeydown = doNotReload;
        
        
        /*
           비로그인 일 때, 접속해 있는 사람들에게 누가 들어 왔다라는 표현 없음,
           로그인 일 때, userid가 들어 왔다라고 표현 해줌.
        */
		let member_Id = document.getElementById("member_Id");

	
			connection.onmessage = appendDIV;


        connection.onclose = function() {
           if (connection.getAllParticipants().length) {
              document.querySelector('h1').innerHTML =
                 connection.getAllParticipants().join(' ') + '와 연결되어 있습니다.';
           } else {          //getAll: userid전부 불러오는 거
                document.querySelector('h1').innerHTML = '나 혼자 남았네요...ㅠ';
            }
        }
        
        //alert으로 띄운거 나중에 지용이형님이 div로 이쁘게 꾸민다고 하심!!!!!!!!!!
      //여기가 수정부분!!!
      var broadcast_nickname = document.getElementById('broadcast_nickname');
         connection.onleave = (event) => {
         if(event.userid==broadcast_nickname.value){
           alert("호스트가 방송을 종료 하였습니다");
           location.href='broadcast.do';
         connection.close();
            
         }else{
            
              console.log(event.userid + '님의 상태 :' + event.status);
         }
        }
        
        var localVideosContainer = document.getElementById('local-videos-container');
        
        var roomId = document.getElementById('broadcast_title');
        var userId = document.getElementById('member_nickname');
        console.log(userId);
        if(userId.value == ''){
           connection.userid = connection.token();
        }else{
           connection.userid = userId.value;
           let inputTextChat = document.getElementById('input-text-chat');
             inputTextChat.removeAttribute('onclick');
             inputTextChat.placeholder = '내용을 입력하세요';
        }
       
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
                         localVideosContainer.appendChild(video);
						if(userId.value == ''){
							
						}else{
							
		                connection.send('님이 들어왔습니다');
						}
                     }
                 } else {
                 alert('종료된 방송입니다');
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
                div.innerHTML = (connection.userid) + ':' + (event.data || event);
            } else {
                div.innerHTML = (event.userid) + ':' + (event.data || event);
            }
					        
            console.log(event.userid + ' <-상대방 || 나->' + connection.userid);
            chatContainer.appendChild(div);
            div.tabIndex = 0;
            div.focus();

            document.getElementById('input-text-chat').focus();
        }
  
        /*
           join이 된 사람이 방송을 나갔을 때,
           비로그인 일 때 alert + 리스트로 이동.
           로그인 일 때 alert + 접속자에게 userId 님이 나갔습니다 + 리스트로 이동
        */
        
        let disconnect_room = document.getElementById("disconnect-room");
        disconnect_room.onclick = function(){
           console.log("방송나가기");
         if(userId.value == ''){
               alert("방송 리스트로 이동합니다.");
               location.href='broadcast.do'
           }else{
               alert("방송 리스트로 이동합니다.");
               connection.send('님이 나갔습니다.');
               location.href='broadcast.do'
           }
           
        }
        