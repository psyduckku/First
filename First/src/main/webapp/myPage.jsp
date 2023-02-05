<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<div class="top_section"> </div>
	<div class="form_section">
		<div class="wrap_form">
			<div class="join_box">
				<div class="title" align="center"> <h1>마이페이지</h1></div>
				<form name="form">
					<input type="hidden" name="grade">
					<input type="hidden" name="joinDate">
					<ul>
						<li>
							<div class="head">아이디</div>  <input type="text" id="id" name="id" value="${myInfo.id}" readonly>
						</li>
						<li>
							<div class="head">비밀번호</div> <input type="password" id="pswd" name="pswd" value="${myInfo.pswd}">
						</li>
						<li>
							<div class="head">이름</div>  <input type="text" id="name" name="name" value="${myInfo.name}">
						</li>
						<li>
							<div class="head">닉네임</div> <input type="text" id="nick" name="nick" value="${myInfo.nick}">
						</li>
						<li>
							<div class="head">연락처</div> <input type="text" id="phone" name="phone" value="${myInfo.phone}">
						</li>
						<li>
							<div class="head">주소</div> <input type="text" id="addr" name="addr" value="${myInfo.addr}">
						</li>
					</ul>
					<button type="button" onclick="sendToForm();return false;">수정완료</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function sendToForm(){
	
	var pswd=$('input#pswd').val();
	var name=$("#name").val();
	var nick=$("#nick").val();
	var phone=$("#phone").val();
	var addr=$("#addr").val();
	
	if(pswd==""||pswd.length==0){
		alert('비밀번호를 입력해주세요');
	}else if(name==""||name.length==0){
		alert('이름을 입력해주세요');
	}else if(nick==""||nick.length==0){
		alert('닉네임을 입력해주세요');
	}else if(phone==""||phone.length==0){
		alert('이름을 입력해주세요');
	}else if(addr==""||addr.length==0){
		alert('주소를 입력해주세요');
	}
	document.form.method='post';
	document.form.action='updateUser.do';
	document.form.submit();
	alert('회원정보 수정완료')
    setTimeout(function() {   
        window.close();
     });
	
	
}
</script>
</html>