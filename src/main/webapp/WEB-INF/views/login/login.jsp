<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/login.css">
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <title>LIVRO-로그인</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/main-header.jsp" %>
	
    <section>
        <div class="login-wrapper">
            <h2>Login</h2>
            <form action="#">
                <div>
                    <label for="user">Your ID</label>
                    <input type="text" id="user">
                </div>
                <div>
                    <label for="password">Password</label>
                    <input type="password" id="password">
                </div>
                <div>
                    <p><a href="#">ID/PW찾기</a></p>
                </div>
                <div>
                    <button>카카오로그인</button>
                    <button>네이버로그인</button>
                </div>
                <div>
                    <input type="button" value="Log In" onclick="#" id="goLoginBtn">
                    <a href="#">Don't have an Account?</a>
                </div>
            </form>
        </div>
    </section>
</body>
</html>