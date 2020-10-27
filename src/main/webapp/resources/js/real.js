//RTCMultiConnection 객체를 생성
var connection = new RTCMultiConnection();

//자신의 화면을 띄워주는 localvideo 영역, 상대방 화면을 띄워주는 remotevideo 영역을 불러옴
var localvideo = document.getElementById('localvideo');
var remotevideo = document.getElementById('remotevideo');
//socket.io를 연동할 서버주소를 입력함. 이것이 없으면 Signaling이고 자시고 클라이언트와 통신조차 할 수 없음
//MultiConnection의 github에 제공해주고 있는 서버가 있지만, 필요에 따라 자기가 직접  socket.io 서버를 개설하고 넣을수 있음
connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

// 음성,비디오 활성화
connection.session = {
		audio: true,
		video: true
};

//오디오를 활성화 할지, 비디오를 허용할 지 알림을 띄워줌
connection.sdpConstraints.mandatory = {
		OfferToReceiveAudio: true,
		OfferToReceiveVideo: true
		
};


var predefinedRoomId = document.getElementById('roomid');
/*
 * document.getElementById("btn-open-or-join-room").onclick = function() {
 * this.disabled = true;
 * 
 * connection.openOrJoin(predefinedRoomId); };
 */
connection.onstream = function(event) {
	var video = event.mediaElement;
	if(event.type == 'local'){
		var div = document.createElement('div');
		localvideo.appendChild(div);
		div.appendChild(video);
	}
	if(event.type == 'remote'){
		var div = document.createElement('div');
		remotevideo.appendChild(div);
		div.appendChild(video);
	}
};
document.getElementById("btn-open").onclick = function() {
	this.disabled = true;
	
	connection.open(predefinedRoomId.value, function(isRoomCreated, roomid, error){
		if(error){
			alert("에러가 발생했습니다.\n사유: " +error);
			document.getElementById("btn-open").disabled = false;
			return;
			}
		console.log(predefinedRoomId.value);
		});
		
};
document.getElementById("btn-join").onclick = function() {
	this.disabled = true;
	
	connection.join(predefinedRoomId.value, function(isRoomJoined, roomid, error){
		if(error){
			alert("에러가 발생했습니다.\n사유: " +error);
			document.getElementById("btn-join").disabled = false;
			return;
			}
		console.log(predefinedRoomId.value);
		});
		
};

