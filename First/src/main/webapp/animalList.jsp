<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet" href="css/animalList1.css">
<title>Insert title here</title>
</head>
<jsp:include page="./include/header.jsp"/>
<body>
<h1 style="text-align: center">유기동물명단</h1>
<div class="table_container">
<div class="subnav"> 
<form action="getAnimalList.do" method="post">
	<select name="sortRegion">
<!-- 		<option value="">지역검색 -->
		<c:forEach items="${sortRegion}" var="rigion">
			 <option value="${rigion.value}">${rigion.key }>
		</c:forEach>
<!-- 		</option> -->
	</select>
	<select name="sortAnimal">
<!-- 		<option value="">동물분류 -->
			<c:forEach items="${sortSpecies}" var="species">
				<option value="${species.value}">${species.key }
			</c:forEach>	
<!-- 		</option> -->
	</select>
	<input type="submit" value="검색">
</form>
</div>
	<table class="table table-hover">
	    <tr class="table-active">
			<td scope="col">이미지</td>
			<td scope="col" id="sigun">시군</td>
			<td scope="col" id="dscvr">발견장소</td> 
			<td scope="col" id="recept">접수일자</td>
			<td scope="col" id="species">품종</td>
			<td scope="col" id="state">상태</td>
			<td scope="col" id="crct">특징</td>
	    </tr>
	  <c:forEach var="list" items="${list }">
	    <tr>
			<td id="list_img"><a href= "getAnimal.do?ASEQ=${list.ASEQ}"><img src=${list.IMAGE_COURS}></a></td>
			<td>${list.SIGUN_NM}</td>
			<td>${list.DISCVRY_PLC_INFO}</td>
			<td>${list.RECEPT_DE}</td>
			<td>${list.SPECIES_NM}</td>
			<td>${list.STATE_NM}</td>
			<td>${list.SFETR_INFO}</td>
	    </tr>
	  </c:forEach>
	</table>
</div>
</body>
<jsp:include page="./include/footer.jsp"/> 
<script type="text/javascript">
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

</html>