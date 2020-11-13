<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LIVRO</title>
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript">
//카카오 채널 팝업
var url = "popup.do"
window.open(url, "pop", "location=0,left=500,top=180,width=480,height=640");
</script>
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/main-header.jsp"/>
	
	<main>
		<div class="main-wrapper">
			<a href="broadcast.do" class="liveBtn">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			LIVE
			</a>
		</div>
		
	</main>
	
	<jsp:include page="/WEB-INF/views/footer/main_footer.jsp"/>

</body>
</html>