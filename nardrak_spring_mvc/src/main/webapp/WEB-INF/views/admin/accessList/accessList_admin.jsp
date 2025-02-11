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

</head>
<body>

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 
	

<!-- main 시작 -->
<div class="wrap">
	
	<div class="container">
		
		<form action="${path}/adminAccess.ad" method="post" name="joinForm" onsubmit="return submitChk()">
		
			<table>
				<tr class="font20" >
					<th id="noTh">no</th>
					<th id="idTh">아이디</th>
					<th id="accTh">권한상태</th>
					<th id="dateTh">요청일</th>
				</tr>
				<c:forEach var="dto" items="${list}">
					<tr>	
						<td>${1}</td>
						<td>${dto.ad_id}</td>
						<td>${dto.access_status}</td>
						<td>${dto.ad_regDate}</td>
					</tr>	
				</c:forEach>
				
	
			</table>
		</form>
		
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>