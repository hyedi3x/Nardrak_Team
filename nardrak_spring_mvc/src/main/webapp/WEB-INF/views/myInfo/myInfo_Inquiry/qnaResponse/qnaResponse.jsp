<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>1:1 문의하기</title>

<!-- css -->
<link href="${path}/resources/css/myInfo/myInfo_Inquiry/qnaResponse.css" rel="stylesheet">
<link href="${path}/resources/css/myInfo/myInfo_left.css" rel="stylesheet">

<!-- js -->
<script src="${path}/resources/js/myInfo/qnaResponse.js" defer></script>

</head>
<body>
	<!-- header start -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>
   
	<!-- 주요 콘텐츠 영역 감싸는 컨테이너 역할 -->
	<div id="wrap"> 
		<div id="container">
			<ul id="page_nav">
				<li>
					<a href="${path}/main.do">홈</a> >
				</li>
				<li>
					<a href="${path}/myInfo.do">마이페이지</a> >
				</li>
				<li>
					<a href="${path}/qnaResponse.do">1:1 문의 내역</a>
				</li>
			</ul>
	      
			<div id="content"> <!-- 메뉴바 + 본문 내용 들어갈 박스 -->
				<!-- 왼쪽 메뉴바 -->
				<div id="myInfo_left">
					<%@ include file="/WEB-INF/views/myInfo/leftMenuTab/toggle_left.jsp" %>
				</div>
	         
				<!-- 본문 -->
				<div id="contentRight">
		        	<h1>1:1 문의</h1>
		        	
		        	<!-- response_status 버튼에 대한 박스 -->
		        	<div id="res_A">
						<a onclick="load('${path}/res_pending.do')">진행중</a>
						<a onclick="load('${path}/res_complete.do')">답변완료</a>
		        	</div>
		        	<!-- 진행 중, 답변 완료 버튼 클릭에 대한 Ajax 결과 페이지 -->
		        	<div id="result">
		        	
		        	</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer start -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
</body>
</html>