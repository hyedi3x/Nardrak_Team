<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 등록하기 버튼을 누른 후</title>
</head>

	<body>
		<div class="wrap">
			<c:if test="${insertCnt == 1}">
				<script type="text/javascript">
				alert("1:1 문의등록 성공!!");
				window.location="${path}/myInfo.do";
				</script>
			</c:if>
			
			<c:if test="${insertCnt != 1}">
				<script type="text/javascript">
				alert("1:1 문의등록 실패!!");
				window.location="${path}/qnaRequest.do";
				</script>
			</c:if>
		</div>
	</body>
</html>