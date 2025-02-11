<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/join/join.css">

<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/modify_delete/modify_delete.js" defer></script>

<!-- 부트 스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
<!-- 모달 약관 모음 -->
<%@ include file="/WEB-INF/views/admin/join/terms.jsp" %>

</head>
<!-- input 함수들에서 체크하는 값들을 초기값을 설정해준다. (변경안하면 0을 유지해서) -->
<body onload="termsLoad('${dto.ad_terms}')">

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 

<div class="wrap">
<div class="container">

<!-- actionResult로 가기에는 dto를 가진게 너무 많아서 임시 위치 -->
<c:if test="${dto != null}">
		<script type="text/javascript">
		alert("관리자 삭제페이지로 이동합니다.");
	</script>
</c:if>
<c:if test="${dto == null}">
	<script type="text/javaScript">
		alert("비밀번호가 일치하지 않습니다.");
		window.location= "${path}/pwdCheck.ad";
	</script>
</c:if>
	
	
	<form action="${path}/adminDeleteAction.ad" method="post" name="joinForm" onsubmit="return deleteSubmit()">
		<input type="hidden" name="ad_id" value="${dto.ad_id}">
		<input type="hidden" name="ad_pwd" value="${dto.ad_pwd}">
		<table>
			<tr>
				<td class="width100"></td>
			</tr>
			<tr>
				<td><h3>${dto.ad_id}님의 관리자 권한 삭제</h3></td>
			</tr>
			<tr id="termsTr">
				<th id="termsTh" class="font16"> ✓ 본인인증 약관동의 내역</th>
			</tr>
			<tr>
				<td id="termsTd1"><pre id="terms1"></pre></td>
			</tr>
			
			<tr>
				<td id="termsTd2"><pre id="terms2"></pre></td>
			</tr>
			
			<tr>
				<td id="termsTd3"><pre id="terms3"></pre></td>
			</tr>
			
			<tr>
				<td id="termsTd4"><pre id="terms4"></pre></td>
			</tr>
			<tr>
				<td>관리자 계정에 등록된 정보와 등록 시, 동의하신 약관들은 30일 동안 보관된 후 삭제됩니다. <br>등록된 관리자를 삭제하려면 <b>"동의합니다."</b>를 입력하세요.</td>
			</tr>
			<tr>
				<td class="width100">
					<input type="text" id="deleteChk" placeholder="여기에 입력하세요.">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" class="submitBTN" value="관리자 권한 삭제">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="button" class="submitBTN" onclick="mainBTN('${path}')" value="가입 취소 [메인으로]">
				</td>
			</tr>

		</table>
	</form>
	
</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

</body>
</html>