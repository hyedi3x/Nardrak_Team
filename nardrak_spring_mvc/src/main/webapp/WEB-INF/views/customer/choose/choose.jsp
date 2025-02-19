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

<!-- 로그인 여부를 jquery로 작성해서 변수에 대입 -->
<script> var isLogin = ${sessionScope.sessionID != null ? 'true' : 'false'}; </script>

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
	        <c:forEach var="choose" items="${list}">
		        <div class="swiper-slide">
		            <div class="slide-content">
		                <a href="${path}/chooseDetailPage.ch?ch_title1=${choose.ch_title1}">
		                    <img src="${path}${choose.ch_image}" alt="${choose.ch_title1}">
		                    <div class="slide-text1"> ${choose.ch_title1} </div>
		                    <div class="slide-text2"> ${choose.ch_title2} </div>
		                    <div class="slide-text3"> ${choose.ch_tags1} </div>
		                    <div class="slide-text4"> ${choose.ch_tags2} </div>
		                </a>
		            </div>
		        </div>
	        </c:forEach>
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
	                    <!-- 추가한 부분 -->
	                    <input type="hidden" class="dest-id" value="Seoul">
	                    <input type="checkbox" class="heart-checkbox">
			            <label class="heart-label">
			                <i class="fa-regular fa-heart"></i>  <!-- Font Awesome 하트 아이콘 -->
			            </label>
	                    <a href="#" class="btn-primary" data-bs-toggle="modal" data-bs-target="#travelInfo1">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Daegu.jpg" class="card-img-top" alt="대구">
	                <div class="card-body">
	                      <h5 class="card-title">대구</h5>
	                    <p class="card-text">역사와 전통, 그리고 맛있는 음식이 가득한 도시</p>
	                    <!-- 추가한 부분 -->
	                    <input type="hidden" class="dest-id" value="Daegu">
	                    <input type="checkbox" class="heart-checkbox">
			            <label class="heart-label">
			                <i class="fa-regular fa-heart"></i>  <!-- Font Awesome 하트 아이콘 -->
			            </label>
	                    <a href="#" class="btn-primary" data-bs-toggle="modal" data-bs-target="#travelInfo2">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Gyeongju.jpg" class="card-img-top" alt="경주">
	                <div class="card-body">
	                    <h5 class="card-title">경주</h5>
	                    <p class="card-text">천년을 이어온 유적지와 문화유산의 고도</p>
	                    <!-- 추가한 부분 -->
	                    <input type="hidden" class="dest-id" value="Gyeongju">
	                    <input type="checkbox" class="heart-checkbox">
			            <label class="heart-label">
			                <i class="fa-regular fa-heart"></i>  <!-- Font Awesome 하트 아이콘 -->
			            </label>
	                    <a href="#" class="btn-primary" data-bs-toggle="modal" data-bs-target="#travelInfo3">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Jeju.jpg" class="card-img-top" alt="제주">
	                <div class="card-body">
	                    <h5 class="card-title">제주</h5>
	                    <p class="card-text">자연의 신비와 평화로운 풍경이 어우러진 섬</p>
	                    <!-- 추가한 부분 -->
	                    <input type="hidden" class="dest-id" value="Jeju">
	                    <input type="checkbox" class="heart-checkbox">
			            <label class="heart-label">
			                <i class="fa-regular fa-heart"></i>  <!-- Font Awesome 하트 아이콘 -->
			            </label>
	                    <a href="#" class="btn-primary" data-bs-toggle="modal" data-bs-target="#travelInfo4">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/Busan.jpg" class="card-img-top" alt="부산">
	                <div class="card-body">
	                    <h5 class="card-title">부산</h5>
	                    <p class="card-text">해양문화와 활기 넘치는 항구도시, 해변의 낭만</p>
	                    <!-- 추가한 부분 -->
	                    <input type="hidden" class="dest-id" value="Busan">
	                    <input type="checkbox" class="heart-checkbox">
			            <label class="heart-label">
			                <i class="fa-regular fa-heart"></i>  <!-- Font Awesome 하트 아이콘 -->
			            </label>
	                    <a href="#" class="btn-primary" data-bs-toggle="modal" data-bs-target="#travelInfo5">자세히 보기</a>
	                </div>
	            </div>
	        </div>
	        
	         <div class="col-md-4">
	            <div class="card">
	                <img src="${path}/resources/image/admin/choose/광주_n.png" class="card-img-top" alt="광주">
	                <div class="card-body">
	                    <h5 class="card-title">광주</h5>
	                    <p class="card-text">민주화운동의 역사적 의미와 풍부한 문화유산</p>
	                    <!-- 추가한 부분 -->
	                    <input type="hidden" class="dest-id" value="Gwangju">
	                    <input type="checkbox" class="heart-checkbox">
			            <label class="heart-label">
			                <i class="fa-regular fa-heart"></i>  <!-- Font Awesome 하트 아이콘 -->
			            </label>
	                    <a href="#" class="btn-primary" data-bs-toggle="modal" data-bs-target="#travelInfo6">자세히 보기</a>
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

