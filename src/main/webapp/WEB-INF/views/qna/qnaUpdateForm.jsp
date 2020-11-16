<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="resources/css/qna_insertform.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Q&A글수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<form action="qnaupdate.do" method="post">
		<input type="hidden" name="qna_no" value="${qnaupdatedto.qna_no }">
		<input type="hidden" name="qna_secret" value="N" id="qna_secret">
		

		<div class="qna_wrap">
			<div class="qna_writer">
			<input type="hidden" value="${qnaupdatedto.qna_secret }"
			id="qna_secret_res">
				<label>작성자</label> <span>${logindto.member_nickname }</span>
			</div>
			<div class="qna_title">
				<label>제목</label> <input type="text" name="qna_title"
					placeholder="${qnaupdatedto.qna_title }">
			</div>
			<div class="qna_content">
				<label>내용</label>
				<div id="editor">${qnaupdatedto.qna_content }</div>
			</div>
			<div class="qna_footer">

				<div class="qna_secret">
					<input type="checkbox" id="chkbox_secret" onclick="secretChk()"><span>비밀글</span>
				</div>
				<input type="button" value="취소"
					onclick="location.href='qnainsert.do'"> <input
					type="submit" value="수정" onclick="formSubmit()">
			</div>
		</div>
	</form>


	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			previewStyle : 'tab',
			height : '400px',
			initialEditType : 'wysiwyg'
		});
		editor.getHtml();
		function formSubmit() {
			let input = document.createElement("input");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "qna_content")
			input.setAttribute("value", editor.getHtml());
			document.querySelector("#editor").append(input);
		}
		/* 
		 * input 태그를 생성하고 type=hidden, name=qna_content, value=editor.getHtml() 속성을 추가 
		 * #editor에 생성한 input 태그를 추가한다
		 */
	</script>

<script type="text/javascript">
	function secretChk() {
		console.log("비밀글 설정 ");
		document.getElementById("qna_secret").value = "Y";
	}
	
	var secret = document.getElementById("qna_secret_res").value;
	var chkboxsecret = $("#chkbox_secret");
	console.log(secret);
	console.log(chkboxsecret);
	
	if(secret == 'Y'){
		$("input:checkbox[id='chkbox_secret']").prop("checked", true);
		$("input:checkbox[id='chkbox_secret']").click(function(){
			alert("비밀글 설정은 변경하실 수 없습니다!");
			$("input:checkbox[id='chkbox_secret']").prop("checked", true);
		})
	}else{
		$("input:checkbox[id='chkbox_secret']").prop("checked", false);
	}
	
	
</script>

	<jsp:include page="/WEB-INF/views/footer/footer.jsp" />
</body>
</html>