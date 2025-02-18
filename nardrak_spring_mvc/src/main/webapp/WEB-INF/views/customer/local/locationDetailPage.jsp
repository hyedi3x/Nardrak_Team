<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/location/locationDetailPage.css">

<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/join/join.js" defer></script>

<!-- 부트 스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 
	

<!-- main 시작 -->
<div class="wrap">
	<div class="container">
	
		<div class="width100"><h2>속초 외옹치 바다향기로</h2></div>
		
		<div class="width100"><img class="local_image" src="${path}/resources/image/common/localDetailImg/속초바다.jpg" alt="속초바다"></div>

	    <div class="detailDiv"><div><h3>상세정보</h3></div></div>
	     
     	<div class="detailDiv2"><div>바다향기로는 속초해수욕장에서 외옹치항까지 1.74㎞에 걸쳐 이어진 이색적인 해안 산책 코스다. 크게 속초해수욕장 구간(850m)와 외옹치 구간(890m)으로 나뉘며 구간마다 서로 다른 분위기를 지녔다. 가볍게 해변을 따라 걷고 싶다면 속초해수욕장 구간이 적합하며 다이나믹한 풍경을 담고 싶다면 외옹치 구간을 추천한다. 외옹치 구간은 수십 년간 민간인 출입이 통제되었던 곳으로 오랫동안 사람 손때를 타지 않은 천혜의 비경을 품고 있다. 드라마 <남자친구> 촬영지로도 유명하다. 나무 데크 탐방로와 흙길을 오가는 산책로를 따라 푸른 바다가 끝없이 이어지며 철썩이는 파도 소리가 청량감을 더한다. 바닷물이 맑고 깨끗해 바닥이 훤히 비칠 정도다. 외옹치 구간은 대나무 명상길, 하늘 데크길, 안보 체험길, 암석 관찰길 4개 테마 코스로 꾸며졌다. 안보 체험길에 둘러쳐진 해안선 경계 철책은 1970년 무장공비 침투 사건 이후 설치했던 것을 일부분 남겨 놓은 것이다. 굴바위, 지네바위 등 해안가에 형성된 기이한 바위들을 관람하는 재미도 쏠쏠하다.</div></div>	
		
		<div class="width100"><div id="map" class="pageMap"></div></div>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79bbefa2809ba249c3001e13077fefda"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        center: new kakao.maps.LatLng(37.56760, 126.98118), // 지도의 중심좌표
							        level: 4, // 지도의 확대 레벨
							        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
							    }; 
					
							// 지도를 생성한다 
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							// 마커가 표시될 위치입니다 
							var markerPosition  = new kakao.maps.LatLng(37.56760, 126.98118);
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							
							var iwContent = '<div style="padding:5px;">속초 외옹치<br>바다향기로<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/속초 외옹치 바다향기로,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    position : iwPosition, 
							    content : iwContent 
							});
							// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
							infowindow.open(map, marker); 
						</script>
		
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>