footer 하단 모달
<!-- 여행지 상세정보 모달 -->
<!-- 서울 -->
<div class="modal fade" id="travelInfo1" tabindex="-1" aria-labelledby="travelInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="travelInfoModalLabel">여행지 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img id="modalImage" src="${path}/resources/image/admin/choose/Seoul.jpg" alt="여행지 이미지" class="img-fluid">
        <div>
           <br>
           <h3>서울</h3>
         위치: 서울은 대한민국의 수도로, 한반도의 북서부에 위치하고 있습니다. 북한산, 도봉산, 인왕산, 관악산 등 여러 산에 둘러싸여 있어 자연경관이 아름답습니다.<br>
         인구: 약 1,000만 명의 인구를 보유하고 있으며, 한국에서 가장 인구가 많은 도시입니다. 다양한 문화와 경제 활동이 이루어지는 중심지입니다.<br>
         역사적 배경<br>
         역사적 사건: 서울은 조선 왕조의 수도로서 오랜 역사와 전통을 가지고 있으며, 한국 전쟁과 같은 중요한 역사적 사건의 중심지였습니다. 이러한 역사적 배경은 서울의 문화와 정체성에 큰 영향을 미쳤습니다.<br>
         문화와 예술<br>
         문화예술: 서울은 다양한 문화예술 행사와 축제가 열리는 곳으로, 매년 서울 국제 영화제, 서울 디자인 페스티벌 등 다양한 국제적인 행사도 개최됩니다.<br>
         핫 플레이스: 서울에는 홍대, 강남, 이태원 등 젊은 세대와 예술가들이 자주 찾는 핫 플레이스가 많습니다. 이곳은 카페, 갤러리, 공연장이 밀집해 있어 활기찬 분위기를 자아냅니다.<br>
         관광 명소<br>
         자연환경: 서울은 한강과 여러 공원이 있어 자연을 즐길 수 있는 공간이 많습니다. 특히 남산과 한강공원은 시민과 관광객 모두에게 인기 있는 장소입니다.<br>
         역사유산: 경복궁, 창덕궁 등 역사적인 유적지와 박물관이 많아, 방문객들이 한국의 역사와 문화를 배울 수 있는 기회를 제공합니다.<br>
         음식과 시장<br>
         식도락: 서울은 다양한 전통 음식과 현대적인 요리를 즐길 수 있는 식도락의 도시입니다. 특히, 김치찌개, 불고기, 비빔밥 등 한국의 대표적인 음식이 유명합니다. 또한, 광장시장과 남대문시장에서 다양한 길거리 음식을 맛볼 수 있습니다.<br>
         서울은 역사적 의미와 문화적 다양성을 지닌 도시로, 방문객들에게 많은 볼거리와 경험을 제공합니다. 이곳은 단순한 여행지를 넘어, 한국의 역사와 현대 문화를 체험할 수 있는 특별한 장소입니다.<br>
        </div>
        <h5 id="modalTitle"></h5>
        <p id="modalDescription"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 대구 -->
