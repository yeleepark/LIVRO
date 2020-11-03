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
		<svg width="500" height="500"></svg>

		<c:forEach items="${rankdto }" var="rank">
			아이디 : <input type="text" value="${rank.member_id }">
			순위 : <input type="text" value="${rank.rank }">
			팔로워 수 : <input type="text" value="${rank.count }">
		</c:forEach>

		<script src="https://d3js.org/d3.v6.min.js"></script>
		<script>
        const dataFile = [30,40,50]; // 사용할 데이터를 배열로
        const color = ['yellow', 'lime', 'red'] // 컬러 지정
        const svg = d3.select('svg'); //svg 태그를 선택하라

        svg.selectAll('bar')
            .data(dataFile) //dataFile 배열에 있는 값 하나씩 넣기
            .enter().append('rect') // 막대그래프로
            .attr('fill', (d,i)=>{ return color[i]}) // 컬러 넣기
            .attr('height', (d,i)=>{return d})
            .attr('width', 40)
            .attr('x', (d,i) => {return 50*i})
            .attr('y', (d,i) => {return 100-dataFile[i]})
    </script>
	</section>
</body>
</html>