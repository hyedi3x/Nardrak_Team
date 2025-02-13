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
		
		<c:when test="${updateCnt == 1}">
			<script type="text/javaScript">
				alert("관리자 수정 성공");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${updateCnt == 0}">
			<script type="text/javaScript">
				alert("관리자 수정 실패");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${deleteCnt == 1}">
			<script type="text/javaScript">
				alert("관리자 삭제 성공");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${deleteCnt == 0}">
			<script type="text/javaScript">
				alert("관리자 삭제 실패");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${accessCnt != 0 }">
			<script type="text/javaScript">
				alert("관리자 승인 완료");
				window.location="${path}/adminAccess.ad";
			</script>
		</c:when>
		<c:when test="${accessCnt == 0 }">
			<script type="text/javaScript">
				alert("관리자 승인 실패");
				window.location="${path}/adminAccess.ad";
			</script>
		</c:when>
		
	</c:choose>
	
</body>
</html>