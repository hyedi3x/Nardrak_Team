<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
	<div id="headerWrap">
		<!-- session에 따른 header page -->
		<c:choose>
 			<c:when test="${sessionScope.login_session eq 'Customer'}">
				<%@ include file="/WEB-INF/views/customer/common/customer_header.jsp" %>
			</c:when>
			<c:when test="${sessionScope.login_session eq 'Admin'}">
				<%@ include file="/WEB-INF/views/admin/common/admin_header.jsp" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/common/header.jsp" %>
			</c:otherwise>
		</c:choose>  
	</div>
</body>
