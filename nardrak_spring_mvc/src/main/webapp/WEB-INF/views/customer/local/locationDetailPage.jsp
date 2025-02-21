<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>locationDetailPage</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/location/locationDetailPage.css">

</head>
<body>

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 

<!-- main 시작 -->
<div class="wrap">
	<div class="container">
		
		<!-- api에 대입할 위도 경도 -->
		<c:set var="latitude" value="${dto.latitude}"/>	
		<c:set var="longitude" value="${dto.longitude}"/>	
		
		<div class="divWidth100"><h2 id="local_title" class="local_title">${dto.local_title}</h2></div>
		
		<div class="divWidth100" id="region">${dto.region}</div>
		
		<div class="divWidth100" id="description">${dto.description}</div>
		
		<div class="divWidth100" id="local_tags">${dto.local_tags}</div>
		
		<div class="divWidth100"><img id ="local_image" class="local_image" src="${path}${dto.local_image}" alt="${dto.local_title}"></div>
		
	    <div class="detailDiv">
	    	<div><h3>상세정보</h3></div>
	    </div>
	     
     	<div class="detailDiv2"><div id="local_detail">${dto.local_detail}</div></div>	
		
		<div class="detailDiv">
	    	<div><h3>${dto.local_title} 지도</h3></div>
	    </div>
	    
		<div id="mapDiv"><div id="map" style="width:700px;height:300px;"></div></div>

		<div class="detailDiv"><div>
			<h3>${dto.local_title} 로드뷰 [ 100m 이내 ]</h3></div>
		</div>
		
		<!-- 로드뷰 -->
		<div id="loadDiv">
			<div id="roadview" style="width:100%;height:300px;"></div>	
		    <div id="noRoadviewMessage" style="display:none; color:red;">로드뷰가 없습니다</div>
		</div>
		
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41c38302d9f4c82a17d46b1f3eeff982"></script>
			<script>
				/* 지도 */
			    var mapContainer = document.getElementById('map'),
			        mapOption = {
			            center: new kakao.maps.LatLng(${dto.latitude}, ${dto.longitude}),
			            level: 4,
			            mapTypeId : kakao.maps.MapTypeId.ROADMAP
			        };
			
			    var map = new kakao.maps.Map(mapContainer, mapOption);
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			    var mapTypeControl = new kakao.maps.MapTypeControl();

			    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			    var zoomControl = new kakao.maps.ZoomControl();
			    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			    
			    var marker = new kakao.maps.Marker({
			        position: map.getCenter()
			    });
			    marker.setMap(map);
			    var iwContent = '<div style="padding:5px; width: 150px">${dto.local_title}<br>'
			    					+'<a href="https://map.kakao.com/link/map/${dto.local_title},${dto.latitude},${dto.longitude}" style="color:blue" target="_blank">큰지도보기</a>'
			    					+' <a href="https://map.kakao.com/link/to/${dto.local_title},${dto.latitude},${dto.longitude}" style="color:blue" target="_blank">길찾기</a>'
			    				+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(${dto.latitude}, ${dto.longitude}); //인포윈도우 표시 위치입니다
	
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker);
				
				/* 로드뷰 */
				var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
			    var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
			    var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
			
			    var position = new kakao.maps.LatLng(${dto.latitude}, ${dto.longitude}); // 로드뷰 위치
			
			    // 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
			    roadviewClient.getNearestPanoId(position, 100, function(panoId) {
			        if (panoId === null) {
			            // 로드뷰가 없는 경우 메시지를 표시
			            // 기존 noRoadviewMessage 숨김
			            document.getElementById('noRoadviewMessage').style.display = 'none';
			
			            // 새로운 메시지 div 생성
			            var messageDiv = document.createElement('div');
			            messageDiv.innerHTML = '로드뷰가 없습니다';
			            messageDiv.style.position = 'absolute'; // 절대 위치 설정
			            messageDiv.style.top = '50%'; // 세로 중앙 정렬
			            messageDiv.style.left = '50%'; // 가로 중앙 정렬
			            messageDiv.style.transform = 'translate(-50%, -50%)'; // 중앙 정렬 보정
			            messageDiv.style.color = 'white'; // 흰색 텍스트
			            messageDiv.style.fontSize = '20px'; // 글꼴 크기 설정
			            messageDiv.style.fontWeight = 'bold'; // 굵은 글꼴 설정
			
			            // 회색 화면 위에 메시지 추가
			            roadviewContainer.appendChild(messageDiv);
			        } else {
			            // 로드뷰가 있는 경우 로드뷰 실행
			            roadview.setPanoId(panoId, position);
			        }
			    });
			</script>
			
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>