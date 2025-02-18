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
				<li>
					<a href="#">국내여행</a>
				</li>
				<li>
					<a href="#">추천여행지</a>
				</li>
			</ul>
		</div>
		
		<div class="search">
			<i class="fa-solid fa-magnifying-glass" id=""></i>
			<input type="text" placeholder="어디로 놀러 가세요?" id="search-text">
		</div>

		<div class="user">
			<ul>
				<li>
					<a href="${path}/logout.do">
						<i class="fa-solid fa-arrow-right-to-bracket"></i>로그아웃
					</a>
				</li>
				<li>
					<a href="${path}/myInfo.do">
						<i class="fa-regular fa-user"></i> 관리자 페이지
					</a>
				</li>
				<li>
	            	<a href="#">
						<i class="fa-solid fa-phone" id="icon"></i> 고객센터
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
		            	<a href="#">국내여행</a>
		            </li>
		            <li>
		            	<a href="#">추천여행지</a>
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
						<a href="${path}/myInfo.do">
							<i class="fa-regular fa-user"></i> 관리자 페이지
						</a>
					</li>
					<li>
		            	<a href="#">
							<i class="fa-solid fa-phone" id="icon"></i> 고객센터
						</a>
					</li>					
	        	</ul>
	        </div>
    	</div>
	</div>
</body>
</html>