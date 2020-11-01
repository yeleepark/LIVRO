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
    		<input type="button" id="broadgo" value="방송하기" onclick="location.href='live.do?member_id=${logindto.member_id}'">
		    	  		
    	</c:if>
    	
        <div class="broadcast-table" id="broadcast-table-cnt">
			<c:forEach items="${list }" var="dto">
		        	<c:if test="${dto.broadcast_flag eq 'Y' }">
		        		<div>
		          	 	<div class="broadcast-thumnail">
							<a><img src="/resources/profileimg/${profiledto.profile_savedname }"></a>
		           		</div>
		          		<div class="broadcast-name">
		          			<div>
    							<p>아티스트 : <a href="artist.do?member_id=${dto.member_id }">${dto.member_nickname }</a></p>
		          			</div>
		          			<div>		          				
		  			    		<p>방송 제목 : <a href="broadDetail.do?broadcast_no=${dto.broadcast_no }">${dto.broadcast_title }</a></p>
		          			</div>
		          			<div>
		 			   			<p>방송 내용 : ${dto.broadcast_content }</p>
		          			</div>
		 			   		<div>
		 			   			<p>방송 카테고리 : ${dto.broadcast_category }</p>
		 			   		</div>
		            	</div>
		            	</div>
					</c:if>
            </c:forEach>
        </div>
    </section>
	<script>
		let ele =document.getElementsByClassName(('broadcast-table'))[0];
		let h1 = document.createElement('h1');
		
		if(ele.childElementCount < 1){
		
		// 방송이 하나도 없을 때 출력되는 메시지
		h1.innerHTML = '진행중인 방송이 없습니다 헤헤';
		
		ele.appendChild(h1);
		}
	</script>
</body>
</html>