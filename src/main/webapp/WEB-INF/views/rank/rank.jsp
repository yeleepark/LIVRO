<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://d3js.org/d3.v6.min.js"></script>
<link rel="styleshee" href="resources/css/rank.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />
	<section>
	
		<svg width="500" height="300"></svg>

		<p>탑3</p>
		<c:forEach items="${rankdto }" var="rank">
		<div>
			아이디 : <input type="text" value="${rank.member_id }" class="top3id">
			순위 : <input type="text" value="${rank.rank }">
			팔로워 수 : <input type="text" value="${rank.count }" class="top3count">
		</div>
		</c:forEach>

		<script src="https://d3js.org/d3.v6.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/rank.js"></script>
	</section>
</body>
</html>