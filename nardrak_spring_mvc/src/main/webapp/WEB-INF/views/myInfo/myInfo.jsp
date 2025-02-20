<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>마이페이지</title>

<!-- css -->
<link href="${path}/resources/css/myInfo/myInfo.css" rel="stylesheet">
<link href="${path}/resources/css/myInfo/myInfo_left.css" rel="stylesheet">

<!-- js -->
<script src="${path}/resources/js/myInfo/myInfoToggle.js" defer></script>

</head>
<body>
	<div id="myInfoWrap">
		<!-- header_SessionScope.jsp : banner page & header page -->
		<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>
		
		<!-- 나의 정보 페이지 -->
		<div id="myInfo_container">
			<div id="myInfoTitle">
				<h2> 나의 정보 </h2>
			</div>
			<div id="myInfo_article">
				<c:choose>
		 			<c:when test="${sessionScope.login_session eq 'Customer'}">
						<!-- 왼쪽 메뉴바 -->
						<div id="myInfo_left">
							<%@ include file="/WEB-INF/views/myInfo/leftMenuTab/Ajax_left.jsp" %>
						</div>
						<!-- 오른쪽 화면 -->
						<div id="myInfo_right">
							<!-- 사용자 정보 -->
							<div id="myInfo">
								<div id="myInfo_Box">
									<div id="myInfoIcon">
										<i class="fa-solid fa-circle-user"></i>
									</div>
									<!-- 컨트롤러에서 담은 request.setAttribute("info", info) 데이터 정보를 el 태그로 불러온다. -->
									<div id="personInfoAll">
										<div id="personInfo">
											<div id="nameId">
												<h3>${dtoCS.cs_name}님</h3>
												<span>${dtoCS.cs_id}</span>
											</div>
											<p id="csRegdate">가입일 : ${fn:substring(dtoCS.cs_regDate, 0, 10)}</p>
										</div>
										<div id="personEmail">
											<strong><span> ${dtoCS.cs_email} </span></strong>
										</div>
									</div>
								</div>
							</div>
							<!-- 메뉴 선택 시 화면 변경 -->
							<div id="infoMenu">

							</div>
						</div>
					</c:when>
		 			<c:when test="${sessionScope.login_session eq 'Admin'}">
						<!-- 왼쪽 메뉴바 -->
						<div id="myInfo_left">
							<%@ include file="/WEB-INF/views/myInfo/leftMenuTab/Ajax_left.jsp" %>
						</div>
						<!-- 오른쪽 화면 -->
						<div id="myInfo_right">
							<!-- 사용자 정보 -->
							<div id="myInfo">
								<div id="myInfo_Box">
									<div id="myInfoIcon">
										<i class="fa-solid fa-circle-user"></i>
									</div>
									<!-- 컨트롤러에서 담은 request.setAttribute("info", info) 데이터 정보를 el 태그로 불러온다. -->
									<div id="personInfoAll">
										<div id="personInfo">
											<div id="nameId">
												<h3>${dtoAD.ad_name}님</h3>
												<span>${dtoAD.ad_id}</span>
											</div>
											<p id="csRegdate">가입일 : ${fn:substring(dtoAD.ad_regDate, 0, 10)}</p>
										</div>
										<div id="personEmail">
											<strong><span> ${dtoAD.ad_email} </span></strong>
										</div>
									</div>
								</div>
							</div>
							<!-- 메뉴바 탭 화면 include -->
							<div id="infoMenu">

							</div>
						</div>
					</c:when>					
				</c:choose>	
			</div>
		</div>
	<!-- footer page -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
	</div>

</body>
</html>