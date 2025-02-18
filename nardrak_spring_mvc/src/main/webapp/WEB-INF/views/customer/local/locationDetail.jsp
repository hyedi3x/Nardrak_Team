<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/location/locationDetail.css">

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
		
		<form name="inputform" action="${path}/addLocationDetailAction.tr" method="post" enctype="multipart/form-data" onsubmit="return signlnCheck()">
	        
	        <!-- 2-1 중복확인 -->
	        <input type="hidden" name="hiddenUserId" value="0">
	        <input type="hidden" id="marketingConsentHidden" name="cs_Terms" value="${cs_Terms}">
	        
	        <table>
	            <tr class="width100">
	                <th> 여행지 이름 <span class="requiredAll">*</span></th> 
	                <td>
	                    <input type="text" id="local_title" name="local_title" maxlength="10" placeholder="여행지 이름" oninput="checkId(this.value)" required autofocus> 
	                    <div id="idChk"></div>
	                </td>
	            </tr>
	            
	            <tr>
	             	<th> 지역 <span class="requiredAll">*</span></th> 
					<td><select class="region" id="region" name="region">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충청">충청</option>
						<option value="경상">경상</option>
						<option value="전라">전라</option>
						<option value="제주">제주</option>
					</select></td>
				</tr>
				
	            <tr>
	                <th> 상세 정보 <span class="requiredAll">*</span></th>
	                <td>
	                    <textarea rows="5" cols="70" name="local_detail" id="local_detail" placeholder="소개말 작성" style="resize:none;" required></textarea>
	                </td>
	            </tr>
	            
	             <tr class="width100">
	                <th> 대표 이미지 <span class="requiredAll">*</span></th>
	                <td>
	                    <input type="file" class="input" name="local_image" id="local_image " accept="image/*" required>

	                </td>
	            </tr>   
	            
	            <tr>
	                <th> 지도 위도 경도 <span class="requiredAll">*</span></th>
	                <td class="mapTd">
						<input type="text" id="latitude" name="latitude" placeholder="위도" required> 
						<input type="text" id="longitude" name="longitude" placeholder="경도" required>
	
	                </td>
	            </tr> 
	            <tr>
  			</table>
  			
  			<!-- 키워드 검색창 추가 -->
			<div class="search-container">
				<input type="text" id="keyword-search" class="form-control" placeholder="여행지 또는 장소 키워드를 입력하세요" />
				<button class="btn btn-primary mt-2" id="search-btn">키워드 검색</button>
			</div>
    	
          	<div id="mapDiv"><div id="map" style="width:400px;height:150px;"></div></div>

				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79bbefa2809ba249c3001e13077fefda&libraries=services"></script>
				<script>
				    var mapContainer = document.getElementById('map'),
				        mapOption = {
				            center: new kakao.maps.LatLng(37.5665, 126.9780),
				            level: 7,
				            mapTypeId : kakao.maps.MapTypeId.ROADMAP
				        };
				
				    var map = new kakao.maps.Map(mapContainer, mapOption);
				
				    var marker = new kakao.maps.Marker({
				        position: map.getCenter()
				    });
				    marker.setMap(map);
				    
				 	// 카카오 장소 검색 API(키워드 검색할려면 필수로 해야 하는 부분)
					var ps = new kakao.maps.services.Places();

					document.getElementById('search-btn').addEventListener('click', function() {
					    var keyword = document.getElementById('keyword-search').value;

					    ps.keywordSearch(keyword, function(data, status, pagination) {
					        if (status === kakao.maps.services.Status.OK) {
					            var place = data[0]; // 첫 번째 검색 결과만 사용
					            var latlng = new kakao.maps.LatLng(place.y, place.x);

					            // 지도 중심 이동
					            map.setCenter(latlng);
					            
					            // 마커 위치 이동
					            marker.setPosition(latlng);
					            
					         	// 위도와 경도를 소수점 6자리로 반올림하여 입력
					            var latitude = latlng.getLat().toFixed(6);
					            var longitude = latlng.getLng().toFixed(6);
					            
					         	// 위도, 경도 값 입력
					            document.getElementById('latitude').value = latitude;
					            document.getElementById('longitude').value = longitude;
					        } else {
					            alert('검색된 결과가 없습니다.');
					        }
					    });
					});
				</script>
           		<!-- 회원가입 버튼 -->
               <div class="btnDiv">
                   <input class="inputButton" type="submit" value="여행지 등록"> 
                   <input class="inputButton" type="button" value="등록취소" onclick="window.location='${path}/main.do'">
               </div> 
	    </form>
		
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>