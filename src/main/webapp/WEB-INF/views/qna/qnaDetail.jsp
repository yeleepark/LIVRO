<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/tui-editor/dist/tui-editor.css" />
<link rel="stylesheet" href="resources/css/qna_detail.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Q&A-글상세</title>
</head>
<body>
	<script type="text/javascript">
$(document).ready(function(){

	
	//관리자만 댓글 달 수있고 답변 내용이 없으면 return false 해서 submit 이벤트 막음
	$("#reform").submit(function(e){
		var retext = $("#retext").val().trim();
		console.log(retext);
		
		if(${logindto.member_role != 'M' }){
			alert("관리자만 등록할 수 있습니다.");
			return false;
		}else{
			if(retext == null || retext == ''){
				alert("답변을 등록해주세요.")
				return false;
			}else{
				return true;
			}
		}
	})
})


</script>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />
	<div class="qna_detail_wrap">
		<div>
			<div class="qna_title_wrap">${qnadetaildto.qna_title }</div>
			<div class="qna_nick_wrap">${qnadetaildto.member_nickname }
				<fmt:formatDate value="${qnadetaildto.qna_regdate }"
					pattern="yy-MM-dd HH:mm" />
			</div>

		</div>

		<div class="qna_content_wrap">
			<div id="viewer"></div>
		</div>

		<div class="qna_reply_wrap">
			<c:choose>
				<c:when test="${empty qnarelist }">
					<div>
						<div>작성된 댓글이 없습니다.</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${qnarelist }" var="qnarelist">
						<div>
							<div>${qnarelist.member_nickname }
								<fmt:formatDate value="${qnarelist.qnare_regdate }"
									pattern="yy-MM-dd HH:mm" />
							</div>
							<div>${qnarelist.qnare_content }
								<input type="button" value="수정" /> 
								<input type="button" value="삭제" />
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<form action="qnareinsert.do" method="post" id="reform">
				<input type="hidden" name="qna_no" value="${qnadetaildto.qna_no }">
				<input type="hidden" name="member_nickname"
					value="${logindto.member_nickname }">
				<div class="qna_input_reply">
					<input type="text" placeholder="댓글은 관리지만 등록할 수 있습니다."
						name="qnare_content" id="retext" /> 
						<input type="submit" value="입력">
				</div>
			</form>
		</div>

		<div class="qna_btn">
			<input type="button" value="목록" onclick="history.go(-1);">
			<c:if
				test="${logindto.member_nickname eq qnadetaildto.member_nickname}">
				<c:if test="${qnadetaildto.member_role eq 'M' }">
				<input type="button" value="수정"
					onclick="location.href='qnaupdateform.do?qna_no=${qnadetaildto.qna_no}'">
				<input type="button" value="삭제"
					onclick="location.href='qnadelete.do?qna_no=${qnadetaildto.qna_no}'">
					</c:if>
			</c:if>
		</div>

	</div>

	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
	<script>
		const viewer = new toastui.Editor({
			el : document.querySelector('#viewer'),
			initialValue : `${qnadetaildto.qna_content }`
		});
	</script>

</body>
</html>