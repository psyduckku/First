<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/insertAdoptBoard.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var cnt=1;
function fn_addFile(){
	$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"'/>");
	cnt++;
}
</script>
<body>
<div class="top" style='margin-top: 50px;'></div>

<h1 align="center" style='width: 100%'>분양후기작성</h1>
<div id="container" style='margin-top: 30px; width: 800px;'>
<form method="post" action="insertAdoptBoard.do" enctype="multipart/form-data">
	<table class="table table-hover" id="contentTable">
		<tr class="table-default">
			<td><textarea style='resize:none;' maxlength="20" rows="1" cols="100" class="content" name="TITLE" required="required" placeholder="제목"></textarea> </td>
		</tr class="table-default">
		<tr>
			<td><textarea style='resize:none;' maxlength="2000" rows="10" cols="100" class="content" name="CONTENT" required="required" placeholder="내용"></textarea></td>
		</tr>
		<tr><td>
			<input style='margin-left: 30px;' type="button" value="파일추가" onClick="fn_addFile()"/>
			<input type="hidden" name="ID" value="${ID }">
			<div id="d_file">
			</td></tr>
	</table>
	
				 <input type="submit"  value="확인" style='margin-left: 320px; width:50px;'/>
</form>

</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</html>