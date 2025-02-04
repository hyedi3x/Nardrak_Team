<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer action result</title>
</head>
<body>
	
	<!-- 권한별 로그인 성공 -->
	<c:choose>
		<c:when test="${sessionScope.login_session eq 'Admin'}">
			<script type="text/javascript">
			    alert("${sessionScope.sessionID}님 로그인 성공하였습니다.");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${sessionScope.login_session eq 'Customer'}">
			<script type="text/javascript">
				alert("${sessionScope.sessionID}님 로그인 성공하였습니다.");
				window.location="${path}/main.do";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("아이디와 비밀번호가 일치하지 않습니다!");
				window.location="${path}/login.do";
			</script>
		</c:otherwise>
	</c:choose>
	
</body>
</html>