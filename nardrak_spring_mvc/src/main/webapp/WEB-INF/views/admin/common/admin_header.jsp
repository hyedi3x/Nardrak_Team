<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- js -->
<script src="${path}/resources/js/header.js" defer></script>

<title>Header</title>
</head>
<body>
	<div id="header">
		<div class="main-logo">
			<img src="${path}/resources/image/common/logo.png" alt="로고">
		</div>
		
		<div class="travel">
			<ul>
				<li class="">
					<a href="#">추천</a>
					<div class="travel-menu">
	            		<ul>
	            			<li><a href="#">뚜벅이 코스</a></li>
			                <li><a href="#">데이트 코스</a></li>
			                <li><a href="#">테마코스</a></li>
	            		</ul>
	            	</div>
				</li>
				<li class="">
					<a href="#">명소</a>
					<div class="travel-menu">
	            		<ul>
				            <li><a href="#">랜드마크</a></li>
			                <li><a href="#">문화재</a></li>
			                <li><a href="#">미술관 & 박물관</a></li>
	            		</ul>
	            	</div>
				</li>
			</ul>
		</div>
		
		<div class="user">
			<ul>
				<li>
					<a href="${path}/logout.do">
						<i class="fa-solid fa-arrow-right-to-bracket"></i>로그아웃
					</a>
				</li>
				<li>
					<a href="${path}/adminSignUp.ad">
        				<i class="fa-solid fa-users-gear"></i> 새로운 관리자등록
					</a>
        		</li>
				<li>
					<a href="${path}/myInfoAdmin.ad">
						<i class="fa-regular fa-user"></i> 관리자 페이지
					</a>
				</li>
			</ul>
		</div>
		
		<!-- 햄버거(메뉴) 버튼 -->
		<i class="fa-solid fa-bars" id="menu-button"></i>
		
		<!-- 슬라이드 메뉴 -->
		<div class="side" id="side">
			<!-- &times : 곱셈(multiple) 속성으로, 특수 문자 x와 동일 -->
	        <button class="close-btn" id="close-btn">&times;</button>
	        <div class="side-travel">
		        <ul>
		            <li>
		            	<a href="#">
			            	추천 <i class="fa-solid fa-angle-down"></i>
		            	</a>
		            	<div class="side-travel-menu">
		            		<ul>
		            			<li><a href="#">뚜벅이 코스</a></li>
				                <li><a href="#">데이트 코스</a></li>
				                <li><a href="#">테마코스</a></li>
		            		</ul>
		            	</div>
		            </li>
		            <li>
		            	<a href="#">
			            	명소 <i class="fa-solid fa-angle-down"></i>
		            	</a>
		            	<div class="side-travel-menu">
		            		<ul>
					            <li><a href="#">랜드마크</a></li>
				                <li><a href="#">문화재</a></li>
				                <li><a href="#">미술관 & 박물관</a></li>
		            		</ul>
		            	</div>
		            </li>
		        </ul>
	        </div>
	        <div class="side-user-menu">
	        	<ul>
					<li>
						<a href="${path}/logout.do">
							<i class="fa-solid fa-arrow-right-to-bracket"></i>로그아웃
						</a>
					</li>
					<li>
						<a href="${path}/adminSignUp.ad">
	        				<i class="fa-solid fa-users-gear"></i> 새로운 관리자등록
						</a>
	        		</li>
					<li>
						<a href="${path}/myInfoAdmin.ad">
							<i class="fa-regular fa-user"></i> 관리자 페이지
						</a>
					</li>
	        	</ul>
	        </div>
    	</div>
	</div>
</body>
</html>