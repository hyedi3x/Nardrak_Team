<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 처리 동의</title>
    
    <!-- css -->
    <link rel="stylesheet" href="${path}/resources/css/customer/join/agree.css">
    
    <!-- join.js 주소 API  -->
<script src="${path}/resources/js/customer/agree.js" defer></script>
   
</head>
<body>
<!-- header_SessionScope.jsp : banner page & header page -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>

	<form name="agreeform" action="join.do" method="post" onsubmit="return validateForm()">
	    <div class="agree-container">
	        <h2>개인정보 처리 동의</h2>
	        <p> 저희 서비스 이용을 위해 아래의 개인정보 처리에 동의해주세요.</p>
	
	        <div class="agree-checkFinal">
	            <input type="checkbox" id="finalAgree" name="finalAgree" onclick="toggleAgreement(this);">
	            <label for="finalAgree">전체 동의합니다.</label>
	        </div>
	
	        <div class="agree-content">
	            <p>1. 수집하는 개인정보 항목</p>
	            <ul>
	                <li>아이디, 비밀번호, 이름, 이메일, 휴대폰 번호</li>
	                <li>생년월일, 성별 (선택)</li>
	                <li>서비스 이용과정에서 생성되는 정보: 접속 로그, 쿠키, 서비스 이용 기록, 결제 기록 등</li>
	            </ul>
	            <div class="agree-check">
	                <input type="checkbox" id="collectPersonalInfo" name="collectPersonalInfo" tabindex="0">
	                <label for="collectPersonalInfo">수집하는 개인정보 항목에 동의합니다.</label>
	            </div>
	
	            <p>2. 개인정보 이용 목적</p>
	            <ul>
	                <li>회원 가입 및 관리: 서비스 제공을 위한 아이디와 비밀번호 관리, 회원 인증</li>
	                <li>서비스 제공: 이용자의 서비스 제공을 위한 필요한 최소한의 정보 수집</li>
	                <li>맞춤형 마케팅: 서비스 개선 및 광고, 프로모션 제공을 위한 정보 활용</li>
	                <li>고객 상담 및 문의 처리: 고객의 요청에 따른 상담 및 서비스 제공을 위한 정보 사용</li>
	            </ul>
	            <div class="agree-check">
	                <input type="checkbox" id="usePersonalInfo" name="usePersonalInfo" tabindex="0">
	                <label for="usePersonalInfo">개인정보 이용 목적에 동의합니다.</label>
	            </div>
	
	            <p>3. 개인정보 보유 및 이용 기간</p>
	            <ul>
	                <li>회원 탈퇴 시까지 보유: 회원 가입 시 수집된 개인정보는 회원 탈퇴 시까지 보유됩니다.</li>
	                <li>법령에 의한 보존: 계약서, 청구서 등 상법, 전자상거래법 등에서 요구하는 경우에는 해당 법령에 따라 일정 기간 동안 보관됩니다.</li>
	                <li>보존 기간 후 파기: 보유기간이 끝나면 개인정보는 안전한 방법으로 파기됩니다.</li>
	            </ul>
	            <div class="agree-check">
	                <input type="checkbox" id="dataRetention" name="dataRetention" tabindex="0">
	                <label for="dataRetention">개인정보 보유 및 이용 기간에 동의합니다.</label>
	            </div>
	
	            <p>4. 개인정보의 제3자 제공</p>
	            <ul>
	                <li>서비스 제공에 필요한 경우, 제3자에게 개인정보를 제공할 수 있습니다.</li>
	                <li>제3자 제공 항목: 제공되는 정보는 이름, 이메일, 휴대폰 번호 등으로, 제휴사나 광고주에게 제공될 수 있습니다.</li>
	                <li>제공받는 자: 서비스 제공 관련된 외부 업체, 제휴사 등</li>
	                <li>제공 목적: 제휴사의 서비스 제공, 맞춤형 광고, 프로모션 등</li>
	            </ul>
	            <div class="agree-check">
	                <input type="checkbox" id="thirdParty" name="thirdParty" tabindex="0">
	                <label for="thirdParty">개인정보의 제3자 제공에 동의합니다.</label>
	            </div>
	
	            <p>5. 개인정보 보호 방법</p>
	            <ul>
	                <li>개인정보는 암호화하여 저장하며, 관리자의 접근을 제한하여 보호합니다.</li>
	                <li>웹사이트에서 제공하는 서비스는 개인정보 보호를 위해 SSL(암호화 통신) 프로토콜을 사용합니다.</li>
	                <li>회원의 개인정보는 외부에서 악용되지 않도록 엄격하게 관리됩니다.</li>
	            </ul>
	            <div class="agree-check">
	                <input type="checkbox" id="privacyProtection" name="privacyProtection" tabindex="0">
	                <label for="privacyProtection">개인정보 보호 방법에 동의합니다.</label>
	            </div>
	
	            <p>6. 개인정보 관련 권리와 행사 방법</p>
	            <ul>
	                <li>회원은 언제든지 본인의 개인정보를 조회하거나 수정할 수 있습니다.</li>
	                <li>개인정보 삭제 요청: 회원 탈퇴 시 개인정보를 삭제 요청할 수 있습니다. 단, 법적인 의무에 따라 일정 기간 보관될 수 있습니다.</li>
	                <li>개인정보 정정 및 삭제는 고객센터나 웹사이트 내 설정에서 가능합니다.</li>
	            </ul>
	            <div class="agree-check">
	                <input type="checkbox" id="userRights" name="userRights" tabindex="0">
	                <label for="userRights">개인정보 관련 권리 행사 방법에 동의합니다.</label>
	            </div>
	            
	              <!-- 마케팅 동의 (선택) 추가 -->
	            <p>7. 마케팅 및 광고 활용</p>
	            <ul>
	                <li>귀하의 개인정보를 이용하여 맞춤형 마케팅 및 광고 정보를 제공할 수 있습니다.</li>
	                <li>귀하의 동의에 따라 서비스 개선 및 프로모션을 위한 정보가 제공될 수 있습니다.</li>
	            </ul>
	            <div class="agree-check">
	                <input type="checkbox" id="marketingConsent" name="marketingConsent" tabindex="0">
	                <label for="marketingConsent">마케팅 및 광고 활용에 동의합니다. (선택)</label>
	            </div>
	            
	             <!-- hidden input으로 마케팅 동의 값 넘기기 -->
	        	<input type="hidden" id="marketingConsentHidden" name="marketingConsent" value="false">	
	        	
	        </div>
	
	        <button type="submit" class="agree-btn">동의하고 가입</button>
	    </div>
	</form>
<!-- footer page -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
</body>
</html>
