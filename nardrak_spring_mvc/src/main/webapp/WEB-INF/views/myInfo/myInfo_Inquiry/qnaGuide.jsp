<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>1:1 문의 가이드 페이지</title>

<!-- css -->
<link href="${path}/resources/css/myInfo/myInfo_Inquiry/qnaGuide.css" rel="stylesheet">

</head>
<body>	
	<!-- 세부 정보 페이지 -->
	<div id="myInfoDetail">
		<h3 id="guideHeader"> 1:1 문의</h3>
		
		<div id="content_guide">
			<img src="${path}/resources/image/myInfo/myInfo_Inquiry/QNA_img/icons8-online-q&a-96.png" alt="Q&A guide image">
			<h3 id="guideH4">1:1 문의입니다.</h3>
			<p id="guideMent"> 고객님의 문의사항에 대한 신속한 해결을 위해 최선을 다하겠습니다.</p>
			<div id="guideButton">
				<input type="button" value="1:1 문의하기" onclick="window.location='${path}/qnaRequest.do'">	
				<input type="button" value="답변 보기" onclick="window.location='${path}/qnaResponse.do'">	
			</div>
		</div>
	</div>			
</body>
</html>