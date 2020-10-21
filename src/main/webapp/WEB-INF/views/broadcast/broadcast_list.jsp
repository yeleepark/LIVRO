<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel ="stylesheet" href="resources/css/broadcast_list.css">
<title>LIVRO</title>
</head>
<body> 

    <jsp:include page="/WEB-INF/views/header/header.jsp"/>
    
    <section>
    	<input type="button" value="방송하기" onclick="location.href='broadInsert.do'">
        <div class="broadcast-table">
        	<c:choose>
        	<c:when test="${empty list }">
        		<div>
        			<span>방송 없습니다~~</span>
        		</div>
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${list }" var="dto">
		            <div class="broadcast-thumnail">
						
		            </div>
		            <div class="broadcast-name">
		            	<p><a href="artist.do?member_nickname=${dto.member_nickname }">${dto.member_nickname }</a></p>
		                <p><a href="broadDetail.do?broadcast_no=${dto.broadcast_no }">${dto.broadcast_title }</a></p>
		                <p>${dto.broadcast_content }</p>
		            </div>
	            </c:forEach>
            </c:otherwise>
            </c:choose>
        </div>
    </section>

</body>
</html>