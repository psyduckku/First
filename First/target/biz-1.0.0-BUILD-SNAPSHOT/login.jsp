<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4f58cdeb20.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
﻿<jsp:include page="./include/header.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="top_section"></div>
		<div class="form_section">
			<div class="wrap_form">
				<div class="login_box">
					<div class="logo_bar" align="center"> <h1>로그인</h1> </div>
					
					<div class="user_box">
					<form action="getUser.do" method="post">
						<ul>
							<li>
								<div class="head">아이디</div> <input type="text" name="id" value="admin">
							</li>
							<li>
								<div class="head">비밀번호</div> <input type="password" name="pswd" value="qwe123">
							</li>
						</ul>
						<input type="submit" class="join" value="로그인">
					</form>
					<div class="info_user">
						<a href="join.jsp" class="join_a">회원가입</a>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>