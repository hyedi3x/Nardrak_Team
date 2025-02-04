<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title> 회원가입 p </title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customer/join/join.css">

<!-- join.js 주소 API  -->
<script src="${path}/resources/js/customer/join.js" defer></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/customer/daumAPI.js" defer></script>


</head>
<body>
	<div class="wrap">

		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id ="section1">
					<h3 align="center"> 회원가입 </h3>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id ="section2">
					<div id="s2_inner">
						<div class="join">
						
							<form name="inputform" action="joinAction.do" method="post"
								onsubmit="return signlnCheck()">
								
								<!-- 2-1 중복확인 -->
								<input type="hidden" name="hiddenUserId" value="0">
							
								
								<table>
									<tr>
									    <th> * 아이디 </th>	<!-- *붙이면 필수항목 -->
									    <td>
									        <input type="text" style="width:250px" class="input" name="cs_id" size="30" placeholder="공백없이 20자 이내로 작성" required autofocus> 
									        <input type="button" style="margin-left:10px" value="중복확인" onclick="confirmId('${path}')">
									        <br>
									        <div class="red hide" id="idChk" style="display:none">
									            <div class="font14" style="color:red;">아이디는 10자 이내로 입력해주세요.</div>
									        </div>
									    </td>
									</tr>
									
									<tr>
									    <th> * 비밀번호 </th>
									    <td>
									        <div style="position: relative;">
									            <input type="password" style="width:250px" class="input" name="cs_pwd" id="cs_pwd" size="20" placeholder="영문,특수문자 포함 8자 이상" required oninput="checkPasswordStrength(this.value)">
									            <i id="togglePassword" class="fa fa-eye" style="position: absolute; left: 220px; top: 50%; transform: translateY(-50%); cursor: pointer;" onclick="PasswordOne()"></i>
									        </div>
									        <br>
									        <div id="pwdStrength" style="display:none; margin-top: 5px;"></div> <!-- 강도 메시지 표시 -->
									        <div class="strongPassword-message hide" id="pwdChk" style="display:none">
									            <div class="font14" style="color:red;">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요.</div>
									        </div>
									    </td>
									</tr>

									<tr>
									    
									<th> * 비밀번호 확인 </th>
									    <td>
									        <input type="password" style="width:250px" class="input" name="re_cs_pwd" id="re_cs_pwd" size="20" placeholder="비밀번호 재확인필요" required oninput="checkPasswordMatch()">
									        <br>
									        <!-- 비밀번호 일치 확인 메시지 표시 -->
									        <div id="pwdMatchMessage" style="display:none; margin-top: 5px; color: red;"></div>
									    </td>
									</tr>
									
									<tr>
									    <th> * 이름 </th>
									    <td>
									        <input type="text" style="width:250px" class="input" name="cs_name" size="50" placeholder="이름 작성" required>
									        <br>
									        <div class="red hide" id="nameChk" style="display:none">
									            <div class="font14" style="color:red;">이름을 올바르게 입력해주세요.</div>
									        </div>
									    </td>
									</tr>		
									
									<tr>
						                <th> * 성별 </th>
						                <td>
						                    <label>
						                        <input type="radio" name="cs_gender" value="male" required> 남성
						                    </label>
						                    <label>
						                        <input type="radio" name="cs_gender" value="female" required> 여성
						                    </label>
						                </td>
						            </tr>
								
									<tr>
										<th> * 생년월일 </th>
										<td>
											<input type="Date" id="cs_birth" class="input" name="cs_birth" style="width:250px" required oninput="checkAge()">
											<br>
											<p style="color:#729ea1; font-size:12px;">14세 미만은 가입이 불가합니다.</p>
									        <div class="red hide" id="birthChk" style="display:none">
									            <div class="font14" style="color:red;">생년월일을 올바르게 입력해주세요.</div>
									        </div>
										</td>
									</tr>	
		
									<tr>
										<th> * 전화번호 </th>
										<td>
											<select class="input" name="user_hp1" style="width:80px">
												<option value="0"> 선택해주세요 </option>
												<option value="010"> 010 </option>
												<option value="011"> 011 </option>
												<option value="018"> 018 </option>
												<option value="016"> 016 </option>
											</select>
											-
											<input type="text" class="input" name="user_hp2" size="4" style="width:80px">
											-
											<input type="text" class="input" name="user_hp3" size="4" style="width:80px"> 
											<br>
											<div class="red hide" id="phoneChk" style="display:none">
							           			<div class="font14" style="color:red;">전화번호를 올바르게 입력해주세요.</div>
							       		 	</div>
							        	</td>
									</tr>
									
									
									<tr>
										<th> 지역 전화번호 </th> 
										<td>
											<select class="input" name="user_local1" style="width:80px">
												<option value="0"> 선택해주세요 </option>
												<option value="02"> 02 </option>
												<option value="031"> 031 </option>
												<option value="032"> 032 </option>
												<option value="033"> 033 </option>
												<option value="041"> 041 </option>
												<option value="042"> 042 </option>
												<option value="043"> 043 </option>
												<option value="051"> 051 </option>
												<option value="052"> 052 </option>
												<option value="053"> 053 </option>
												<option value="061"> 061 </option>
												<option value="062"> 062 </option>
												<option value="063"> 063 </option>
											</select>
											-
											<input type="text" class="input" name="user_local2" size="4" style="wdith:70px">
											-
											<input type="text" class="input" name="user_local3" size="4" style="wdith:70px"> 
											<br>
											<div class="red hide" id="localPhoneChk" style="display:none">
								            	<div class="font14" style="color:red;">지역 전화번호를 올바르게 입력해주세요.</div>
								        	</div>
										</td>
									</tr>	
									
									<tr>
										<th> * 주소 </th> 
										<td>
											<input type="text" id="sample4_postcode" style="width:150x" name="postcode" placeholder="우편번호">
											<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="sample4_roadAddress" style="width:300px" name="road" placeholder="도로명주소" required>
											<input type="text" id="sample4_jibunAddress" style="width:300px" name="jibun"  placeholder="지번주소">
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" id="sample4_detailAddress" style="width:200px" name="detail" placeholder="상세주소">
											<input type="text" id="sample4_extraAddress" style="width:200px" name="extra" placeholder="참고항목">
											<br>
									        <div class="red hide" id="addressChk" style="display:none">
									            <div class="font14" style="color:red;">주소를 올바르게 입력해주세요.</div>
									        </div>
										</td>
									</tr>
									
									<tr>
										<th> * 이메일 </th>
									    <td>
									        <input type="text" class="input" name="user_email1" size="50" style="width:150px" required>
									        @
									        <input type="text" class="input" name="user_email2" size="50" style="width:150px" required>
									        <br>
									        <div class="red hide" id="emailChk" style="display:none">
									            <div class="font14" style="color:red;">올바른 이메일 형식으로 입력해주세요.</div>
									        </div>
									        <select class="input" name="user_email3" style="width:150px" onchange="selectEmailChk()">
									            <option value="0"> 직접 입력해주세요 </option>
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
										<br>
											<div align="center">
												<input class="inputButton" type="submit" value="회원가입"> 
												<input class="inputButton" type="reset" value="초기화" > 
												<input class="inputButton" type="button" value="가입취소" onclick="window.location='${path}/main.do'"> 
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>