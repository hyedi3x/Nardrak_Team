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
<script type="text/javascript" src="${path}/resources/js/admin/join/join.js" defer></script>
<script type="text/javascript" src="${path}/resources/js/admin/modify_delete/modify_delete.js" defer></script>

<!-- 부트 스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<!-- input 함수들에서 체크하는 값들을 초기값을 설정해준다. (변경안하면 0을 유지해서) -->
<body onload="bodyOnLoad()">

<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 

<div class="wrap">
<div class="container">

<!-- actionResult로 가기에는 dto를 가진게 너무 많아서 임시 위치 -->
<c:if test="${dto != null}">
		<script type="text/javascript">
		alert("관리자 수정페이지로 이동합니다.");
	</script>
</c:if>
<c:if test="${dto == null}">
	<script type="text/javaScript">
		alert("비밀번호가 일치하지 않습니다.");
		window.location= "${path}/pwdCheck.ad";
	</script>
</c:if>
	
	<form action="${path}/adminModifyAction.ad" method="post" name="joinForm" onsubmit="return submitChk()">
	
		<!-- id 중복확인(생략 =1), 약관 필수1,2 체크(생략 =1), 비밀번호 아이콘, id 값확인, 비밀번호 값확인, 이메일 값확인, 생년월일 값 확인 -->		
		<input type="hidden" id="idChk" value="1">
		<input type="hidden" id="pwdShow" value="0">
		<input type="hidden" id="idValCheck" value="1">
		<input type="hidden" id="pwdValCheck" value="1">
		<input type="hidden" id="emailVal1Check" value="1">
		<input type="hidden" id="emailVal2Check" value="1">
		<input type="hidden" id="brithValCheck" value="1">
		<input type="hidden" id="modalChk1" value="1">
		<input type="hidden" id="modalChk2" value="1">
		
		<!-- ajax 실행하긴 해야하는데 조회가 있으면 type를 바꿔야겠다. 이거 signUp에도 기본빵으로 넣고
		     조회없으면 타입 0, 조회하면 value 1 이렇게 가야겠다. 이메일 입력시 작동하니 기본값은 상관 없을 것 -->
		<input id="uniquePhone" type="hidden" value="1">
		<input id="uniqueEmail" type="hidden" value="1">
		<input id="uniqueEmpnum" type="hidden" value="1">
	
		<div id="signUpTitle">
			<p id="ad_title"> 관리자 회원가입 </p>
			<p> 회원 가입 시, 관리자의 승인이 있어야 로그인이 가능합니다.</p>			
		</div>		
		<!-- id 10자리, 비밀번호(확인) 16자리, 이름 30자리, 생년월일 6자리, 핸드폰 13자리, [ 이메일1 15자리, (@) 이메일 2 14자리 : 총 30자 ], [ 상세주소 30자 : 총 30자 ], 사번 20자리  --> 
		<table>
			
			<tr>
				<th class="font16">아이디</th>
			</tr>
			<tr class="width100">	
				<td>
					<input type="text" id="modifyId" name="ad_id" value="${dto.ad_id}" maxlength="10" readonly>
			</td>
				
			</tr>
			
			<tr>
				<th class="font16">비밀번호</th>
			</tr>
			<tr class="width100">	
				<td class="pwd_class">
					<input type="password" id="ad_pwd" class="ad_pwd" name="ad_pwd" placeholder="영어, 숫자, 특수문자 조합 8~16자리" maxlength="16" value="${dto.ad_pwd}" autofocus required >
						<i id="pwdIcon1" class="fa-regular fa-eye-slash" onclick="pwdShow(0)"></i>
						<i id="pwdIcon2" class="fa-regular fa-eye" onclick="pwdShow(1)"></i>
					<div class="red" id="pwdStr1"><div class="font14">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 작성하세요.</div></div>				
				</td>
			</tr>
			
			<tr>
				<th class="font16">비밀번호 확인</th>
			<tr>
			<tr class="width100">		
				<td>
					<input type="password" id="pwdChk" class="pwdChk" placeholder="영어, 숫자, 특수문자 조합 8~16자리" maxlength="16" value="${dto.ad_pwd}" required>
					<div class="red" id="pwdStr2"><div class="font14">비밀번호가 일치하지 않습니다.</div></div>
				</td>
			</tr>
			<tr>
				<th class="font16">이름</th>
			</tr>
			<tr class="width100">		
				<td><input type="text" id="ad_name" class="ad_name" name="ad_name" placeholder="이름입력" value="${dto.ad_name}" maxlength="30" required></td>
			</tr>
			
			<c:set var="birthJender" value="${fn:split(dto.ad_birth,'-')}" /> <!-- 배열로 저장 됨 -->
			<c:set var="ad_birth" value="${birthJender[0]}" />
			<c:set var="ad_jender" value="${birthJender[1]}" />
			
			<tr>
				<th class="font16">생년월일</th>
			</tr>
			<tr>	
				<td>
					<input type="number" id="ad_birth" class="ad_birth" name="ad_birth" maxlength="6" placeholder="생년월일 6자리" value="${ad_birth}" required>
					<span class="birthIcon"><i class="fa-solid fa-minus"></i></span>
					<input type="number" id="ad_jender" class="ad_jender" name="ad_jender" maxlength="1" value="${ad_jender}" required oninput="jender()">
					<c:forEach begin="1" end="6">
						<i class="fa-solid fa-circle" id="dot"></i>
					</c:forEach>
					<div class="red" id="birthChk"><div class="font14">생년월일을 정확하게 입력해 주세요.<br>[ 만14세 이상 만60세 이하 ]</div></div>
					<div class="red" id="jenderChk"><div class="font14"> 주민번호 뒷자리를 정확하게 입력해 주세요.</div></div>
				</td>
			</tr>
			
			<!-- 통신사 010-0000-0000 형식 데이터 나누기  -->
			<c:set var="phone" value="${fn:split(dto.ad_phone,' ')}" />
			<c:set var="ad_phone1" value="${phone[0]}" />
			<c:set var="ad_phone2" value="" /> <!-- 초기화 -->
			<c:forEach var="i" items="${fn:split(phone[1],'-')}">
				<c:set var="ad_phone2" value="${ad_phone2}${i}" /> <!-- 문자열 연결 -->
			</c:forEach>
			
			<tr>
				<th class="font16">휴대폰번호 인증</th>
			</tr>
			<tr>
				<td><select class="ad_phone1" id="ad_phone1" name="ad_phone1">
					<option value="S" <c:if test="${ad_phone1 == 'S'}">selected</c:if> >SKT</option>
					<option value="K" <c:if test="${ad_phone1 == 'K'}">selected</c:if> >KT</option>
					<option value="L" <c:if test="${ad_phone1 == 'L'}">selected</c:if> >LGU+</option>
					<option value="M_S" <c:if test="${ad_phone1 == 'M_S'}">selected</c:if> >알뜰폰(SKT)</option>
					<option value="M_K" <c:if test="${ad_phone1 == 'M_K'}">selected</c:if> >알뜰폰(KT)</option>
					<option value="M_L" <c:if test="${ad_phone1 == 'M_L'}">selected</c:if> >알뜰폰(LG U+)</option>
				</select></td>
			</tr>
			<tr class="width100">	
				<td>
					<input type="number" id="ad_phone2" class="ad_phone2" name="ad_phone2" maxlength="11" placeholder="-없이 숫자만 입력" value="${ad_phone2}" oninput="uniqueChk('${path}', '#phoneUnique', '#ad_phone2')" required>
					<div class="red" id="phoneChk"><div class="font14">휴대폰번호를 정확하게 입력해 주세요.</div></div>
					<div id="phoneUnique"></div>
				</td>
			</tr>
			
			<!-- 이메일 @ 기준으로 나눠담기 -->
			<c:set var="email" value="${fn:split(dto.ad_email,'@')}" />
			<c:set var="ad_email1" value="${email[0]}" />
			<c:set var="ad_email2" value="${email[1]}" /> 
			
			<tr>
				<th class="font16">이메일</th>
			</tr>
			<tr>	
				<td>
				<input type="text" id="ad_email1" name="ad_email1" class="ad_email1" placeholder="이메일 입력" value="${ad_email1}" maxlength="15" oninput="uniqueChk('${path}', '#emailUnique', '#ad_email1')" required>
				<span class="emailIcon">@</span>
				<input type="text" id="ad_email2" name="ad_email2" class="ad_email2" placeholder="exam.com" value="${ad_email2}" maxlength="14" oninput="uniqueChk('${path}', '#emailUnique', '#ad_email2')" required>
				
				<select id="ad_email3" class="ad_email3" onchange="emailFn(); uniqueChk('${path}', '#emailUnique', '#ad_email3')">
					<option value="" >직접입력</option>
					<option value="naver.com" <c:if test="${ad_email2 == 'naver.com'}">selected</c:if> >네이버</option>
					<option value="google.com" <c:if test="${ad_email2 == 'google.com'}">selected</c:if> >구글</option>
					<option value="daum.com" <c:if test="${ad_email2 == 'daum.com'}">selected</c:if> >다음</option>
					<option value="nate.com" <c:if test="${ad_email2 == 'nate.com'}">selected</c:if> >네이트</option>
				</select>
					<div class="red" id="email1Str"><div class="font14">영소문자와 숫자로만 작성하세요.</div></div>
					<div class="red" id="email2Str"><div class="font14">이메일 양식을 지켜주세요.</div></div>
					<div id="emailUnique"></div>
				</td>
			</tr>
			
			<!-- 우편번호, 기본주소, 상세주소 순으로 나눠담기,  -->
			<c:set var="zip" value="${fn:split(dto.ad_zip, ',')}" />
			<c:set var="ad_zip1" value="${zip[0]}" />
			<c:set var="ad_zip2" value="${zip[1]}" />
			
			<tr>
				<th class="font16">주소</th>
			</tr>
			<tr>
				<td>												
					<input type="text" class="input" name="ad_zip1" id="ad_zip1" size="20" value="${ad_zip1}" placeholder="우편번호 입력" readonly >
					<input type="button" class="ad_ZIPBTN" id="ad_ZIPBTN" name="ad_ZIPBTN"  value="주소 검색">
				</td>
			</tr>
			<tr class="width100">
				<td><input type="text" class="input" name="ad_zip2" id="ad_zip2" size="20" value="${ad_zip2}" placeholder="도로명 주소 입력" readonly ></td>
			</tr>
			<!-- 상세주소는 필수가 아니라서 입력한 경우(값이 존재하는 경우)에만 삼항식으로 값을 설정한다. -->
			<tr class="width100">
				<td><input type="text" class="input" name="ad_zip3" id="ad_zip3" size="20" value="${zip[2] != null ? zip[2] : ''}" placeholder="상세 주소 입력" maxlength="30" ></td>
			</tr>
			
			<c:set var="ad_tel" value="${dto.ad_tel}" />
			
			<tr>
				<th class="font16">사내 전화번호</th>
			</tr>
			<tr class="width100">	
				<td>
					<select id="ad_tel" name="ad_tel" required>
						<option class="op1" value="">사내번호 선택</option>
						<option class="op2" value="02-111-2222" ${ad_tel == "02-111-2222" ? 'selected' : ''} >경영지원 (02-111-2222)</option>
						<option class="op3" value="02-333-4444" ${ad_tel == "02-333-4444" ? 'selected' : ''} >마케팅 (02-333-4444)</option>
						<option class="op4" value="02-555-6666" ${ad_tel == "02-555-6666" ? 'selected' : ''} >영업 (02-555-6666)</option>
						<option class="op5" value="02-888-9999" ${ad_tel == "02-888-9999" ? 'selected' : ''} >CS (02-888-9999)</option>
						<option class="op6" value="02-000-0000" ${ad_tel == "02-000-0000" ? 'selected' : ''} >IT (02-000-0000)</option>
					</select>
				</td>
			</tr>
			
			<c:set var="ad_empnum" value="${dto.ad_empnum}" />
			
			<tr>
				<th class="font16">사번</th>
			</tr>
			<tr class="width100">	
				<td>
					<input type="text" id="ad_empnum" name="ad_empnum" placeholder="사번 입력" value="${ad_empnum}" maxlength="13" oninput="uniqueChk('${path}', '#empnumlUnique', '#ad_empnum')" required>
					<div id="empnumlUnique"></div>
				</td>
				
			</tr>
			
			<c:set var="ad_dep" value="${dto.ad_dep}" />
			
			<tr>
				<th class="font16">부서 코드</th>
			</tr>
			<tr>	
				
				<td>
					<select name="ad_dep" id="ad_dep" required>
						<option class="op1" value="">부서 선택</option>
						<option class="op2" value="MG001" <c:if test="${ad_dep == 'MG001'}">selected</c:if> >경영지원</option>
						<option class="op3" value="MK002" <c:if test="${ad_dep == 'MK002'}">selected</c:if> >마케팅</option>
						<option class="op4" value="SL003" <c:if test="${ad_dep == 'SL003'}">selected</c:if> >영업</option>
						<option class="op5" value="CS004" <c:if test="${ad_dep == 'CS004'}">selected</c:if> >CS</option>
						<option class="op6" value="IT005" <c:if test="${ad_dep == 'IT005'}">selected</c:if> >IT</option>
					</select>
				</td>
			</tr>
			
			<tr id="termsTr">
				<th id="termsTh" class="font15"> ✓ 본인인증 약관동의</th>
			</tr>
			<tr>
				<td><input type="checkbox" id="allCheck" name="allChk" class="chkList" ${fn:contains(dto.ad_terms, '1 2 3 4') ? 'checked':'' } onclick="chkListClick($('#allCheck'))"><b class="font15">전체동의 합니다.</b></td>
			</tr>
			
			<tr >
				<td><input type="checkbox" class="chkList" id="chkList1" name="chkList1" value="1" ${fn:contains(dto.ad_terms, '1') ? 'checked':'' } onclick="chkListClick($('#chkList1'))" required><b class="font15"><span class="check">[필수]</span>
					<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal1">본인 확인 서비스 이용 약관</a>에 동의합니다.</b></td>
			</tr>
			<tr>
				<td><input type="checkbox" class="chkList" id="chkList2" name="chkList2" value="2" ${fn:contains(dto.ad_terms, '2') ? 'checked':'' } onclick="chkListClick($('#chkList2'))" required><b class="font15" ><span class="check">[필수]</span>
						<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal2">통신사 이용 약관</a>동의</b></td>
			</tr>
			<tr>
				<td><input type="checkbox" class="chkList" id="chkList3" name="chkList3" value="3"  ${fn:contains(dto.ad_terms, '3') ? 'checked':'' }><b class="font15"><span class="choose">[선택]</span> 통신사/인증사의 
						<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal3">개인정보 이용 · 제공</a>에 <br> <span id="left-10px">동의합니다.</span></b></td>
			</tr>
			<tr>
				<td><input type="checkbox" class="chkList" id="chkList4" name="chkList4" value="4" ${fn:contains(dto.ad_terms, '4') ? 'checked':'' } ><b class="font15"><span class="choose">[선택]</span> <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal4">고유식별 정보 처리</a>에 동의합니다.</b></td>
			</tr>
			
			<tr>
				<td>
					<input type="submit" class="submitBTN" value="관리자 등록">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="button" class="submitBTN" onclick="mainBTN('${path}')" value="가입 취소">
				</td>
			</tr>

		</table>
	</form>
	
</div>
</div>

<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	

<!-- 모달 약관 모음 -->
<%@ include file="/WEB-INF/views/admin/join/terms.jsp" %>

</body>
</html>