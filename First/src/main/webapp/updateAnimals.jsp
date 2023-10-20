<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>openAPI1</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	var animalList=[];
	var animals;

$(function(){
   $.ajax({
      method : "GET",
      url : "https://openapi.gg.go.kr/AbdmAnimalProtect?Key=aaa&Type=json&pIndex=1&pSize=300",
      dataType:"json",
      success:function(data) {
         console.log(data.AbdmAnimalProtect)
         console.log(data.AbdmAnimalProtect[1])
         if(data.AbdmAnimalProtect[1].row.length>0){
            for(var i in data.AbdmAnimalProtect[1].row){
            	animals={
					SIGUN_CD : data.AbdmAnimalProtect[1].row[i].SIGUN_CD,
					SIGUN_NM : data.AbdmAnimalProtect[1].row[i].SIGUN_NM,
					ABDM_IDNTFY_NO : data.AbdmAnimalProtect[1].row[i].ABDM_IDNTFY_NO,
					RECEPT_DE : data.AbdmAnimalProtect[1].row[i].RECEPT_DE,
					DISCVRY_PLC_INFO : data.AbdmAnimalProtect[1].row[i].DISCVRY_PLC_INFO,
					STATE_NM : data.AbdmAnimalProtect[1].row[i].STATE_NM,
					PBLANC_IDNTFY_NO : data.AbdmAnimalProtect[1].row[i].PBLANC_IDNTFY_NO,
					PBLANC_BEGIN_DE : data.AbdmAnimalProtect[1].row[i].PBLANC_BEGIN_DE,
					PBLANC_END_DE : data.AbdmAnimalProtect[1].row[i].PBLANC_END_DE,
					SPECIES_NM : data.AbdmAnimalProtect[1].row[i].SPECIES_NM,
					COLOR_NM : data.AbdmAnimalProtect[1].row[i].COLOR_NM,
					AGE_INFO : data.AbdmAnimalProtect[1].row[i].AGE_INFO,
					BDWGH_INFO : data.AbdmAnimalProtect[1].row[i].BDWGH_INFO,
					SEX_NM : data.AbdmAnimalProtect[1].row[i].SEX_NM,
					NEUT_YN : data.AbdmAnimalProtect[1].row[i].NEUT_YN,
					SFETR_INFO : data.AbdmAnimalProtect[1].row[i].SFETR_INFO,
					SHTER_NM : data.AbdmAnimalProtect[1].row[i].SHTER_NM,
					SHTER_TELNO : data.AbdmAnimalProtect[1].row[i].SHTER_TELNO,
					PROTECT_PLC : data.AbdmAnimalProtect[1].row[i].PROTECT_PLC,
					REFINE_ROADNM_ADDR : data.AbdmAnimalProtect[1].row[i].REFINE_ROADNM_ADDR,
					REFINE_LOTNO_ADDR : data.AbdmAnimalProtect[1].row[i].REFINE_LOTNO_ADDR,
					REFINE_ZIP_CD : data.AbdmAnimalProtect[1].row[i].REFINE_ZIP_CD,
					JURISD_INST_NM : data.AbdmAnimalProtect[1].row[i].JURISD_INST_NM,
					IMAGE_COURS : data.AbdmAnimalProtect[1].row[i].IMAGE_COURS,
					THUMB_IMAGE_COURS : data.AbdmAnimalProtect[1].row[i].THUMB_IMAGE_COURS
            	}
            	animalList.push(animals);
				console.log(animalList.length);
            }
            
         $(function(){
    		$.ajax({
    				type: "POST",
    				url: "insertAnimal.do",
    				data: { target : JSON.stringify(animalList) }, //target이라는 이름으로 데이터가 controller로보내짐
    				traditional: true, // 데이터에 배열을 전송할 때 데이터 직렬화를 하는 옵션
    				success: function(data){
    					console.log('서블릿전송 성공:'+data);
    				},
    				error: function(){
    					console.log('서블릿전송 실패 :'+data);
    				}
    			})
    	});

         }               
      }
   });
});


</script>
</head>
<body>
		<a href="index.jsp">홈으로가기</a>
</body>
</html>
