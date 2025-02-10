<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>비밀번호 확인</title>

<link href="${path}/resources/css/customer/login/login.css" rel="stylesheet">
</head>
<body>
	<div id="loginWrap">
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>
	
	<!-- 비밀번호 확인 페이지 -->
	<div class="login_container">
		<div id="loginTitle">
			<h2> 비밀번호 확인 </h2>
		</div>
		
		<div id="loginSection">	
			<div id="loginArticle">
				<form action="${path}/adminModify.ad" method="post">
					<div id="loginInput">
						<p>비밀번호를 입력해주세요.</p>
						<input type="text" name="ad_id" value="${sessionScope.sessionID}" maxlength="10" readonly>
						<input type="password" name="ad_pwd" placeholder="password" maxlength="16">	
						<input type="submit" value="로그인">	
						
						<div id="utility">
							<span id="font12-right">
								<a href="#" id="rightLink">아이디/비밀번호 찾기</a>
							</span>
						</div>
					</div>
				</form>
				<div id="login_ad">
					<a href="#"><img src="${path}/resources/image/customer/login/korea-travel-poster.jpg" alt="korea-travel-poster"></a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer page -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
	</div>
</body>
</html>