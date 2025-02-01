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
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("관리자 등록 성공");
			window.location="${path}/main.do";
		</script>
	</c:if>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("관리자 등록 실패");
			window.location="${path}//main.do";
		</script>
	</c:if>
	
</body>
</html>