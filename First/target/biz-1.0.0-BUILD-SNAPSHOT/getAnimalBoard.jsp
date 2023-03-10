<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/getAnimalBoard1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
﻿<jsp:include page="./include/header.jsp"></jsp:include>
<body>
	<div class="img">
		<img src=${info.IMAGE_COURS }>
	</div>

	<table class="table table-hover" id="contentTable">

    <tr>
      <th>공고고유번호</th>
      <td colspan="3">${info.PBLANC_IDNTFY_NO }</td>
    </tr>
    <tr class="table-default">
      <th>공고시작일자</th>
      <td>${info.PBLANC_BEGIN_DE }</td>
      <th>공고종료일자</th>
      <td>${info.PBLANC_END_DE }</td>
    </tr>
    <tr class="table-default">
      <th>품종</th>
      <td>${info.SPECIES_NM }</td>
      <th>나이/체중</th>
      <td>${info.AGE_INFO }/${info.BDWGH_INFO }</td>
    </tr>
    
    <tr class="table-default">
      <th>특징</th>
      <td colspan="3">${info.SFETR_INFO }</td> 
    </tr>
    <tr class="table-default">
      <th>발견장소</th>
      <td colspan="3">${info.DISCVRY_PLC_INFO }</td> 
    </tr>
    <tr class="table-default">
      <th>보호소명</th>
      <td>${info.SHTER_NM }</td>
      <th>보호소 전화번호</th>
      <td>${info.SHTER_TELNO }</td> 
    </tr>
    <tr class="table-default">
      <th>보호소 주소</th>
      <td colspan="3">${info.REFINE_ROADNM_ADDR }</td> 
    </tr>
</table>

<table class="table table-hover" id="replyList">
	<tr><td>내용</td> <td>아이디 일시</td> <td>좋아요</td></tr>
</table>

<form id="replyForm">
	<table class="table table-hover"  id="replyInput">
		<tr>
			<td>
				
				<div class="form-group">
			      <label for="reply" class="form-label mt-4">댓글남기기</label>
			      <input type="hidden" name="aseq" value="${info.ASEQ }">
			      <input type="text" id="reply" class="form-control" name="reply" aria-describedby="emailHelp" placeholder="Enter Reply">
			      <small id="notice" class="form-text text-muted">댓글입력고고</small>
			      <button type="button" class="btn btn-primary" id="insertReply">Submit</button>
	    		</div>
			</td>
		</tr>
	</table>
</form>

</body>
﻿<jsp:include page="./include/footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
//댓글목록 출력
 var ASEQ = '${info.ASEQ }'
	$(document).ready(function(){
		$.ajax({
			url: "getAnimalReplyList.do",
			type: "post",
			dataType: "json",
			data: { "ASEQ" : ASEQ },
			async: false,
			success : function(data){
				for(var i in data){
					console.log(data[i].reply);
						$("#replyList").append("<tr><td>"+data[i].reply+"</td><td>"+data[i].id+"("+data[i].regdate+")</td> <td>"+data[i].aseq_LIKE+"/"+data[i].aseq_DISLIKE+"</td></tr>")
				}
			},error:function(){ alert('request is failed!!'); },
		}) 
	});
 //댓글 입력
 $('#insertReply').click(function(){
	 if(${ID==null}){
		 alert('로그인을 해주세요.');
	 }else{
		 var data;
		 var dataString;
		 	$.ajax({
		 		url : "${contextPath}/insertAnimalReply.do",
		 		type : "post",
		 		dataType: "json",
		 		data : $("#replyForm").serialize(),
		 		async : false,
		 		success : function(result)
		 		{	 
		 			data=result;
		 			dataString=JSON.stringify(data);
		 		}
		 		,error: function(){
		 			alert("통신에 실패했습니다.");
		 		},complete: function(){
		 			$("#replyList").append("<tr><td>"+data.reply+"</td><td>"+data.id+"("+data.regdate+")</td> <td>"+data.aseq_LIKE+"/"+data.aseq_DISLIKE+"</td></tr>");
		 			$("#reply").val('');
		 		}
		 	})
	 	return data;
	 }
})
	


</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</html>