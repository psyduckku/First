<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="top_section"></div>
		<div class="form_section">
			<div class="wrap_form">
				<div class="login_box">
					<div class="logo_bar"> <h1>로그인</h1> </div>
					
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
						<input type="submit" class="submit" value="로그인">
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