<div class="modal fade" id="travelInfo2" tabindex="-1" aria-labelledby="travelInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="travelInfoModalLabel">여행지 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img id="modalImage" src="${path}/resources/image/admin/choose/Daegu.jpg" alt="여행지 이미지" class="img-fluid">
        <div>
           <br>
           <h3>대구</h3>
         위치: 대구는 경상도의 중앙에 위치한 광역시로, 경상북도와 경상남도의 중앙에 자리잡고 있습니다. 대경권을 대표하는 대도시이자 대구권의 중심지입니다.<br>
         인구: 대구는 약 250만 명의 인구를 보유하고 있으며, 다양한 산업과 문화가 공존하는 도시입니다.<br>
         역사적 배경<br>
         역사적 사건: 대구는 조선 시대에 경상도 전체를 관할하는 경상감영이 위치했던 곳으로, 역사적으로 중요한 의미를 지닙니다. 대구는 1950년 한국 전쟁 당시 큰 피해를 입었으나, 이후 빠르게 재건되었습니다.<br>
         문화와 예술<br>
         문화예술: 대구는 다양한 문화예술 행사와 축제가 열리는 곳으로, 대구 국제 오페라 축제와 같은 국제적인 행사도 개최됩니다.<br>
         핫 플레이스: 대구에는 다양한 카페, 갤러리, 공연장이 있어 젊은 세대와 예술가들이 자주 찾는 장소입니다.<br>
         관광 명소<br>
         자연환경: 대구는 팔공산과 비슬산으로 둘러싸인 분지 지형을 가지고 있으며, 아름다운 자연경관을 자랑합니다. 이곳은 하이킹과 자연 탐방에 적합합니다.<br>
         역사유산: 대구에는 역사적인 유적지와 박물관이 많아, 방문객들이 한국의 역사와 문화를 배울 수 있는 기회를 제공합니다.<br>
         음식과 시장<br>
         식도락: 대구는 다양한 전통 음식과 현대적인 요리를 즐길 수 있는 식도락의 도시입니다. 특히, 대구 찜갈비와 같은 지역 특산물이 유명합니다.<br>
         대구는 역사적 의미와 문화적 다양성을 지닌 도시로, 방문객들에게 많은 볼거리와 경험을 제공합니다. 이곳은 단순한 여행지를 넘어, 한국의 역사와 문화를 체험할 수 있는 특별한 장소입니다.<br>
        </div>
        <h5 id="modalTitle"></h5>
        <p id="modalDescription"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 경주 -->
<div class="modal fade" id="travelInfo3" tabindex="-1" aria-labelledby="travelInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="travelInfoModalLabel">여행지 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img id="modalImage" src="${path}/resources/image/admin/choose/Gyeongju.jpg" alt="여행지 이미지" class="img-fluid">
        <div>
           <br>
           <h3>경주</h3>
         위치: 경주는 경상북도에 위치한 도시로, 대한민국의 대표적인 문화 관광 도시입니다.<br>
         인구: 경주는 약 25만 명의 인구를 보유하고 있으며, 역사와 문화가 풍부한 지역입니다.<br>
         역사적 배경<br>
         역사적 사건: 경주는 신라의 수도로서, 한국 역사에서 중요한 역할을 해왔습니다. 특히, 신라의 문화와 예술이 꽃피운 곳으로, 많은 유적지가 남아 있습니다.<br>
         문화와 예술<br>
         문화유산: 경주는 유네스코 세계문화유산으로 등록된 불국사와 석굴암, 경주 역사유적지구 등 다양한 문화유산이 있습니다.<br>
         축제: 매년 경주에서는 다양한 문화 행사와 축제가 열리며, 특히 경주 보문관광단지에서 열리는 경주세계문화엑스포가 유명합니다.<br>
         관광 명소<br>
         자연환경: 경주는 아름다운 자연경관을 자랑하며, 보문호와 같은 호수와 산들이 있어 하이킹과 자연 탐방에 적합합니다.<br>
         역사유적: 경주에는 첨성대, 안압지, 대릉원 등 역사적인 유적지가 많아, 방문객들이 한국의 역사와 문화를 배울 수 있는 기회를 제공합니다.<br>
         음식과 시장<br>
         식도락: 경주는 다양한 전통 음식과 현대적인 요리를 즐길 수 있는 도시입니다. 특히, 경주빵과 같은 지역 특산물이 유명합니다.<br>
         경주는 역사적 의미와 문화적 다양성을 지닌 도시로, 방문객들에게 많은 볼거리와 경험을 제공합니다. 이곳은 단순한 여행지를 넘어, 한국의 고대 역사와 문화를 체험할 수 있는 특별한 장소입니다.<br>
        </div>
        <h5 id="modalTitle"></h5>
        <p id="modalDescription"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 제주 -->
