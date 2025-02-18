<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- *연주 -->
<title>회원 수정 버튼 누른 후</title>

<script src="${path}/resources/js/common/main.js" defer></script>

<!-- join.js -->
<script src="${path}/resources/js/customer/join.js" defer></script>

</head>
	<body>
		<div class="wrap">
			<c:if test="${updateCnt == 1}">
				<script type="text/javascript">
				alert("회원수정 성공!!");
				window.location="${path}/myInfo.do";
				</script>
			</c:if>
			
			<c:if test="${updateCnt != 1}">
				<script type="text/javascript">
				alert("회원수정 실패!!");
				window.location="${path}/modifyInfo.do";
				</script>
			</c:if>
		</div>
	</body>
</html>