<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionResult</title>
</head>
<body>
	
	<!-- 관리자 등록 -->
	<c:choose>
		<c:when test="${insertCnt == 1}">
			<script type="text/javascript">
				alert("관리자 등록 성공");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${insertCnt == 0}">
			<script type="text/javascript">
				alert("관리자 등록 실패");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${uniqueCheck == 0}">
			<c:if test="${id eq 'ad_phone' }">
				<input id="uniquePhone" type="hidden" value="1" />
			</c:if>
			<c:if test="${id eq 'ad_email' }">
				<input id="uniqueEmail" type="hidden" value="1" />
			</c:if>
			<c:if test="${id eq 'empnum' }">
				<input id="uniqueEmpnum" type="hidden" value="1" />
			</c:if>
		</c:when>
	</c:choose>
	
	<!-- 권한별 로그인 성공 -->
	<c:choose>
		<c:when test="${sessionScope.login_session eq 'Admin'}">
			<script type="text/javascript">
			    alert("${sessionScope.sessionID}님 로그인 성공하였습니다.");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:otherwise>
			<script type="text/javascript">
				alert("아이디와 비밀번호가 일치하지 않습니다!");
				window.location="${path}/loginAdmin.ad";
			</script>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>