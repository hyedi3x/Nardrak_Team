<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminAccessList</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/accessList/accessList_admin.css" />
<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/accessList/accessList.js" defer></script>

</head>
<body>

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 

<!-- main 시작 -->
<div class="wrap">
	
	<div class="container">
		
		<form action="#" method="post" name="joinForm" onsubmit="return submitChk()">
			<table>
				<tr class="font20" >
					<th id="noTh">no</th>
					<th id="idTh">아이디</th>
					<th id="accTh">권한상태</th>
					<th id="dateTh">요청일</th>
				</tr>
				<c:set var="no" value="0"/>
				<c:forEach var="dto" items="${list}">
					<tr>	
						<td>${no = no+1}</td>
						<td><a href="${path}/pwdChkModify.do?user_id=${dto.ad_id}&user_pwd=${dto.ad_pwd}">${dto.ad_id} [정보 조회]</a></td>
						<td>
							<input type="checkbox" id="${dto.ad_id}" name="${dto.ad_id}" class="accessCheckbox" value="${dto.ad_id}">
							<a href="#"><label for="${dto.ad_id}">${dto.access_status} [권한 승인]</label></a>
						</td>
						<td>${dto.ad_regDate}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<input type="checkbox" id="checkedAll" onclick="allCheck()"> 전체 선택
						<input type="button" id="accessBTN" onclick="accessSubmit()" value="권한주기"> 
					</td>
				</tr>
			</table>
			
			<div id="pagingTd" class="font16">
				
				<a class="font16" href="${path}/adminAccess.ad?page=${paging.prev}"> << </a>
				
				<c:forEach var="num" begin="${paging.startBlock}" end="${paging.endBlock}">
					<a class="font16" href="${path}/adminAccess.ad?page=${num}">${num}</a>
				</c:forEach>
				
				<a class="font16" href="${path}/adminAccess.ad?page=${paging.next}"> >> </a>
				
			</div>
		</form>
		
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>