var tab5 = document.getElementById('tab5');
tab5.addEventListener('click', () => {

	var addr = document.getElementsByClassName('addr')[0].value;
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});


			var postcode = $("#artistPostcode").val().trim();
			var location = $("#artistLoc").val().trim();
			var detaillocation = $("#artistDetailLoc").val().trim();
			//주소출력
			$("#textarea").text(postcode + " " + location + " " + detaillocation);
			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div class="mappointer">Here!</div>'
			});

			infowindow.open(map, marker);
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
			
			var divTag = document.getElementsByClassName('mappointer')[0];
			divTag.parentNode.parentNode.style.background = "transparent";
			divTag.parentNode.parentNode.style.border = "none";
			
		} else {
			$(".map-container").css("display", "none");
			if ($("#memberRole") == 'A') {
				$("#textarea").text('팬레터 받을 주소를 등록해주세요!').css("text-align", "center");
			} else {
				$("#textarea").text('아직 주소가 등록되지 않았습니다!').css("text-align", "center");
			}
		}
	})
});

//우편번호찾기
function execPostCode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
						&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName
							: data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//document.getElementById("member_addr").value = extraAddr;

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('artist_addr1').value = data.zonecode;
				document.getElementById('artist_addr2').value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('artist_addr3').focus();

			}
		}).open();
}

//주소등록 확인하기
$("#addAddr").click(function() {
	var getAddr = $("#artist_addr1").val() + $("#artist_addr2").val() + $("#artist_addr3").val();
	var result = confirm("아래 주소로 등록하시겠습니까?\n" + getAddr);
	if (result) {
		if (getAddr == null || getAddr == '') {
			alert("주소를 먼저 입력해주세요!");
		} else {
			$("#addrForm").submit();
		}
	} else {
		alert("주소등록이 취소되었습니다.");
	}
});


//수정 확인하기
function locConfirm() {

	var member_id = $("#artistId").val();
	var artist_postcode = $("input[name=artist_postcode]").val();
	var artist_loc = $("input[name=artist_loc]").val();
	var artist_detail_loc = $("input[name=artist_detail_loc]").val();

	//이미 등록된 주소가 있는지 확인할 값 
	var chkVal = $("#artist_addr1").val().trim();
	var result = confirm("기존에 있던 주소를 변경하시겠습니까?");

	var locVal = {
		"member_id": member_id,
		"artist_postcode": artist_postcode,
		"artist_loc": artist_loc,
		"artist_detail_loc": artist_detail_loc
	}
	
	if (result) {
		if (chkVal == null || chkVal == '') {
			alert("주소를 먼저 입력해주세요!");
		} else {
			$.ajax({
				url: "artistmapupdate.do",
				data: locVal,
				dataType: "JSON",
				type: 'POST',
				success: function(data) {
					if (data > 0) {
						alert("주소를 성공적으로 변경하였습니다.");
						location.reload();
					} else {
						alert("주소변경을 실패했습니다.");
					}
				},
				error: function(error) {
					alert("통신실패");
				}
			})
		}
	} else {
		alert("변경이 취소되었습니다.");
	}
}

//주소 삭제 재확인
function delChk() {
	var result = confirm("정말로 삭제하시겠습니까?");
	if (result) {
		location.href = 'artistmapdel.do';
	}
}
