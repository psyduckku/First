<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4f58cdeb20.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<nav>
			<div class="logo_nav">
				<a href="index.jsp">
					<i class="fa-solid fa-shield-dog"></i>
					SaveAnimals	
				</a>
			</div>
			<ul class="menu_nav">
					<li><a href="intro.jsp">소개</a></li>
					<li><a href="getAnimalList.do">유기동물명단</a></li>
					<li><a href="getAdoptBoardList.do">분양후기게시판</a></li>
			</ul>
			<ul class="login_bar">
					 <c:choose>
					 	<c:when test="${loginUser!=null}">
					 		<li class="login"><a href="#">${loginUser.id}</a></li>
					 	</c:when>
					 	<c:otherwise>					
							<li class="login"><a href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> 로그인</a></li>
						</c:otherwise>
					</c:choose> 
			</ul>
			
			<a href="#" class="navbar_toggleBtn">
			<i class="fa-solid fa-bars"></i>
			</a>
		</nav>
	</header>
</body>
<script type="text/javascript">
	const toggleBtn = document.querySelector('.navbar_toggleBtn');
	const menu = document.querySelector('.menu_nav');
	const loginBar = document.querySelector('.login_bar');
	
	toggleBtn.addEventListener('click', ()=> {
		menu.classList.toggle('active');
		loginBar.classList.toggle('active');
	});
</script>
</html>