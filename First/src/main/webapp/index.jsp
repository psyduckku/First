<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4f58cdeb20.js" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/home.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<jsp:include page="./include/header.jsp"></jsp:include>
<body>
<div class="top">
			<div class="topSection" style="text-align: center">
				<div class="topCon">
					<h1>당신의 착한 마음을 응원합니다<i class="fa-solid fa-heart"></i></h1>
				</div>
			</div>
</div>
<section>
	<div class="left">
			<div class="mainSection">
<!-- 				<div class="content"> -->
<!-- 					<div class="pic"><h1>사진</h1></div> -->
<!-- 				 	<div class="con"><h1>컨텐츠2</h1></div> -->
<!-- 				 </div> -->
			</div>
	</div>
	<div class="right">
			<div class="asideSection">
				<div id="myInfoSection" class="sideCon">
		
		<c:choose>
		 	<c:when test="${loginUser!=null}">
		 		<li><a href="#">${loginUser.id}</a>님 환영합니다.</li>
		 		<li><a href="logoutUser.do">(로그아웃)</a></li>
		 		<li><a href="javascript:getMypage()">마이페이지</a></li>
		 	</c:when>
		 	<c:otherwise>					 
				<li><a href="login.jsp">로그인</a></li>
			</c:otherwise>
		</c:choose>
				</div>
				<div id="imminentNotice">
					<p class="imminentNotice_title">공고기한임박</p>
				</div>
<!-- 				<div id="addCon" class="sideCon"> -->
<!-- 					<h1>광고창</h1> -->
<!-- 				</div> -->
<!-- 				<div id="weatherCon" class="sideCon"> -->
<!-- 					<h1>날씨창입니다.</h1> -->
<!-- 				</div> -->
			</div>
	</div>
	</section>
	
</body>
<jsp:include page="./include/footer.jsp"></jsp:include>
<script type="text/javascript">
function getMypage(){
	var _width='400px';
	var _height='600px';
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2);
    var l_px=300;
    var top_px=200;
	window.open('getMyInfo.do','개인정보','width='+_width+',height='+_height+',scrollbars=yes, left='+_left+',top'+_top+', left=600, top=250 ');
}

$(document).ready(function(){
	$.ajax({
		url: "getAsideList.do", 
		type: "get",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType : "json",
		success:function(data){
			if(data.length==0){
				console.log("Output failed for aside list.");
			}else{
				console.log("출력성공:"+data);
			}
			for(var i in data){
				$("#imminentNotice").append("<div style='overflow:hidden; clear:both';><p class='species'; style='text-align:center';>"+data[i].species_NM+"</p></div>");
				$("#imminentNotice").append("<div style='clear:both'; class='deadContent'><div style='float:left';>" +
				"<a href='getAnimal.do?ASEQ="+data[i].aseq+"'><img style='width:85px;height:85px;' src="+data[i].image_COURS+"></a></div>" +
				"<div style='float:left';>"+
					"<a href='getAnimal.do?ASEQ="+data[i].aseq+"'><p class='deadText' style='margin-top:20px;'>공고일:"+data[i].pblanc_BEGIN_DE+"~"+data[i].pblanc_END_DE+"<br>"+
					"지역:"+data[i].sigun_NM+
					"<br> 발견장소:"+data[i].discvry_PLC_INFO+"</p><a/></div></div>");
			}
			console.log("getAsideList 출력완료");
		},
		error:function(){
			console.log("getAsideList 실패");
		}
	});
});
$(document).ready(function(){
	$.ajax({
		url: "setFlagPost.do", 
		type: "get",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType : "json",
		success:function(data){
			console.log(data);
			for(var i in data){
				$(".mainSection").append("<div class='content'><div class='pic'><a href='getAdoptBoard.do?SEQ="+data[i].seq+"'><img style='width:100%;height:100%;' src=${contextPath}/download.do?SEQ="+data[i].seq+"&STORED_FILE_NAME="+data[i].stored_FILE_NAME+"/></a></div><div class='con'><div class='con_title'><p><a href='getAdoptBoard.do?SEQ="+data[i].seq+"'>"+data[i].title+"</a></p></div><br><div class='con_content'>"+data[i].content+"</div></div></div>");
			}
		},
		error:function(){
			console.log("setAdoptPost 실패");
		}
	});
});
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</html>