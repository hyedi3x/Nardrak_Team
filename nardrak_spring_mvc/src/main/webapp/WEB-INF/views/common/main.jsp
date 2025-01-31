<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>

<title>메인 홈페이지</title>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/common/main.css">

</head>
<body>
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>

	<!-- main page -->
	<div id="main"> <h3>mainpage</h3></div>
	
	<!-- footer page --><%-- 
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>		 --%>
</body>
</html>