<div class="modal fade" id="travelInfo4" tabindex="-1" aria-labelledby="travelInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="travelInfoModalLabel">여행지 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img id="modalImage" src="${path}/resources/image/admin/choose/Jeju.jpg" alt="여행지 이미지1" class="img-fluid">
        <div>
           <br>
           <h3>제주</h3>
         위치: 제주도는 대한민국의 최남단에 위치하고 있으며, 북위 33°11′∼ 33°34′, 동경 126°10′∼127°에 해당합니다. 서울에서 약 450km 떨어져 있습니다.<br>
         인구: 제주도의 인구는 약 70만 명으로, 아름다운 자연환경과 독특한 문화로 많은 관광객을 끌어모으고 있습니다.<br>
         역사적 배경<br>
         역사적 사건: 제주도는 역사적으로 중요한 사건들이 많습니다. 특히, 4.3 사건은 제주도민의 인권과 민주화를 위한 중요한 이정표로 여겨집니다.<br>
         문화와 예술<br>
         문화예술: 제주도는 다양한 문화예술 행사와 축제가 열리는 곳으로, 제주 국제관악제와 같은 국제적인 행사도 개최됩니다.<br>
         핫 플레이스: 제주도에는 아름다운 카페, 갤러리, 그리고 전통 시장이 있어 관광객과 지역 주민들이 자주 찾는 장소입니다.<br>
         관광 명소<br>
         자연환경: 제주도는 한라산, 성산 일출봉 등 아름다운 자연경관을 자랑하며, 하이킹과 자연 탐방에 적합한 장소입니다.<br>
         역사유산: 제주도에는 역사적인 유적지와 박물관이 많아, 방문객들이 제주도의 역사와 문화를 배울 수 있는 기회를 제공합니다.<br>
         음식과 시장<br>
         식도락: 제주도는 다양한 전통 음식과 현대적인 요리를 즐길 수 있는 식도락의 도시입니다. 특히, 제주 흑돼지와 갈치조림 같은 지역 특산물이 유명합니다.<br>
         제주도는 아름다운 자연과 풍부한 문화적 유산을 지닌 특별한 장소로, 방문객들에게 많은 볼거리와 경험을 제공합니다. 이곳은 단순한 여행지를 넘어, 한국의 독특한 역사와 문화를 체험할 수 있는 특별한 장소입니다.<br>
        </div>
        <h5 id="modalTitle"></h5>
        <p id="modalDescription"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 부산 -->
