<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/choose/choosemodify.css">

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script> <!-- Swiper 적용 -->
<script src="${path}/resources/js/admin/choose/chooseDetail.js"  defer></script>


</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 


<div class="wrap">
	<div class="container">
		<form name="inputform" action="${path}/modifychooseDetailAction.ch" method="post" enctype="multipart/form-data">
			<input type="hidden" name="ch_title1" value="${dto.ch_image}"> 
			<!-- 이미지 추가선택 안할경우 원래 이미지 넘겨주기 위해 히든 사용 -->
			<table>
				<tr class="width100">
					<th> 현재 이미지 </th>
					<td>
	                	<img src="${path}/${dto.ch_image}" style="width:600px">
	                </td>
				</tr>
				
				<tr class="width100">
	                <th> 변경 이미지</th>
	                <td>
	                    <input type="file" name="ch_image" id="ch_image " accept="image/*">
	                </td>
	            </tr>   
	            
	            <tr class="width100">
	                <th> 제목1</th>
	                <td>
	                    <input type="text" id="ch_title1" name="ch_title1" value="${dto.ch_title1}"  placeholder="#태그" required >
	                </td>
	            </tr>
	            
	            <tr class="width100">
	                <th> 제목2</th>
	                <td>
	                    <input type="text" id="ch_title2" name="ch_title2" value="${dto.ch_title2}"  placeholder="#태그" required >
	                </td>
	            </tr>
	            
	            <tr class="width100">
	                <th>태그 메세지1</th>
	                <td>
	                    <input type="text" id="ch_tags1" name="ch_tags1" value="${dto.ch_tags1}"  placeholder="#태그" required >
	                </td>
	            </tr>
	            
	            <tr class="width100">
	                <th>태그 메세지2</th>
	                <td>
	                    <input type="text" id="ch_tags2" name="ch_tags2" value="${dto.ch_tags2}"  placeholder="#태그" required >
	                </td>
	            </tr>
			
				 <tr>
	                <th>세부 정보</th>
	                <td>
	                    <textarea name="ch_detail" id="ch_detail" placeholder="소개말 작성" rows="15" cols="60" style="resize:none;" required>${dto.ch_detail}</textarea>
	                </td>
	            </tr>
			</table>
			
			<div class="btnup">
				<input class="inputButton" type="submit" value="여행지 수정">
				<input class="inputButton" type="button" value="여행지 수정 취소" onclick="myInfoBTN('${path}')">
			</div>
		</form>
	</div>
</div>


<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
<!-- footer 종료 -->


</body>
</html>