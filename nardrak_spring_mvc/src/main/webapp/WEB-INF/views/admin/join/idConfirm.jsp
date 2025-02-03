<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idConfirm</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/join/join.css">
<link rel="stylesheet" href="${path}/resources/css/admin/join/idConfirm.css">

<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/join/join.js" defer></script>

</head>
<body>
<div class="wrap">
	<div id="container">
			<div class="joinLogo"><a href="#"><img src="${path}/resources/image/admin/logo.png" alt="로고"></a></div>
		<!-- 아이디, 비밀번호, 전화번호, 생년월일, 전화번호, 이메일, 사내전화번호, 사번, 부서코드, 가입일, 권한상태, 권한세션 -->
		<form action="adminidConfirm.ad" method="post" name="joinForm">
		
			<table>
			<c:if test="${selectCnt == 1}">
				<tr>
					<th id="idConTh">입력하신 아이디 <span class="idColor">${ad_id}</span>는 사용할 수 없습니다.</th>
				</tr>
				<tr>
					<td class="inConTd">
						<span id="idConTitle">아이디</span>
						<input type="text" id="ad_id" class="ad_id" name="ad_id" placeholder="영어 소문자 및 숫자로만, 4~16자리" autofocus style="width: 300px" onchange="idChkReset()">
					</td>
				</tr>
				<tr>
					<td class="inConTd">
						<button type="submit" class="idConBTN" onclick="return idConfirm3()"> 중복확인 </button> <!-- 함수로 새창을 열지 않고 뷰객체를 다시 생성해야 opener를 정상 사용가능 -->
					</td>
				</tr>
			</c:if>
			<c:if test="${selectCnt == 0}">
				<tr>
					<th id="idConTh">입력하신 아이디 <span class="idColor">${ad_id}</span>는 사용 가능합니다.</th>
				</tr>
				<tr>	
					<td class="inConTd">
						<button type="button" class="idConBTN" onclick="idConfirm2('${ad_id}')"> 확인 </button>
					</td>
				</tr>
			</c:if>
			</table>
		</form>
	</div>
</div>
</body>
</html>