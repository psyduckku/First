<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/join.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4f58cdeb20.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
﻿<jsp:include page="./include/header.jsp"></jsp:include>
<body>
	<div class="top_section"> </div>
	<div class="form_section">
		<div class="wrap_form">
			<div class="join_box">
				<div class="title" align="center"> <h1>회원가입</h1></div>
				<form action="insertUser.do" method="post" name="form">
					<input type="hidden" name="grade">
					<input type="hidden" name="joinDate">
					<ul>
						<li>
							<div class="head">아이디</div> <input type="text" name="id">
						</li>
						<li>
							<div class="head">비밀번호</div> <input type="password" name="pswd">
						</li>
						<li>
							<div class="head">이름</div> <input type="text" name="name">
						</li>
						<li>
							<div class="head">닉네임</div> <input type="text" name="nick">
						</li>
						<li>
							<div class="head">연락처</div> <input type="number" name="phone">
						</li>
						<li>
							<div class="head">주소</div> <input type="text" name="addr">
						</li>
						<li> <input type="submit" value="등  록" class="join"></li>
					</ul>
			</form>
			</div>
		</div>
	</div>
</body>
﻿<jsp:include page="./include/footer.jsp"/>
</html>