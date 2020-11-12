      
        //RTCMultiConnection Default Settings
        var connection = new RTCMultiConnection();
        
        connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

        connection.session = {
            audio: true,
            video: true,
            data: true
        };


        connection.sdpConstraints.mandatory = {
            OfferToReceiveAudio: true,
            OfferToReceiveVideo: true
        };
        
		let openChk = true;
		
		connection.onopen = () => {
			if(openChk && userId.value != ''){
				connection.send('님이 들어왔습니다');
				openChk = false;
			}
		}
		
		connection.onmessage = appendDIV;
		
		let member_Id = document.getElementById("member_Id");
     	let broadcast_nickname = document.getElementById('broadcast_nickname');
        
		connection.onleave = (e) => {
			
         if(e.userid == broadcast_nickname.value){
			alert("호스트가 방송을 종료 하였습니다");
			location.href='broadcast.do';
			connection.close();
         	}
		}
        
        let localVideosContainer = document.getElementById('local-videos-container');
        
        let roomId = document.getElementById('broadcast_title');
        let userId = document.getElementById('member_nickname');

        if(userId.value == ''){
	
           connection.userid = connection.token();

        }else{
           connection.userid = userId.value;

           let inputTextChat = document.getElementById('input-text-chat');

           inputTextChat.removeAttribute('onclick');
           inputTextChat.placeholder = '내용을 입력하세요';
        }

        /*******************************방송 시청하기********************************/
       
           connection.checkPresence(roomId.value, (isRoomExist) => {
               if (isRoomExist === true) {
                     console.log('join했습니다');

                     document.getElementById('section2').style.display = 'flex';

                     connection.join(roomId.value);

                     connection.onstream = function(e) {
	
                         let video = e.mediaElement;

                         connection.attachStreams.forEach((localStream) => {
							console.log(localStream);
                             localStream.stop();
                         });

                         localVideosContainer.appendChild(video);
                     }
                 } else {
                 alert('종료된 방송입니다');
                 location.href='broadcast.do';
              }
           })

		// 채팅전송
        let inputText = document.getElementById('input-text-chat').onkeyup = function (e) {
            if (e.keyCode != 13) return;

            this.value = this.value.replace(/^\s+|\s+$/g, '');

            if (!this.value.length) return;

            connection.send(this.value);

            appendDIV(this.value);

            this.value = '';
            // 값이 있으면 return 
        };
        
        // 채팅 입력 태그
        let chatContainer = document.querySelector('#chat-output');

        // 채팅 내용 담기는 부분
        function appendDIV(e) {
            let div = document.createElement('div');
            
            if (e.userid == null) { // 보내는 사람이 undefined면.. 즉, 내가 보냈다면

                div.innerHTML = (connection.userid) + ':' + (e.data || e);

            } else {
	
                div.innerHTML = (e.userid) + ':' + (e.data || e);
            }
					        
            console.log(e.userid + ' <-상대방 || 나->' + connection.userid);

            chatContainer.appendChild(div);

            div.tabIndex = 0;
            div.focus();

            document.getElementById('input-text-chat').focus();
        }
  
        let disconnect_room = document.getElementById("disconnect-room");

        disconnect_room.onclick = () => {
               alert("방송 리스트로 이동합니다.");
               location.href='broadcast.do'
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
        