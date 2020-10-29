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
<style type="text/css">
	#section{
		padding-top: 80px;
	}
</style>
</head>
<body> 

    <jsp:include page="/WEB-INF/views/header/header.jsp"/>
    
    <section id="section">
    	<c:if test="${logindto.member_role == 'A' }">
    		<input type="button" id="broadgo" value="방송하기" onclick="broadGo()">
		    	<script type="text/javascript">
		    		function broadGo(){
		    			open("live.do","","width=2000, height=800");
		    		}
		    	</script>    		
    	</c:if>
    	
        <div class="broadcast-table">
			<c:forEach items="${list }" var="dto">
        		<c:choose>
        			<c:when test="${empty list }">
        				<div>
        					<span>방송 없습니다~~</span>
        				</div>
        			</c:when>
		        	<c:when test="${dto.broadcast_flag eq 'Y' }">
		          	 	<div class="broadcast-thumnail">
							<a><img src="/resources/profileimg/${profiledto.profile_savedname }"></a>
		           		</div>
		          		<div class="broadcast-name">
    						<p><a href="artist.do?member_id=${dto.member_id }">${dto.member_id }</a></p>
		  			    	<p><a href="broadDetail.do?broadcast_no=${dto.broadcast_no }">${dto.broadcast_title }</a></p>
		 			   		<p>${dto.broadcast_content }</p>
		            	</div>
		        	</c:when>
            	</c:choose>
            </c:forEach>
        </div>
    </section>

</body>
</html>