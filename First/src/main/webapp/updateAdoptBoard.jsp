<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/writeFreeBoard.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div id="container" style='margin-top: 100px;'>
<h1 align="center">게시글 수정</h1>
<form action="updateAdoptBoard.do" method="post">
	<table class="table table-hover" id="contentTable">
		<tr class="table-default">
			<td><textarea style='resize:none;' maxlength="20" placeholder="제목을 입력하세요." rows="1" cols="100" name="TITLE" required="required"></textarea> </td>
		</tr class="table-default">
		<tr class="table-default">
			<td><textarea style='resize:none;' maxlength="6" placeholder="닉네임을 입력하세요." rows="1" cols="100" name="NICK" required="required"></textarea> </td>
		</tr class="table-default">
		<tr>
			<td><textarea style='resize:none;' maxlength="2000" placeholder="내용을 입력하세요." rows="10" cols="100" name="CONTENT" required="required"></textarea></td>
		</tr>
		<tr> <td><input style='margin-left: 30px;' type="file" value="이미지삽입" name="file1"></input></td></tr>
		<tr>
			<td> <input style='margin-left: 320px; width:50px;' type="submit" value="작성"></input> <input  style='margin-left: 30px; width:50px;' type="button" value="취소"> </td>
		</tr>
	</table>
</form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</html>