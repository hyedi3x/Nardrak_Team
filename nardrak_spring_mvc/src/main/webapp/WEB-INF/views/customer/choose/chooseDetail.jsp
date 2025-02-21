<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/choose/choosemodify.css">

<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/choose/chooseDetail.js" defer></script>

</head>
<body>

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 
	

<!-- main 시작 -->
<div class="wrap">
	<div class="container">
		
		<form name="chooseform" action="addChooseDetailAction.ch" method="post" enctype="multipart/form-data">
	        
	        <table>  
	        
	            <tr class="width100">
	             	<th>제목1</th> 
	             	<td>
						 <input type="text" id="ch_title1" name="ch_title1" placeholder="소개글" required >	
					</td>
				</tr>
				
				<tr class="width100">
	                <th>제목2</th>
	                <td>
	                    <input type="text" id="ch_title2" name="ch_title2" placeholder="소개글" required >
	                </td>
	            </tr>
				
	            <tr class="width100">
	                <th>태그1</th>
	                <td>
						<input type="text" id="ch_tags1" name="ch_tags1" placeholder="소개글" required>
					</td>
	            </tr>
	            
	             <tr class="width100">
	                <th>태그2</th>
	                <td>
						<input type="text" id="ch_tags2" name="ch_tags2" placeholder="소개글" required>
					</td>
	            </tr>
	                   
	             <tr class="width100">
	                <th>이미지</th>
	                <td>
	                    <input type="file" name="ch_image" id="ch_image " accept="image/*" required>
	                </td>
	            </tr>   
	            
	           	<tr>
	           		 <th>상세정보</th>
	           		<td>
	           			<textarea rows="5" cols="85" name="ch_detail" id="ch_detail" placeholder="상세정보 작성" style="resize:none;" required></textarea>
	           		</td>
	           	</tr>	           		
  			</table>

          		<!-- 등록 버튼 -->
	        <div class="btnDiv">
	            <input class="inputButton" type="submit" value="정보 등록"> 
	            <input class="inputButton" type="button" value="등록취소" onclick="myInfoBTN('${path}')">
	        </div> 
	    </form>
		
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>