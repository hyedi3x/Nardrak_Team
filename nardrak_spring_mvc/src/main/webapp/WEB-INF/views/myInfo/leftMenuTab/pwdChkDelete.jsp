<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>개인정보 수정(비밀번호 인증)</title>

<link href="${path}/resources/css/myInfo/pwdChkInfo.css" rel="stylesheet">

</head>
<body>	
	<!-- 세부 정보 페이지 -->
	<div id="myInfoDetail">
		<h3> 회원 본인 확인</h3>
		
	 	<form action="${path}/pwdChkDelete.do" method="post">
			<div id="certification">
				<p>본인 인증을 위해 비밀번호를 입력해 주세요.</p>
				<div id="pwdInput">
					<input type="password" name="user_pwd" placeholder="password">	
					<input type="submit" value="인증">	
				</div>
			</div>
		</form>
	</div>			
</body>
</html>