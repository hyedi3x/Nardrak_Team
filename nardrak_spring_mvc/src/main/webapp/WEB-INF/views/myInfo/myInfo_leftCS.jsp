<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>나의 정보 좌측 메뉴</title>

<script src="${path}/resources/js/myInfo/myInfo.js" defer></script>

</head>
<body>
	<!-- 좌측 메뉴바 -->
	<ul id="left_menubar">
		<!-- 고객 문의 -->
		<li>
			<h4> 고객 문의</h4>
			<ul class="info_menu">
				<li class="on"><a onclick="load('${path}/qnaGuide.do')">☞ 1:1 문의 내역 </a></li>
				<li class="on"><a href="#">☞ 자주하는 질문 </a></li>
			</ul>
		</li>
		
		<!-- 관심 상품 -->
		<li>
			<h4> 관심 상품</h4>
			<ul class="info_menu">
				<li class="on"><a href="#">☞ 찜한 상품</a></li>
			</ul>
		</li>				
		
		<!-- 회원정보 -->
		<li>
			<h4> 회원정보 </h4>
			<ul class="info_menu">
	            <li class="on"><a onclick="load('${path}/certifyInfo.do')">☞ 개인정보 설정</a></li>
	            <li class="on"><a onclick="load('${path}/certifyDelete.do')">☞ 회원 탈퇴</a></li>
			</ul>
		</li>	
	</ul>
	
</body>
</html>