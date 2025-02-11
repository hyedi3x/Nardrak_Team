<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/common/main.css">

<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

<!-- Swiper JS -->
<script src="http://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- js -->
<script src="${path}/resources/js/main.js"></script>

<title>메인 홈페이지</title>
</head>
<body>
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>

	<!-- main page -->
	<div id="main">
	    <div class="swiper">
	        <!-- 네비게이션 버튼 -->
	         <div class="swiper-wrapper">
                <!-- 각 슬라이드에 텍스트 오버레이 추가 -->
                <c:choose>
		        <c:when test="${not empty images}">
		            <c:forEach var="image" items="${images}">
		                <div class="swiper-slide">
		                    <div class="image-container">
		                        <img src="${image.image_path}" alt="${image.image_path}">
		                        <div class="slide-text">${image.image_detail}</div>
		                    </div>
		                </div>
		            </c:forEach>
		        </c:when>
		        <c:otherwise>
		            <p>현재 등록된 사진이 없습니다.</p>
		        </c:otherwise>
		     </c:choose>
            </div>
	
            <!-- 페이지네이션 (점) -->
            <div class="swiper-pagination"></div>
	    </div>
	    <c:if test="${login_session == 'Admin'}">
		    <div class="imageButtons">
			    <input type="button" id="ImageOptionBtn" value="전체 사진 보기" onclick="location.href='${path}/uploadImage.img'">
			</div>
	    </c:if>
	</div>
	
	<!-- footer page -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>