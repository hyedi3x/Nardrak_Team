<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>locationDetailModify</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/location/locationDetail.css">

<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/location/locationDetail.js" defer></script>

</head>
<body>

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 
	

<!-- main 시작 -->
<div class="wrap">
	<div class="container">
		
		<form name="inputform" action="${path}/modifyLocationDetailAction.tr" method="post" enctype="multipart/form-data">
	        <input type="hidden" name="originImage" value="${dto.local_image}">
	        <table>
	            <tr class="width100">
	                <th>여행지 이름</th>
	                <td>
	                    <input type="text" id="local_title" name="local_title" maxlength="30" placeholder="여행지 이름" value="${dto.local_title}" readonly> 
	                    <div id="idChk"></div>
	                </td>
	            </tr>
	            
	            <tr>
	             	<th>지역</th> 
					<td>
						<select class="region" id="region" name="region" required>
                  			<option value="">지역을 선택하세요</option>
							<option value="서울" <c:if test="${dto.region =='서울'}">selected</c:if>>서울</option>
							<option value="경기" <c:if test="${dto.region =='경기'}">selected</c:if>>경기</option>
							<option value="강원" <c:if test="${dto.region =='강원'}">selected</c:if>>강원</option>
							<option value="충청" <c:if test="${dto.region =='충청'}">selected</c:if>>충청</option>
							<option value="경상" <c:if test="${dto.region =='경상'}">selected</c:if>>경상</option>
							<option value="전라" <c:if test="${dto.region =='전라'}">selected</c:if>>전라</option>
							<option value="제주" <c:if test="${dto.region =='제쥬'}">selected</c:if>>제주</option>
						</select>
					</td>
				</tr>
				
				<tr class="width100">
	                <th>대표 소개글</th>
	                <td>
	                    <input type="text" id="description" name="description"  value="${dto.description}" placeholder="대표 소개글" required >
	                </td>
	            </tr>
				
				<tr class="width100">
	                <th>태그 메세지</th>
	                <td>
	                    <input type="text" id="local_tags" name="local_tags" value="${dto.local_tags}"  placeholder="# 태그로 연결" required >
	                </td>
	            </tr>
				
	            <tr>
	                <th>상세 정보</th>
	                <td>
	                    <textarea rows="20" cols="85" name="local_detail" id="local_detail" placeholder="소개말 작성" style="resize:none;" required>${dto.local_detail}</textarea>
	                </td>
	            </tr>
	            <tr class="width100">
	                <th>현재 이미지</th>
	                <td>
	                	<img src="${path}/${dto.local_image}" style="width:600px">
	                </td>
	             </tr>
	             <tr class="width100">
	                <th>변경할 대표 이미지</th>
	                <td>
	                    <input type="file" name="local_image" id="local_image " accept="image/*">

	                </td>
	            </tr>   
	            
	           	<tr>
	           		 <th>지도 검색</th>
	           		<td>
	           			<input type="text" id="keyword-search" class="form-control" placeholder="여행지 또는 장소 키워드를 입력하세요" value="${dto.local_title}" />
						<input type="button" class="btn btn-primary mt-2" id="search-btn" value="키워드 검색">
	           		</td>
	           	</tr>
	           	
	           	<tr class="width100">
	                <th>위도 / 경도</th>
	                <td class="mapTd">
						<input type="text" id="latitude" name="latitude" placeholder="위도" value="${dto.latitude}" readonly> 
						<input type="text" id="longitude" name="longitude" placeholder="경도" value="${dto.longitude}" readonly>
	
	                </td>
	            </tr> 
	           		
  			</table>
  			
  			<!-- 키워드 검색창 추가 -->
				
          	<div id="mapDiv"><div id="map" style="width:700px;height:300px;"></div></div>

			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41c38302d9f4c82a17d46b1f3eeff982&libraries=services"></script>
			<script>
			    var mapContainer = document.getElementById('map'),
			        mapOption = {
			            center: new kakao.maps.LatLng(${dto.latitude},${dto.longitude}),
			            level: 4,
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
	            <input class="inputButton" type="submit" value="여행지 수정"> 
	            <input class="inputButton" type="button" value="수정 취소" onclick="myInfoBTN('${path}')">
	        </div> 
	    </form>
		
	</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>