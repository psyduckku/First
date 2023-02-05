<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/adoptBoard.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<script src="https://kit.fontawesome.com/4f58cdeb20.js" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4f58cdeb20.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<jsp:include page="./include/header.jsp"/> 
<body>
<h1 align="center">분양후기 게시판</h1>
			<c:if test="${loginUser.id eq 'admin' }">
				<div class="flag">
					<a href="javascript:void(0);" id="flag" name="flag" onclick="callFunction();" data-flag="flag"><i class="fa-regular fa-flag"></i></a>
				</div>
			</c:if>
<form method="post" id="boardForm">
<!-- 토글박스 -->
	
<!--  -->		 
		<tr class="table-default">
			<td>
			<input type="hidden" name="SEQ" value="${adoptBoard.SEQ }">
			<textarea style='resize:none;' maxlength="20" rows="1" cols="100" class="content" name="TITLE" required="required" readonly="readonly">${adoptBoard.TITLE }</textarea> </td>
		</tr class="table-default">
		<tr class="table-default">
			<td><textarea style='resize:none;' maxlength="6" rows="1" cols="100" name="ID" required="required" readonly="readonly">${adoptBoard.ID }</textarea> </td>
		</tr class="table-default">
		<tr>
			<td>
			<textarea style='resize:none;' maxlength="2000" rows="10" cols="100" class="content" name="CONTENT" required="required" readonly="readonly">${adoptBoard.CONTENT }</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<c:forEach var="imageList" items="${imageList}">
					<img src="${contextPath}/download.do?SEQ=${adoptBoard.SEQ }&STORED_FILE_NAME=${imageList.STORED_FILE_NAME}" width=270 height=270/>
				</c:forEach>
			</td>
		</tr>
<%-- 		<c:if test="${loginUser.id  eq adoptBoard.ID}"> --%>
<!-- 		<tr><td> -->
<!-- 			<input style='margin-left: 30px;' type="file" name="file1"></input> -->
<%-- 			<input type="hidden" name="SEQ" value="${adoptBoard.SEQ }"> --%>
<!--  			</td></tr> -->
<%-- 		</c:if> --%>

		<div class="sub_menu">
				<input type="button" onclick="location.href='getAdoptBoardList.do';" value="목록보기" style='margin-left: 370px;'>
				<c:if test="${loginUser.id!=null }">
					<input type="button" onclick="location.href='#';" value="답글달기">
				</c:if>
				<c:choose>
					<c:when test="${loginUser.id  eq adoptBoard.ID }">
						 <input type="button" id="check" onclick="reWrite(this.form)" value="수정" style='width:50px;'/>
						 <input type="button" id="check" onclick="doDelete()" value="삭제" style='width:50px;'/>
					</c:when>
					<c:otherwise>
						  <input type="button" value="추천" style='margin-left: 30px; width:50px;' />
					</c:otherwise>
				</c:choose>
		</div>

	</table>
</form>

<table class="table table-hover" id="replyList" style="border:'1px sold black'; " >
	<tr><td>내용</td> <td>작성자</td><td>like||disLike</td></tr>
		
	<c:forEach items="${list }"  var="list" >
		<tr id="addReply">
			<td>${list.REPLY } </td> <td>${list.ID }(${list.REGDATE })</td><td>${list.SEQ_LIKE }||${list.SEQ_DISLIKE }</td>
		</tr>
	</c:forEach>
</table>

<form id="replyForm">
	<table class="table table-hover">
		<tr>
			<td>
				<div class="form-group">
			      <label for="reply" class="form-label mt-4">댓글남기기</label>
			      <input type="hidden" name="seq" value="${adoptBoard.SEQ}" id="seq">
			      <input type="text" name="reply" class="form-control" id="reply" aria-describedby="emailHelp" placeholder="Enter Reply">
			      <small id="notice" class="form-text text-muted">댓글입력고고</small>
			      <button id="insertReply" type="button" class="btn btn-primary">Submit</button>
	    		</div>
			</td>
		</tr>
	</table>
</form>
</body>
<jsp:include page="./include/footer.jsp"/> 
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
var check = $("input[type='checkbox']");
check.click(function(){
	$("p").toggle();
});

function callFunction() {
	const flag=document.querySelector('#flag');
	$.ajax({
		url : "${contextPath}/setAFlag.do",
		type: "post",
		data : {seq:${adoptBoard.SEQ }},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType:"text",
		success : function(data){
			console.log('통신성공');
			alert(data);
		},
		error : function(){
			console.log('통신실패');
		}
	})
}

$('#insertReply').click(function(){
	if(${ID==null}){
		alert('로그인을 해주세요');
	}else{
		var data;
		var dataString;
		$.ajax({
	 		url : "${contextPath}/insertAdoptReply.do",
	 		type : "post",
	 		dataType: "json",
	 		data : $("#replyForm").serialize(),
	 		async : false,
	 		success : function(result){
	 			data=result;
	 			dataString=JSON.stringify(data);
	 			console.log(dataString);
	 		},
	 		error: function(){
	 			console.log('통신실패');
	 		},
	 		complete : function(){
				$("#replyList").append("<tr><td>"+data.reply+"</td><td>"+data.ID+"("+data.REGDATE+")</td><td>"+data.SEQ_LIKE+"||"+data.SEQ_DISLIKE+"</td></tr>");
				$("#reply").val('');
	 		}
	 	})
	 	return data;
	}
	
})

function reWrite(){
		 alert('무야호~');
	$('.content').removeAttr('readonly');
	$('.content').removeAttr('readonly');	
	$('#check').attr('value','확인');
	$('#check').attr('onclick','doUpdate(boardForm)');
}
function doUpdate(obj){
	obj.action="${contextPath}/updateAdoptBoard.do";
	obj.submit();
	alert('수정하였습니다.');
}

function doDelete(){
	var confirm_val=confirm("게시물을 삭제하시겠습니까?");
	if(confirm_val==true){
		location.href="deleteAdoptBoard.do?SEQ=${adoptBoard.SEQ}";
	}else{}
	
}

// $(document).ready(function(){
// 	var data;
// 	var dataString;
// 	 	$.ajax({
// 	 		url : "${contextPath}/download.do",
// 	 		type : "post",
// 	 		dataType: "json",
// 	 		data : $("#replyForm").serialize(),
// 	 		async : false,
// 	 		success : function(result){
// 	 			data=result;
// 	 			dataString=JSON.stringify(data);
// 	 			console.log(dataString);
// 	 		},
// 	 		error: function(){
// 	 			console.log('통신실패');
// 	 		},
// 	 		complete : function(){
// 				$("#replyList").append("<tr><td>"+data.reply+"</td><td>"+data.ID+"("+data.REGDATE+")</td><td>"+data.SEQ_LIKE+"||"+data.SEQ_DISLIKE+"</td></tr>");
// 				$("#reply").val('');
// 	 		}
// 	 	})
// 	 	return data;
// })

</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</html>