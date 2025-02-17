<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>마이페이지 결과 페이지</title>
</head>
<body>
    <div class="wrap">
        <c:choose>
        	<%-- 개인정보 설정(본인 확인) 결과 --%>
            <c:when test="${resultType == 'modify'}">
                <c:choose>
	                <%-- 본인인증 성공 --%>
                    <c:when test="${pwdChkCnt == 1}">
                        <c:if test="${sessionScope.login_session == 'Customer'}">
                            <script type="text/javascript">
                                alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
                                window.location="${path}/customerModify.do";
                            </script>
                        </c:if>
                        <c:if test="${sessionScope.login_session == 'Admin'}">
                            <c:choose>
                                <c:when test="${strId != null}">
                                    <script type="text/javascript">
                                        alert("${strId}님 회원정보 페이지로 이동합니다.");
                                        window.location="${path}/adminModify.do?strId=${strId}";
                                    </script>
                                </c:when>
                                <c:otherwise>
                                    <script type="text/javascript">
                                        alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
                                        window.location="${path}/adminModify.do";
                                    </script>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:when>
                    <%-- 본인인증 실패 --%>
                    <c:otherwise>
                        <script type="text/javascript">
                            alert("비밀번호가 틀렸습니다!");
                            window.location="${path}/myInfo.do";
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <%-- 회원 탈퇴(본인 확인) 결과 --%>
            <c:when test="${resultType == 'delete'}">
                <c:choose>
	                <%-- 본인인증 성공 --%>
                    <c:when test="${pwdChkCnt == 1}">
                        <c:if test="${sessionScope.login_session == 'Customer'}">
                            <script type="text/javascript">
                                alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
                                window.location="${path}/customerDelete.do";
                            </script>
                        </c:if>
                        <c:if test="${sessionScope.login_session == 'Admin'}">
                            <script type="text/javascript">
                                alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
                                window.location="${path}/adminDelete.do";
                            </script>
                        </c:if>
                    </c:when>
                     <%-- 본인인증 실패 --%>
                    <c:otherwise>
                        <script type="text/javascript">
                            alert("비밀번호가 틀렸습니다!");
                            window.location="${path}/myInfo.do";
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <p>잘못된 접근입니다.</p>
            </c:otherwise>
        </c:choose>
        <%-- 1:1 문의 등록 결과 --%>
        <c:choose>
            <c:when test="${inquiryImgs == 0}">
                <script type="text/javascript">
                    alert("1:1 문의등록 실패!!");
                    window.location="${path}/qnaRequest.do";
                </script>
            </c:when>
            <c:otherwise>
                <script type="text/javascript">
                    alert("1:1 문의등록 성공!!");
                    window.location="${path}/myInfo.do";
                </script>
            </c:otherwise>
        </c:choose>
    </div>
</body>
