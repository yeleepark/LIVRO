<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://d3js.org/d3.v6.min.js"></script>
<link rel="stylesheet" href="resources/css/rank.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>


	<div class="print"></div>


		<p>탑3</p>
		<c:forEach items="${rankdto }" var="rank">
			<div>
				아이디 : <input type="text" value="${rank.member_id }" class="top3id"> 
				순위 : <input type="text" value="${rank.rank }" class="top3rank"> 
				팔로워 수 : <input type="text" value="${rank.count }" class="top3count">
				닉네임 : <input type="text" value="${rank.member_nickname }" class="top3nick">
			</div>
		</c:forEach>


		<script src="https://d3js.org/d3.v6.min.js"></script>
		<script type="text/javascript" src="resources/js/rank.js"></script>

	</section>
</body>
</html>