<div class="modal fade" id="travelInfo5" tabindex="-1" aria-labelledby="travelInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="travelInfoModalLabel">여행지 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img id="modalImage" src="${path}/resources/image/admin/choose/Busan.jpg" alt="여행지 이미지" class="img-fluid">
        <div>
           <br>
           <h3>부산</h3>
         위치: 부산은 대한민국의 남동부에 위치한 광역시로, 동쪽으로는 동해에 접하고 서쪽으로는 경상남도 창원시와 김해시, 남쪽으로는 거제시와 남해에 인접해 있습니다.<br>
         인구: 약 340만 명의 인구를 보유하고 있으며, 대한민국에서 두 번째로 큰 도시입니다.<br>
         역사적 배경<br>
         역사적 사건: 부산은 한국 전쟁 당시 중요한 군사적 거점으로 사용되었으며, 이후 경제 발전의 중심지로 성장하였습니다. 특히, 부산항은 대한민국 최대의 무역항으로, 환적량이 세계 5위권에 해당합니다.<br>
         문화와 예술<br>
         문화예술: 부산은 다양한 문화예술 행사와 축제가 열리는 도시로, 부산국제영화제(BIFF)와 같은 국제적인 행사도 개최됩니다. 이 외에도 다양한 전통 문화와 현대 예술이 공존하고 있습니다.<br>
         핫 플레이스: 해운대와 광안리 해수욕장, 자갈치 시장 등은 부산의 대표적인 관광지로, 많은 관광객들이 찾는 명소입니다.<br>
         관광 명소<br>
         자연환경: 부산은 아름다운 해변과 산이 어우러진 자연경관을 자랑합니다. 태종대와 금정산은 하이킹과 자연 탐방에 적합한 장소입니다.<br>
         역사유산: 부산에는 부산타워, 동래읍성 등 역사적인 유적지와 박물관이 많아, 방문객들이 한국의 역사와 문화를 배울 수 있는 기회를 제공합니다.<br>
         음식과 시장<br>
         식도락: 부산은 해산물 요리로 유명하며, 특히 회와 생선구이, 밀면, 돼지국밥 등 다양한 전통 음식을 즐길 수 있는 식도락의 도시입니다. 자갈치 시장은 신선한 해산물을 구매하고 맛볼 수 있는 명소입니다.<br>
         부산은 역사적 의미와 문화적 다양성을 지닌 도시로, 방문객들에게 많은 볼거리와 경험을 제공합니다. 이곳은 단순한 여행지를 넘어, 한국의 해양 문화와 예술을 체험할 수 있는 특별한 장소입니다.<br>
        </div>
        <h5 id="modalTitle"></h5>
        <p id="modalDescription"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 광주 -->
<div class="modal fade" id="travelInfo6" tabindex="-1" aria-labelledby="travelInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="travelInfoModalLabel">여행지 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img id="modalImage" src="${path}/resources/image/admin/choose/광주_n.png" alt="여행지 이미지" class="img-fluid">
      <div>
         광주 개요
         위치: 광주는 전라남도에 위치한 광역시로, 대한민국의 남서부에 자리잡고 있습니다.
         인구: 약 150만 명의 인구를 보유하고 있으며, 다양한 문화와 예술이 공존하는 도시입니다.
         역사적 배경
         역사적 사건: 광주는 1980년 5.18 민주화 운동의 중심지로, 이 사건은 한국 현대사에서 중요한 의미를 지닙니다. 이로 인해 광주는 민주화와 인권의 상징으로 여겨집니다.
         문화와 예술
         문화예술: 광주는 다양한 문화예술 행사와 축제가 열리는 곳으로, 매년 광주 비엔날레와 같은 국제적인 행사도 개최됩니다.
         핫 플레이스: 광주에는 다양한 카페, 갤러리, 공연장이 있어 젊은 세대와 예술가들이 자주 찾는 장소입니다.
         관광 명소
         자연환경: 광주는 아름다운 자연경관을 자랑하며, 무등산과 같은 명산이 있습니다. 이곳은 하이킹과 자연 탐방에 적합합니다.
         역사유산: 광주에는 역사적인 유적지와 박물관이 많아, 방문객들이 한국의 역사와 문화를 배울 수 있는 기회를 제공합니다.
         음식과 시장
         식도락: 광주는 다양한 전통 음식과 현대적인 요리를 즐길 수 있는 식도락의 도시입니다. 특히, 광주 비빔밥과 같은 지역 특산물이 유명합니다.
         광주는 역사적 의미와 문화적 다양성을 지닌 도시로, 방문객들에게 많은 볼거리와 경험을 제공합니다. 이곳은 단순한 여행지를 넘어, 한국의 민주화 역사와 예술을 체험할 수 있는 특별한 장소입니다.
         
         더 자세한 정보는 나무위키 광주광역시에서 확인하실 수 있습니다.
      </div>        
        <h5 id="modalTitle"></h5>
        <p id="modalDescription"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>