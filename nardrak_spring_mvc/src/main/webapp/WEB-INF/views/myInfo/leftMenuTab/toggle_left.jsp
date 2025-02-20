<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<title>나의 정보 좌측 메뉴</title>

<!-- js -->
<script src="${path}/resources/js/myInfo/myInfoToggle.js" defer></script>

</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.login_session eq 'Customer'}">
			<!-- 좌측 메뉴바 -->
			<ul id="left_menubar">
				<!-- 고객 문의 -->
				<li>
					<h4> 고객 문의</h4>
					<ul class="info_menu">
						<li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 1:1 문의 </a></li>
						<li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 자주하는 질문 </a></li>
					</ul>
				</li>
				
				<!-- 관심 상품 -->
				<li>
					<h4> 관심 상품</h4>
					<ul class="info_menu">
						<li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 찜한 상품</a></li>
					</ul>
				</li>				
				
				<!-- 회원정보 -->
				<li>
					<h4> 회원정보 </h4>
					<ul class="info_menu">
			            <li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 개인정보 설정</a></li>
			            <li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 회원 탈퇴</a></li>
					</ul>
				</li>	
			</ul>
		</c:when>
		<c:when test="${sessionScope.login_session eq 'Admin'}">
			<!-- 좌측 메뉴바 -->
			<ul id="left_menubar">	
				<!-- 회원 관리 -->
				<li>
					<h4> 회원 관리 </h4>
					<ul class="info_menu">
						<li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 탈퇴 회원 정보 관리 </a></li>
					</ul>
				</li>
				
				<!-- 고객 문의 -->
				<li>
					<h4> 고객 문의</h4>
					<ul class="info_menu">
						<li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 1:1 문의 내역 </a></li>
						<li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 자주하는 질문 </a></li>
					</ul>
				</li>
				
				<!-- 상품 관리 -->
				<li>
					<h4> 상품 관리 </h4>
					<ul class="info_menu">
						<li class="on"><a href="#">☞ 찜한 상품</a></li>
						<li class="on"><a onclick="window.location='${path}/locationDetail.tr'">국내여행지 정보 등록</a></li>
						<li class="on"><a onclick="window.location='${path}/chooseDetail.ch'">추천 여행지 정보 등록</a></li>
					</ul>
				</li>				
				
				<!-- 관리자 정보  -->
				<li>
					<h4> 관리자 정보 </h4>
					<ul class="info_menu">
			            <li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 개인정보 설정</a></li>
			            <li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 회원 탈퇴</a></li>
			            <li class="on"><a onclick="window.location='${path}/myInfo.do'">☞ 관리자 승인 요청 조회 </a></li>
					</ul>
				</li>	
			</ul>
		</c:when>		
	</c:choose>	
</body>
</html>