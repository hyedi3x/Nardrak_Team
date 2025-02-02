<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/admin/join/join.css">

<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/3e59cb63da.js" crossorigin="anonymous"></script>

<!-- js -->
<script type="text/javascript" src="${path}/resources/js/admin/join/join.js" defer></script>

<!-- 부트 스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
<!-- js-->
<script type="text/javascript" defer></script>

<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	
<div class="wrap">
<div class="container">
	
	<div class="joinLogo"><a href="#"><img src="${path}/resources/image/admin/logo.png" alt="로고"></a></div>
	
	<form action="${path}/adminSignUpAction.ad" method="post" name="joinForm" onsubmit="return submitChk()">
	
		<input type="hidden" id="idChk" value="0">
		<input type="hidden" id="modalChk1" value="0">
		<input type="hidden" id="modalChk2" value="0">
		<input type="hidden" id="pwdShow" value="0">
		<input type="hidden" id="pwdValCheck" value="0">
		
		<table>
			
			<tr>
				<th class="font14">아이디</th>
			</tr>
			<tr>	
				<td>
					<input type="text" id="ad_id" class="ad_id" name="ad_id" placeholder="영어 소문자 및 숫자로만, 4~16자리" autofocus required>
					<button type="button" class="idChkBTN" onclick="idConfirm1('${path}')"> 중복확인 </button>
			</td>
				
			</tr>
			
			<tr>
				<th class="font14">비밀번호</th>
			</tr>
			<tr>	
				<td class="pwd_class">
					<input type="password" id="ad_pwd" class="ad_pwd" name="ad_pwd" placeholder="영어, 숫자, 특수문자 조합 8~16자리" required >
						<i id="pwdIcon1" class="fa-regular fa-eye-slash" onclick="pwdShow(0)"></i>
						<i id="pwdIcon2" class="fa-regular fa-eye" onclick="pwdShow(1)"></i>
					<!-- 태영 추가 -->
					<br>
					<div class="strongPassword-message hide"><div class="font14" id="pwdMessage">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요.</div></div>				
				</td>
			</tr>
			
			<tr>
				<th class="font14">비밀번호 확인</th>
			<tr>
			<tr>	
				<td><input type="password" id="pwdChk" class="pwdChk" placeholder="영어, 숫자, 특수문자 조합 8~16자리" required></td>
			</tr>
			<tr>
				<th class="font14">이름</th>
			</tr>
			<tr>	
				<td><input type="text" id="ad_name" class="ad_name" name="ad_name" placeholder="이름입력"  required></td>
			</tr>
			
			<tr>
				<th class="font14">생년월일</th>
			</tr>
			<tr class="birth">	
				<td>
					<input type="number" id="ad_birth" class="ad_birth" name="ad_birth" placeholder="생년월일 6자리" required>
					<span class="birthIcon"><i class="fa-solid fa-minus"></i></span>
					<c:forEach begin="1" end="7">
						<i class="fa-solid fa-circle" id="dot"></i>
					</c:forEach>
					<br>
					<div class="red" id="birthChk"><div class="font14">생년월일은 6자리 입니다.</div></div>
				</td>
			</tr>
			
			<tr>
				<th class="font14">휴대폰번호 인증</th>
			</tr>
			<tr>
				<td><select class="ad_phone1" id="ad_phone1" name="ad_phone1">
					<option value="S">SKT</option>
					<option value="K">KT</option>
					<option value="L">LGU+</option>
					<option value="M_S">알뜰폰(SKT)</option>
					<option value="M_K">알뜰폰(KT)</option>
					<option value="M_L">알뜰폰(LG U+)</option>
				</select></td>
			</tr>
			<tr>
				<td>
					<input type="number" id="ad_phone2" class="ad_phone2" name="ad_phone2" placeholder="-없이 숫자만 입력"  required>
					<br>
					<div class="red" id="phoneChk"><div class="font14">휴대폰번호를 정확하게 입력해 주세요.</div></div>
				</td>
			</tr>
			
			<tr>
				<th class="font14">이메일</th>
			</tr>
			<tr>	
				<td>
				<input type="text" id="ad_email1" name="ad_email1" class="ad_email1" placeholder="이메일 입력" required>
				<span class="emailIcon">@</span>
				<input type="text" id="ad_email2" name="ad_email2" class="ad_email2" placeholder="이메일 입력" required>
			</tr>
			<tr>
				<td class="eamilTd">
					<select id="ad_email3" class="ad_email3" onchange="emailFn()">
						<option value="" disabled selected>직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="google.com">구글</option>
						<option value="daum.com">다음</option>
						<option value="nate.com">네이트</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th class="font14">주소</th>
			</tr>
			<tr>
				<td>												
					<input type="text" class="input" name="ad_zip1" id="ad_zip1" size="20" value="" placeholder="우편번호 입력" readonly>
					<input type="button" class="ad_ZIPBTN" id="ad_ZIPBTN" name="ad_ZIPBTN"  value="주소 검색">
				</td>
			</tr>
			<tr>
				<td><input type="text" class="input" name="ad_zip2" id="ad_zip2" size="20" value="" placeholder="도로명 주소 입력" readonly></td>
			</tr>
			<tr>
				<td><input type="text" class="input" name="ad_zip3" id="ad_zip3" size="20" value="" placeholder="상세 주소 입력" ></td>
			</tr>
				
			<tr>
				<th class="font14">사내 전화번호</th>
			</tr>
			<tr>	
				<td><input type="number" id="ad_tel" name="ad_tel" placeholder="- 없이 숫자만 입력"  required></td>
			</tr>
			
			<tr>
				<th class="font14">사번</th>
			</tr>
			<tr>	
				<td><input type="text" id="ad_empnum" name="ad_empnum" placeholder="사번 입력"  required></td>
			</tr>
			
		<%-- <tr>
				<th class="font14">부서코드</th>
			</tr>
			<tr>	
				<td><input type="text" id="ad_dep" name="ad_dep" value="${dto.ad_dep}" placeholder="부서코드 입력"  required></td>
			</tr> --%>
			
			<!-- 태영 수정 -->
			<tr>
				<th class="font14">부서명</th>
			</tr>
			<tr>	
				
				<td>
					<select name="ad_dep" id="ad_dep" required>
						<option value="">부서 선택</option>
						<option value="A0001">경영지원</option>
						<option value="A0002">마케팅</option>
						<option value="A0003">영업</option>
						<option value="A0004">CS</option>
						<option value="A0005">IT</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th class="font14">본인인증 약관동의</th>
			</tr>
			<tr>
				<td><input type="checkbox" id="allCheck" name="allChk" class="chkList" value="a" onclick="chkListClick($('#allCheck'))"><b class="font14">전체동의 합니다.</b></td>
			</tr>
			
			<tr >
				<td><input type="checkbox" class="chkList" id="chkList1" name="chkList1" value="1" onclick="chkListClick($('#chkList1'))" required><b class="font14"><span class="check">[필수]</span>
					<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal1">본인 확인 서비스 이용 약관</a>에 동의합니다.</b></td>
			</tr>
			<tr>
				<td><input type="checkbox" class="chkList" id="chkList2" name="chkList2" value="2" onclick="chkListClick($('#chkList2'))" required><b class="font14" ><span class="check">[필수]</span>
						<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal2">통신사 이용 약관</a>동의</b></td>
			</tr>
			<tr>
				<td><input type="checkbox" class="chkList" id="chkList3" name="chkList3" value="3"><b class="font14">[선택]통신사/인증사의 <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal3">개인정보 이용 · 제공</a>에 동의합니다.</b></td>
			</tr>
			<tr>
				<td><input type="checkbox" class="chkList" id="chkList4" name="chkList4"  value="4"><b class="font14">[선택]<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal4">고유식별 정보 처리</a>에 동의합니다.</b></td>
			</tr>
			
			<!-- 태영 변경: 버튼 간격, hover 적용 -->
			<tr>
				<td>
					<button type="submit" class="submitBTN">관리자 등록</button>
				</td>
			</tr>
			
			<!-- 추가 -->
			<tr>
				<td>
					<button type="button" class="submitBTN" onclick="mainBTN('${path}')">가입 취소</button>
				</td>
			</tr>

		</table>
	</form>
	
</div>
</div>

<!-- 모달 약관 모음 -->
<%@ include file="./terms.jsp" %>

</body>
</html>