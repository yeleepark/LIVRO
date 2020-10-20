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
<!-- font awesome -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
//카카오 채널 팝업
var url = "popup.do"
window.open(url, "pop", "location=0,left=500,top=180,width=480,height=640");
</script>
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/main-header.jsp"/>
	
	<main>
		<div class="main-wrapper">
			<button id="liveBtn">
				<span><i class="fas fa-play"></i></span><span>LIVE</span>
			</button>
		</div>
	</main>

</body>
</html>