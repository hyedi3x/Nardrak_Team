<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.spring.nardrak_mvc.dto.CustomerDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerDeleteList</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/accessList/accessList_admin.css" />
<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/accessList/custmoerDelList.js" defer></script>

</head>
<body>

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 

<!-- main 시작 -->
<div class="wrap">
	
	<div class="container">
		
		<form action="${path}/customerDelete.ad" method="post" name="joinForm" onsubmit="return csDelSubmitChk()">
			<!-- js에서 hidden에 선택된 값들을 배열로 담아서 hidden에 담는다. request.getP로 받으면 문자열 1,2,3형태가 된다. -->
			<input type="hidden" id="cs_ids" name="cs_ids" value=""/>
			<table>
				<tr class="font20" >
					<th id="noTh">no</th>
					<th id="idTh">아이디</th>
					<th id="accTh">권한상태</th>
					<th id="dateTh">요청일</th>
				</tr>
				<c:set var="no" value="0"/>
				<!-- 회원 탈퇴는 30일 이후에 수동 처리 -->
				
				<c:forEach var="dto" items="${list}">
					
					<tr class="listTr">	
						<td>${dto.rn}</td>
						<td><a href="${path}/pwdChkModify.do?user_id=${dto.cs_id}&user_pwd=${dto.cs_pwd}">${dto.cs_id} [정보 조회]</a></td>
						<td>
							경과일 : ${fn:substring(dto.timeDiff,0,2)}일<br>
							<input type="checkbox" id="${dto.cs_id}" name="${dto.cs_id}" class="accessCheckbox" value="${dto.cs_id}" date="${fn:substring(dto.timeDiff,0,2)}" onchange="chkClick('${fn:substring(dto.timeDiff,0,2)}', '${dto.cs_id}')">
							<a href="#"><label class="chkLabel" for="${dto.cs_id}">${dto.delete_status} [회원 삭제]</label></a>
						</td>
						<td>${fn:substring(dto.cs_regDate,0,10)}</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="BTNTd" colspan="4">
						<input type="checkbox" id="checkedAll" onclick="allCheck()"><label for="checkedAll" class="font16" >전체 선택</label>
						<input class="font16"  type="submit" id="accessBTN" value="회원 삭제"> 
					</td>
				</tr>
			</table>
			
			<div id="pagingTd" class="font20">
				<c:if test="${paging.startBlock > paging.pageBlock}">
					<a href="${path}/adminAccess.ad?page=${paging.prev}&listId=cs"> << </a>
				</c:if>
				<c:forEach var="num" begin="${paging.startBlock}" end="${paging.endBlock}">
					<a  href="${path}/adminAccess.ad?page=${num}&listId=cs">${num}</a>
				</c:forEach>
				<c:if test="${paging.endBlock < paging.pageNum }">
					<a  href="${path}/adminAccess.ad?page=${paging.next}&listId=cs"> >> </a>
				</c:if>
			</div>
		</form>
		
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>