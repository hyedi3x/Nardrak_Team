<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index 페이지</title>

<script type="text/javascript">
	// 1초 후에 main.do로 이동하라 
	// 페이지 첫 실행을 인덱스 페이지에서 실행함. (메인 홈페이지 개념)
	setTimeout(function() {
		window.location="${path}/main.do"
	}, 1000);
</script>
	
</head>
<body>
</body>
</html>