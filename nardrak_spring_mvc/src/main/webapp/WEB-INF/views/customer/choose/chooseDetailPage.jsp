<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/choose/chooseDetail.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/> <!-- Swiper 적용-->
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"> <!-- 글씨체 적용(js)  -->


<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script> <!-- Swiper 적용 -->
<script src="${path}/resources/js/admin/choose.js" defer></script>


</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 
<!-- header 종료 -->
<br><br>
<div class="container">   
	<div class="choose">
		<div class="swiper-slide">
	    	<div class="slide-content">
	        	<div class="back_ground">
	        		<img src="${path}${dto.ch_image}" alt="${dto.ch_title1}">
	        	</div>
	            <div class="slide-text1"> ${dto.ch_title1} </div>
	            <div class="slide-text2"> ${dto.ch_title2} </div>
	            <div class="slide-text3"> ${dto.ch_tags1} </div>
	            <div class="slide-text4"> ${dto.ch_tags2} </div>
	    	</div>
	 	</div>
	 	
	 	<c:if test="${sessionScope.login_session eq 'Admin'}">
			  <a href="${path}/chooseDetailModify.ch?ch_num=${dto.ch_num}">
			      수정하기
			  </a>
		</c:if>
	 	<div class="choose_text">
	 		<div class="explanation">${dto.ch_detail}</div>
	 	</div>
     </div>
</div>


 <!-- 두번째 Swiper -->
 <div class="swiper mySwiper2">
	  <div class="swiper-wrapper">
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/경복궁.jpg" alt="Slide 1"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/남산공원.jpg" alt="Slide 2"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/석촌호수.jpg" alt="Slide 3"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/여의도 윤중로.jpg" alt="Slide 4"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/제주 여행지.jpg" alt="Slide 5"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/경주 여행지.png" alt="Slide 6"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/부산.jpg"alt="Slide 7"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/부산 여행지.jpg" alt="Slide 8"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/Seoul.jpg"alt="Slide 9"></div>
	     <!-- 추가 슬라이드 -->
	  </div>
	  <!-- 페이지네이션 -->
	  <div class="swiper2-pagination"></div>
</div>


<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
<!-- footer 종료 -->


</body>
</html>