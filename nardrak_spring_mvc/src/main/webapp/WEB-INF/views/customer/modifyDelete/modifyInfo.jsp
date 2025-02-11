<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원정보 수정 페이지</title>

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
		<h2 align="center">회원정보 수정 페이지</h2>
	    <form name="inputform" action="modifyCustomerAction.do" method="post" onsubmit="return signlnCheck()">
	        
	        <!-- 2-1 중복확인 -->
	        <input type="hidden" name="hiddenUserId" value="0">
	        
	        <c:if test="${selectCnt == 1}">
	        <table>
	            <tr>
	                <th> 아이디 <span class="requiredAll">*</span></th> 
	                <td>
	                    ${dto.cs_id}
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
	                    <input type="text" class="input" name="cs_name" maxlength="15" value="${dto.cs_name}" placeholder="이름 작성" required>

	                </td>
	            </tr>        
	            
	            <tr>
	                <th> 성별 <span class="requiredAll">*</span></th>
	                <td>
	                    <label class="radio14">
	                        <input type="radio" name="cs_gender" value="male" value="male" ${dto.cs_gender eq 'male' ? 'checked' : ''} required> 남성
	                    </label>
	                    <label class="radio14">
	                        <input type="radio" name="cs_gender" value="female" value="female" ${dto.cs_gender eq 'female' ? 'checked' : ''} required> 여성
	                    </label>
	                </td>
	            </tr>
	            
	            <tr>
	                <th> 생년월일 <span class="requiredAll">*</span></th>
	                <td>
	                    <input type="Date" id="cs_birth" class="input" name="cs_birth" style="width:350px" value="${dto.cs_birth}" required>
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
	                <c:set var="hpArr" value="${fn:split(dto.cs_phone,'-')}"/>
						<select class="input2" name="user_hp1" style="width:80px" onchange="uniqueCheck('${path}', 'phone')">
							<option value="0"> 선택해주세요 </option>
							<option value="010" ${hpArr[0] eq '010' ? 'selected' : ''}> 010 </option>
							<option value="011" ${hpArr[0] eq '011' ? 'selected' : ''}> 011 </option>
							<option value="018" ${hpArr[0] eq '018' ? 'selected' : ''}> 018 </option>
							<option value="016" ${hpArr[0] eq '016' ? 'selected' : ''}> 016 </option>
						</select>
	                
	                    
	                    <span class="em">-</span>
	                    <input type="text" class="input2" name="user_hp2" maxlength="4" value="${hpArr[1]}" style="width:80px" required oninput="uniqueCheck('${path}', 'phone')">
	                    <span class="em">-</span>
	                    <input type="text" class="input2" name="user_hp3" maxlength="4" value="${hpArr[2]}" style="width:80px" required oninput="uniqueCheck('${path}', 'phone')"> 
	                    
	               		 <div class="red hide" id="phoneChk" style="display:none">
	                        <div class="font14" style="color:red;"></div>
	                    </div>
	                </td>
	            </tr>
	
	            <tr>
	                <th> 지역 전화번호 </th> 
	                <td>
	                <c:if test="${dto.cs_tel == null}">
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
	                    <input type = "text" class="input2" name="user_local2" maxlength="4">
	                    <span class="em">-</span>
	                    <input type = "text" class="input2" name="user_local3" maxlength="4">
	                  </c:if>
	                 
	                 <c:if test="${dto.cs_tel != null}">
						<c:set var="telArr" value="${fn:split(dto.cs_tel,'-')}"/>
							<select class="input2" name="user_local1">
								<option value="0"> 선택해주세요 </option>
								<option value="02" ${telArr[0] eq '02(서울)' ? 'selected' : ''}> 02 </option>
								<option value="031" ${telArr[0] eq '031(경기)' ? 'selected' : ''}> 031 </option>
								<option value="032" ${telArr[0] eq '032(인천)' ? 'selected' : ''}> 032 </option>
								<option value="033" ${telArr[0] eq '033(강원)' ? 'selected' : ''}> 033 </option>
								<option value="041" ${telArr[0] eq '041(충남)' ? 'selected' : ''}> 041 </option>
								<option value="042" ${telArr[0] eq '042(대전)' ? 'selected' : ''}> 042 </option>
								<option value="043" ${telArr[0] eq '043(충북)' ? 'selected' : ''}> 043 </option>
								<option value="051" ${telArr[0] eq '051(부산)' ? 'selected' : ''}> 051 </option>
								<option value="052" ${telArr[0] eq '052(울산)' ? 'selected' : ''}> 052 </option>
								<option value="053" ${telArr[0] eq '053(대구)' ? 'selected' : ''}> 053 </option>
								<option value="054" ${telArr[0] eq '054(경북)' ? 'selected' : ''}> 054 </option>
								<option value="055" ${telArr[0] eq '055(경남)' ? 'selected' : ''}> 055 </option>
								<option value="061" ${telArr[0] eq '061(전남)' ? 'selected' : ''}> 061 </option>
								<option value="062" ${telArr[0] eq '062(광주)' ? 'selected' : ''}> 062 </option>
								<option value="063" ${telArr[0] eq '063(전북)' ? 'selected' : ''}> 063 </option>
								<option value="064" ${telArr[0] eq '064(제주)' ? 'selected' : ''}> 064 </option>
							</select>
							<span class="em">-</span>
	                    <input type = "text" class="input2" name="user_local2" value="${telArr[1]}" maxlength="4">
	                    <span class="em">-</span>
	                    <input type = "text" class="input2" name="user_local3" value="${telArr[2]}" maxlength="4">
	                  </c:if>
	                    <br>
	                    <div class="red hide" id="localPhoneChk" style="display:none">
	                        <div class="font14" style="color:red;">지역 전화번호를 올바르게 입력해주세요.</div>
	                    </div>
	                </td>
	            </tr>    
	
	            <tr>
	                <th> 주소 <span class="requiredAll">*</span></th> 
	                <td>
		                <c:set var="addressArr" value="${fn:split(dto.cs_zip, ',')}"/>
						<input type="button" id="sample4_postcode" style="width:219px" name="postcode" placeholder="우편번호" required value="${addressArr[0]}">
						<input type="button" id="zip" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" class="input" name="road" placeholder="도로명주소" required value="${addressArr[1]}">
						<input type="text" id="sample4_jibunAddress" class="input" name="jibun" placeholder="지번주소" value="${addressArr[2]}">
						<input type="text" id="sample4_detailAddress" class="input3" name="detail" placeholder="상세주소" required value="${addressArr[3]}">
						<input type="text" id="sample4_extraAddress" class="input3" name="extra" placeholder="참고항목" value="${addressArr[4]}">
	                </td>
	            </tr>
	
	            <tr>
	                <th> 이메일 <span class="requiredAll">*</span></th>
	                <td>
	                <c:set var="emailArr" value="${fn:split(dto.cs_email,'@')}"/>
						<input type="text" class="input2" name="user_email1" value="${emailArr[0]}" maxlength="20" oninput="uniqueCheck('${path}', 'email');" required>
						<span class="em">@</span>
						<input type="text" class="input2" name="user_email2" value="${emailArr[1]}" maxlength="20" oninput="checkCustomEmail(); uniqueCheck('${path}', 'email');" required>
						
						<select class="input2" name="user_email3" onchange="selectEmailChk(); uniqueCheck('${path}', 'email');">
							<option value=""> 직접 입력해주세요 </option>
							<option value="naver.com" ${emailArr[1] eq 'naver.com' ? 'selected' : ''}> naver.com </option>
							<option value="gmail.com" ${emailArr[1] eq 'gmail.com' ? 'selected' : ''}> gmail.com </option>
							<option value="kakao.com" ${emailArr[1] eq 'kakao.com' ? 'selected' : ''}> kakao.com </option>
							<option value="nate.com" ${emailArr[1] eq 'nate.com' ? 'selected' : ''}> nate.com </option>
						</select>

	                    <div class="red hide" id="emailChk" style="display:none">
	                        <div class="font14" style="color:red;"></div>
	                    </div>
	                </td>
	            </tr>  
	
	            <!-- 회원가입 버튼 -->
	            <tr>
	                <td colspan="2" style="border-bottom:none">
                        <input class="inputButton" type="submit" value="회원수정"> 
                        <input class="inputButton" type="reset" value="돌아가기" onclick="window.location='${path}/main.do'"> 
	                </td>
	            </tr>
	        </table>
	        </c:if>
	        
	        <c:if test="${selectCnt != 1}">
			<script type="text/javascript">
				alert("비밀번호 불일치. 인증실패!")
				window.location="${path}/modifyCustomer.do"
			</script>
			</c:if>
	        
	    </form>
	</div>
	 <!-- footer page -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>       
</body>
</html>
