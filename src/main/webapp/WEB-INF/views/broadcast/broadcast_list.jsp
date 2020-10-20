<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
            <div class="broadcast-thumnail">

            </div>
            <div class="broadcast-name">
                <p><a href="#">아티스트이름</a></p>
                <p><a href="#">방제목</a></p>
                <p>설명</p>
            </div>
        </div>
    </section>

</body>
</html>