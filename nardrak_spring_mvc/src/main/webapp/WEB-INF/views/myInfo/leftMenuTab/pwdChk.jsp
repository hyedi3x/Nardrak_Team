<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>본인 확인 </title>

<link href="${path}/resources/css/myInfo/pwdChkInfo.css" rel="stylesheet">

</head>
<body>		
	<!-- 세부 정보 페이지 -->
    <c:choose>
        <c:when test="${certify == 'modify'}">
            <div id="myInfoDetail">
                <h3>개인정보 설정(본인 확인)</h3>
                <form action="${path}/pwdChkModify.do" method="post">
                    <div id="certification">
                        <p>본인 인증을 위해 비밀번호를 입력해 주세요.</p>
                        <div id="pwdInput">
                            <input type="password" name="user_pwd" placeholder="password">
                            <input type="submit" value="인증">
                        </div>
                    </div>
                </form>
            </div>
        </c:when>
        <c:when test="${certify == 'delete'}">
            <div id="myInfoDetail">
                <h3>회원 탈퇴(본인 확인)</h3>
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
        </c:when>
        <c:otherwise>
            <p>잘못된 접근입니다.</p>
        </c:otherwise>
    </c:choose>		
</body>
</html>