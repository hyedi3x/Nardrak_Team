<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>

    <!-- css -->
    <link rel="stylesheet" href="${path}/resources/css/customer/join/join.css">

    <!-- join.js 주소 API -->
    <script src="${path}/resources/js/customer/join.js" defer></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${path}/resources/js/customer/daumAPI.js" defer></script>
</head>
<body>
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>

	<div id="joinContainer">
		<h2 align="center">회원가입</h2>
	    <form name="inputform" action="joinAction.do" method="post" onsubmit="return signlnCheck()">
	        
	        <!-- 2-1 중복확인 -->
	        <input type="hidden" name="hiddenUserId" value="0">
	        <input type="hidden" id="marketingConsentHidden" name="marketingConsentHidden" value="no">
	        ${marketingConsent}
	        
	        <table>
	            <tr>
	                <th> 아이디 <span class="requiredAll">*</span></th> 
	                <td>
	                    <input type="text" id="inputId" name="cs_id" maxlength="10" placeholder="영문, 숫자  4~10자 이내로 작성" oninput="checkId(this.value)" required autofocus> 
	                    <input type="button" id="inputIdConfirm" value="중복확인" onclick="confirmId('${path}')">
	                    <div id="idChk"></div>
	                </td>
	            </tr>
	            
	            <tr>
	                <th> 비밀번호 <span class="requiredAll">*</span></th>
	                <td class="pwd_class">
	                    <div>
	                        <input type="password" class="input" name="cs_pwd" id="cs_pwd" maxlength="16" placeholder="영문,특수문자 포함 8자 이상" required oninput="checkPasswordStrength(this.value)">
	                        <i id="togglePassword" class="fa fa-eye-slash" onclick="passwordOne()"></i>
	                    </div>
	                    <span id="pwdStrength"></span><span id="pwdChk"></span>
	                </td>
	            </tr>
	
	            <tr>
	                <th> 비밀번호 확인 <span class="requiredAll">*</span></th>
	                <td>
	                    <input type="password" class="input" name="re_cs_pwd" id="re_cs_pwd" maxlength="16" placeholder="비밀번호 재확인필요" required oninput="checkPasswordMatch(this.value)">
	                    <span id="pwdReChk"></span>
	                </td>
	            </tr>
	            
	            <tr>
	                <th> 이름 <span class="requiredAll">*</span></th>
	                <td>
	                    <input type="text" class="input" name="cs_name" maxlength="15" placeholder="이름 작성" required>

	                </td>
	            </tr>        
	            
	            <tr>
	                <th> 성별 <span class="requiredAll">*</span></th>
	                <td>
	                    <label class="radio14">
	                        <input type="radio" name="cs_gender" value="male" required> 남성
	                    </label>
	                    <label class="radio14">
	                        <input type="radio" name="cs_gender" value="female" required> 여성
	                    </label>
	                </td>
	            </tr>
	            
	            <tr>
	                <th> 생년월일 <span class="requiredAll">*</span></th>
	                <td>
	                    <input type="Date" id="cs_birth" class="input" name="cs_birth" style="width:350px" required oninput="checkAge()">
	                    <br>
	                    <p style="color:#729ea1; font-size:12px;">14세 미만은 가입이 불가합니다.</p>
	                    <div class="red hide" id="birthChk" style="display:none">
	                        <div class="font14" style="color:red;">생년월일을 올바르게 입력해주세요.</div>
	                    </div>
	                </td>
	            </tr>    
	
	            <tr>
	                <th> 전화번호 <span class="requiredAll">*</span></th>
	                <td>
	                    <select class="input2" name="user_hp1">
	                        <option value="0"> 선택 </option>
	                        <option value="010"> 010 </option>
	                        <option value="011"> 011 </option>
	                        <option value="018"> 018 </option>
	                        <option value="016"> 016 </option>
	                    </select>
	                    <span class="em">-</span>
	                    <input type="text" class="input2" name="user_hp2" maxlength="4">
	                    <span class="em">-</span>
	                    <input type="text" class="input2" name="user_hp3" maxlength="4"> 
	                </td>
	            </tr>
	
	            <tr>
	                <th> 지역 전화번호 </th> 
	                <td>
	                    <select class="input2" name="user_local1">
							<option value=""> 지역번호</option>
							<option value="02"> 02(서울) </option>
							<option value="031"> 031(경기) </option>
							<option value="032"> 032(인천) </option>
							<option value="033"> 033(강원) </option>
							<option value="041"> 041(충남) </option>
							<option value="042"> 042(대전) </option>
							<option value="043"> 043(충북) </option>
							<option value="051"> 051(부산) </option>
							<option value="052"> 052(울산) </option>
							<option value="053"> 053(대구) </option>
							<option value="054"> 054(경북) </option>
							<option value="055"> 055(경남) </option>
							<option value="061"> 061(전남) </option>
							<option value="062"> 062(광주) </option>
							<option value="063"> 063(전북) </option>
							<option value="064"> 064(제주) </option>
	                    </select>
	                    <span class="em">-</span>
	                    <input type="text" class="input2" name="user_local2" maxlength="4">
	                    <span class="em">-</span>
	                    <input type="text" class="input2" name="user_local3" maxlength="4"> 
	                    <br>
	                    <div class="red hide" id="localPhoneChk" style="display:none">
	                        <div class="font14" style="color:red;">지역 전화번호를 올바르게 입력해주세요.</div>
	                    </div>
	                </td>
	            </tr>    
	
	            <tr>
	                <th> 주소 <span class="requiredAll">*</span></th> 
	                <td>
	                    <input type="text" id="sample4_postcode" style="width:219px" name="postcode" placeholder="우편번호">
	                    <input type="button" id="zip" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	                    <input type="text" id="sample4_roadAddress" class="input" name="road" placeholder="도로명주소" required>
	                    <input type="text" id="sample4_jibunAddress" class="input" name="jibun"  placeholder="지번주소">
	                    <input type="text" id="sample4_detailAddress" class="input3" name="detail" placeholder="상세주소">
	                    <input type="text" id="sample4_extraAddress" class="input3" name="extra" placeholder="참고항목">
	                </td>
	            </tr>
	
	            <tr>
	                <th> 이메일 <span class="requiredAll">*</span></th>
	                <td>
	                    <input type="text" class="input2" name="user_email1" maxlength="20"required>
	                    <span class="em">@</span>
	                    <input type="text" class="input2" name="user_email2" required>
	                    <select class="input2" name="user_email3" onchange="selectEmailChk()">
	                        <option value=""> 직접 입력</option>
	                        <option value="naver.com"> naver.com </option>
	                        <option value="gmail.com"> gmail.com </option>
	                        <option value="daum.co.kr"> daum.co.kr </option>
	                        <option value="nate.com"> nate.com </option>
	                    </select>
	                </td>
	            </tr>  
	
	            <!-- 회원가입 버튼 -->
	            <tr>
	                <td colspan="2" style="border-bottom:none">
                        <input class="inputButton" type="submit" value="회원가입"> 
                        <input class="inputButton" type="reset" value="가입취소" onclick="window.location='${path}/main.do'"> 
	                </td>
	            </tr>
	        </table>
	    </form>
	</div>
	 <!-- footer page -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>       
</body>
</html>
