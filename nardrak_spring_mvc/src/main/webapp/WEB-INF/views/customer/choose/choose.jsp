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
<link rel="stylesheet" href="${path}/resources/css/customer/choose/choose.css">
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

 <!-- swiner styles -->

</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 
<!-- header 종료 -->
<br><br>

<!-- 첫 번째 Swiper -->
<div class="swiper-min">
	<div class="swiper mySwiper1">
	    <div class="swiper-wrapper">
	        <div class="swiper-slide">
	            <div class="slide-content">
	                <img src="${path}/resources/image/admin/choose/trable/모두투어 시골.avif" alt="Slide 1">
	                <div class="slide-text1"> 꽃따라 떠나 봄,</div>
	                <div class="slide-text2">전국 각지로 떠나보는 꽃나들이</div>
	                <div class="slide-text3"> #산수유#벚꽃#청보리#유채꽃</div>
	                <div class="slide-text4">#버스여행#기차여행#제주여행</div>
	                
	            </div>
	        </div>
	        <div class="swiper-slide">
	            <div class="slide-content">
	                <img src="${path}/resources/image/admin/choose/trable/모두투어 제주.avif" alt="Slide 2">
	                <div class="slide-text1">봄맞이 제주여행</div>
	                <div class="slide-text2">자유여행 패키지 모음전</div>
	                <div class="slide-text3"> 가성비숙소부터 특급호텔까지</div>
	                <div class="slide-text4"> 취향따라 즐겨보는 제주여행</div>
	            </div>
	        </div>
	        <div class="swiper-slide">
	            <div class="slide-content">
	                <img src="${path}/resources/image/admin/choose/trable/모두투어 독도.avif" alt="Slide 3">
	                <div class="slide-text1">2025 나의 버킷리스트!!</div>
	                <div class="slide-text2">대한민국 울릉도 독도</div>
	                <div class="slide-text3"> #빠른쾌속선#편안한크루즈</div>
	                <div class="slide-text4"> #강릉#묵호#포항출발</div>
	            </div>
	        </div>
	           <div class="swiper-slide">
	            <div class="slide-content">
	                <img src="${path}/resources/image/admin/choose/trable/모두투어 섬여행.avif" alt="Slide 3">
	                <div class="slide-text1">섬,쉼이 있는 그 곳</div>
	                <div class="slide-text2">천혜의 자연을 간직한 방방곡곡 섬나들이</div>
	                <div class="slide-text3"> #빠른쾌속선#편안한크루즈</div>
	                <div class="slide-text4"> #강릉#묵호#포항출발</div>
	            </div>
	        </div>
	        <!-- 추가 슬라이드 -->
	    </div>
	    <!-- 페이지네이션 -->
	    <div class="swiper-pagination"></div>
	    <!-- 네비게이션 버튼 -->
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	</div>
	
	
	
</div>

<div id="min">
	<div class="dest-card">
	    <!-- 여행지 카드 내용 -->
	    찜하기+999
	    <span>❤️다른 사용자들이 찜하기 버튼을 많이 눌렀어요.!</span>
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



	<!-- 선호 여행지 선택 문구 -->
	<div class="choose-text">
	    선호 여행지를 선택해주세요
	    <span>여러분 여행지를 선택하고 즐거운 여행을 떠나보세요!</span>
	</div>
		
	
	<div class="container">
	    <div class="row">
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Seoul.jpg" class="card-img-top" alt="서울">
	                <div class="card-body">
	                    <h5 class="card-title" style="align:center">서울</h5>
	                    <p class="card-text">전통과 현대가 조화로운 대한민국의 수도</p>
	                    <a href="${path}/WEB-INF/views/customer/choose/Se" class="btn-primary">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Daegu.jpg" class="card-img-top" alt="대구">
	                <div class="card-body">
	                      <h5 class="card-title">대구</h5>
	                    <p class="card-text">역사와 전통, 그리고 맛있는 음식이 가득한 도시</p>
	                    <a href="#" class="btn-primary">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Gyeongju.jpg" class="card-img-top" alt="경주">
	                <div class="card-body">
	                    <h5 class="card-title">경주</h5>
	                    <p class="card-text">천년을 이어온 유적지와 문화유산의 고도</p>
	                    <a href="#" class="btn-primary">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Jeju.jpg" class="card-img-top" alt="제주">
	                <div class="card-body">
	                    <h5 class="card-title">제주</h5>
	                    <p class="card-text">자연의 신비와 평화로운 풍경이 어우러진 섬</p>
	                    <a href="#" class="btn-primary">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Busan.jpg" class="card-img-top" alt="부산">
	                <div class="card-body">
	                    <h5 class="card-title">부산</h5>
	                    <p class="card-text">해양문화와 활기 넘치는 항구도시, 해변의 낭만</p>
	                    <a href="#" class="btn-primary">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	         <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/광주_n.png" class="card-img-top" alt="광주">
	                <div class="card-body">
	                    <h5 class="card-title">광주</h5>
	                    <p class="card-text">민주화운동의 역사적 의미와 풍부한 문화유산</p>
	                    <a href="#" class="btn-primary">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>


 <!-- 세번쨰 Swiper -->
 <div class="swiper mySwiper3">
	  <div class="swiper-wrapper">
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/trable/내마음대로 자유여행.avif" alt="Slide 1"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/trable/대한항공.avif" alt="Slide 2"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/trable/방방곡곡.avif" alt="Slide 3"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/trable/아시아나 자유여행.avif" alt="Slide 4"></div>
	    <div class="swiper-slide"><img src="${path}/resources/image/admin/choose/trable/온수풀 이미지.avif" alt="Slide 5"></div>
	     <!-- 추가 슬라이드 -->
	  </div>
	  <!-- 페이지네이션 -->
	  <div class="swiper3-pagination"></div>
</div>


<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
<!-- footer 종료 -->



</body>
</html>