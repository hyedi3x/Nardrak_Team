<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>main</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customer/join.css">

<!-- join.js 주소 API  -->
<script src="${path}/resources/js/customer/join.js" defer></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/customer/daumAPI.js" defer></script>

<!-- java script(js)  -->
<script src="https://kit.fontawesome.com/28c04e153c.js" crossorigin="anonymous"></script>
<!-- (3-3-2) 햄버거(메뉴)버튼 자바스크립트 소스 연결  -->
<!-- defer : html을 다읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/common/main.js" defer></script>

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
										<th> * 아이디 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="text" class="input" name="user_id" size="30" placeholder="공백없이 20자 이내로 작성해라" required autofocus> 
											<input type="button" name="dubChk" value="중복확인" style="margin-left:10px" onclick="confirmId()">										
										</td>
									</tr>
									
									<tr>
										<th> * 비밀번호 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="password" class="input" name="user_pwd" size="20" placeholder="공백없이 20자 이내로 작성해라" required > 
									</tr>
									
									<tr>
										<th> * 비밀번호(확인) </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="password" class="input" name="re_pwd" size="20" placeholder="비밀번호 확인필요하다" required > 
									</tr>
									
									<tr>
										<th> * 이름 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="text" class="input" name="user_name" size="50" placeholder="이름 작성해줘라" required > 
									</tr>			
									
									<tr>
						                <th> * 성별 </th>
						                <td>
						                    <label>
						                        <input type="radio" name="user_gender" value="male" required> 남성
						                    </label>
						                    <label>
						                        <input type="radio" name="user_gender" value="female" required> 여성
						                    </label>
						                </td>
						            </tr>
								
									<tr>
										<th> * 생년월일 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="Date" class="input" name="user_birthday" size="8" placeholder="생년월일 작성해줘라" required > 
									</tr>	
	
									<tr>
										<th> 전화번호 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="text" class="input" name="user_hp1" size="3" style="wdith:50px">
											-
											<input type="text" class="input" name="user_hp2" size="4" style="wdith:70px">
											-
											<input type="text" class="input" name="user_hp3" size="4" style="wdith:70px"> 
										</td>
									</tr>	
									
									<tr>
										<th> * 주소 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="text" id="sample4_postcode" placeholder="우편번호">
											<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="sample4_roadAddress" name="road" placeholder="도로명주소" required>
											<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" id="sample4_detailAddress" name="detail" placeholder="상세주소">
											<input type="text" id="sample4_extraAddress" placeholder="참고항목">
										</td>
									</tr>
									
									<tr>
										<th> * 이메일 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="text" class="input" name="user_email1" size="50" style="wdith:50px" required>
											@
											<input type="text" class="input" name="user_email2" size="50" style="wdith:50px" required >
											
											<select class="input" name="user_email3" style="wdith:100px" onchange="selectEmailChk()">
												<option value="0"> 직접 입력해주세요 </option>
												<option value="naver.com"> naver.com </option>
												<option value="gmail.com"> gmail.com </option>
												<option value="daum.co.kr"> daum.co.kr </option>
												<option value="nate.com"> nate.com </option>
											</select>
										</td>
									</tr>		
									
									<tr>
										<th> 지역 전화번호 </th> <!-- *붙이면 필수항목 -->
										<td>
											<input type="text" class="input" name="user_hpp1" size="3" style="wdith:50px">
											-
											<input type="text" class="input" name="user_hpp2" size="4" style="wdith:70px">
											--
											<input type="text" class="input" name="user_hpp3" size="4" style="wdith:70px"> 
										</td>
									</tr>
									
									 <!-- 개인정보 수집 동의 -->
				          <!--        <div class="user1">
					                  <h3 class="list">개인정보 수집/이용동의<span id="consentError"></span></h3>
					                  <div id="informationConsent">
					                  <span id="consentBox">
					                      <h3>개인정보 처리방침<span id="consentError"></span></h3>
					                      세부내용 중략
					                  </span>
						               </div>
						               <label class="select"><input type="radio" id="check" name="check" value="동의">동의</label>
						               <label class="select"><input type="radio" id="noneCheck"name="check" value="비동의" checked="checked">비동의</label>
						               </div>
						              -->
									<tr>
										<td colspan="2" style="border-bottom:none">
										<br>
											<div align="center">
												<input class="inputButton" type="submit" value="회원가입" > 
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