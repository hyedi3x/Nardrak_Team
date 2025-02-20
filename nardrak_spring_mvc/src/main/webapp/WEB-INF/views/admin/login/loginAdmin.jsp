<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>로그인</title>

<link href="${path}/resources/css/customer/login/login.css" rel="stylesheet">
</head>
<body>
	<div id="loginWrap">
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>
	
	<!-- 로그인 페이지 -->
	<div class="login_container">
		<div id="loginTitle">
			<h2> 관리자 로그인 페이지 </h2>
		</div>
		
		<div id="loginSection">	
			<div id="loginArticle">
				<form action="${path}/loginResult.ad" method="post">
					<div id="loginInput">
						<p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
						<input type="text" name="user_id" placeholder="id" maxlength="10">
						<input type="password" name="user_pwd" placeholder="password" maxlength="16">	
						<input type="submit" value="로그인">	
						
						<div id="utility">
							<span id="font12-left">
								<span id="font12">아직 회원이 아니신가요?</span>
									<a href="${path}/adminSignUp.ad" id="leftLink">회원가입</a>
							</span>
							<span id="font12-right">
								<a href="#" id="rightLink">아이디/비밀번호 찾기</a>
							</span>
						</div>
					</div>
				</form>
				<div id="login_adPoster">
					<a href="#"><img src="${path}/resources/image/customer/login/7979161.jpg" alt="korea-travel-poster"></a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer page -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
	</div>
</body>
</html>