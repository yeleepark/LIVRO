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
    	<c:if test="${logindto.member_role == 'A' }">
    		<input type="button" id="broadgo" value="방송하기" onclick="broadGo()">
		    	<script type="text/javascript">
		    		function broadGo(){
		    			open("live.do","","width=2000, height=800");
		    		}
		    	</script>    		
    	</c:if>
    	
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
	<c:choose>
    	<c:when test="${empty logindto }">
    		<p>${dto.member_id }</p>
    		<p>${dto.broadcast_title }</p>
    		<p>${dto.broadcast_content }</p>
    	</c:when>
    	<c:otherwise>   		
		    <p><a href="artist.do?member_id=${dto.member_id }">${dto.member_id }</a></p>
		    <p><a href="broadDetail.do?broadcast_no=${dto.broadcast_no }">${dto.broadcast_title }</a></p>
		    <p>${dto.broadcast_content }</p>
    	</c:otherwise>
    </c:choose>
		            </div>
	            </c:forEach>
            </c:otherwise>
            </c:choose>
        </div>
    </section>

</body>
</html>