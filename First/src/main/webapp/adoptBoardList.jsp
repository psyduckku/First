<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/freeBoardList.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="./include/header.jsp"></jsp:include>
<body>
<div id="container">
<h1 align="center">자유게시판</h1>
	<table class="table table-hover" id="contentTable">
		<tr class="table-default">
			<td>번호</td><td>제목</td><td>작성자</td><td>작성일자</td><td>조회수</td>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr class="table-default">
			<td>${list.SEQ}</td> 
			<td><a href="getAdoptBoard.do?SEQ=${list.SEQ }">${list.TITLE }</a></td>
			<td>${list.ID }</td>
			<td>${list.REGDATE }</td>
			<td>${list.CNT }</td>
		</tr class="table-default">
		</c:forEach>
	</table>
		<form method="post" action="getAdoptBoardList.do">
			<table class="table" style='width: 1000px';>
				<tr>
					<td align="center">
						<select name="searchCondition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
						</select>
					<input type="text" name="searchKeyword"> 
					<input type="submit" value="검색">
					</td>
				</tr>
				<c:if test="${loginUser!=null}"> 
					<tr>
					<td align="right"><input type="button" onclick="location.href='insertAdoptBoard.jsp';" value="글쓰기"></input></td>
					</tr>
				</c:if>					
			</table>
		</form>
</div>
</body>
<jsp:include page="./include/footer.jsp"/> 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</html>