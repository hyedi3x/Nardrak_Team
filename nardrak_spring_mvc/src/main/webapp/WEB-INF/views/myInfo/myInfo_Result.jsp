<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 결과 페이지</title>
</head>
	<body>
		<div class="wrap">
			<c:choose>					
				<c:when test="${inquiryImgs == 0}">
					<!-- 1:1 문의 등록	 -->
					<script type="text/javascript">
						alert("1:1 문의등록 실패!!");
						window.location="${path}/qnaRequest.do";
					</script>
				</c:when>
				<c:when test="${inquiryImgs != 0}">
					<script type="text/javascript">
						alert("1:1 문의등록 성공!!");
						window.location="${path}/myInfo.do";
					</script>
				</c:when>
			</c:choose>
		</div>
	</body>
</html>