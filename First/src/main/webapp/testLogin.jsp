<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frmLogin" method="post" action="login" encType="UTF-8">
		아이디 : <input type="text" name="user_id"/><br>
		비밀번호 : <input type="password" name="user_pw"/><br>
		<input type="submit" value="로그인">
		<input type="hidden" name="user_address" value="서울시 성북구"/>
		<input type="hidden" name="user_email" value="test@gmail.com"/>
		<input type="hidden" name="user_hp" value="010-1111-1111"/>
	</form>
</body>
</html>