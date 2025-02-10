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
	
	<!-- 고객 회원가입 등록 -->
	<c:if test="${signUpCnt == 1}">
		<script type="text/javascript">
			alert("회원가입 등록 성공 하셨습니다");
			window.location="${path}/main.do";
		</script>
	</c:if>
	<c:if test="${signUpCnt == 0}">
		<script type="text/javascript">
			alert("회원가입 등록 실패 다시 시도해주세요");
			window.location="${path}/main.do";
		</script>
	</c:if>
	
	<!-- 권한별 로그인 성공 -->
	<c:choose>
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