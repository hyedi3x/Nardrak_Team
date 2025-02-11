<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>회원정보 인증 페이지</title>

</head>
<body>
	<c:choose>
		<c:when test="${pwdChkCnt == 1}">
			<c:if test="${sessionScope.login_session eq 'Customer'}">
				<script type="text/javascript">
				    alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
					window.location="${path}/customerModify.do";
				</script>
			</c:if>

			<c:if test="${sessionScope.login_session eq 'Admin'}">
				<script type="text/javascript">
				    alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
					window.location="${path}/adminModify.do";
				</script>
			</c:if>
		</c:when>
		
		<c:otherwise>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다!");
				window.location="${path}/myInfo.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>