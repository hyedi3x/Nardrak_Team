<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>회원정보 인증 페이지</title>

</head>
<body>
	<c:choose>
		<c:when test="${pwdChkCnt == 1}">
			<c:if test="${sessionScope.login_session eq 'Customer'}">
				<script type="text/javascript">
				    alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
					window.location="${path}/customerModify.do";
				</script>
			</c:if>

			<c:if test="${sessionScope.login_session eq 'Admin'}">
				<c:if test="${admin_id != null}">
				    <script type="text/javascript">
					    alert("${admin_id}님 회원정보 페이지로 이동합니다.");
					   
						window.location="${path}/adminModify.do?strId=${admin_id}";
					</script>
				 </c:if>
				 <c:if test="${admin_id == null}">
					 <c:if test="${user_id != null}">
						<script type="text/javascript">
						    alert("${user_id}님 회원정보 페이지로 이동합니다.");
						   
							window.location="${path}/customerModify.do?strId=${user_id}";
						</script>
					</c:if>
					 <c:if test="${user_id == null}">
						<script type="text/javascript">
						    alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
							window.location="${path}/adminModify.do";
						</script>
					</c:if>
				</c:if>
			</c:if>
		</c:when>
		
		<c:otherwise>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다!");
				window.location="${path}/myInfo.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>