<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!-- include 필수!! 하지않으면 CSS나 JS 반영안됨 주의★ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ID 중복확인 </title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/customer/join/join.css">

<!-- join.js  -->
<script src="${path}/resources/js/customer/join.js" defer></script>

</head>
<body>
	<div class="wrap">
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id ="section1">
					<h3 align="center"> ID 중복확인 </h3>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id ="section2">
					<div id="s2_inner">
						<div class="join">
						
							<form name="confirmform" action="idConfirmAction.do" method="post">
								
								
								<!-- id가 중복일 떄, id를 입력받아 다시 중복체크 -->
								
								<c:if test="${inConfirmCnt == 1}">
								

									<table align="center" width="500px">
										<tr>
											<th colspan="2" align="center">
														<!-- ${cs_id} 변경 (EL태그)  -->
												<span> ${cs_id}는 사용할 수 없습니다.</span> 
												<!-- 표현식으로 적용 -->
											</th> <!-- *붙이면 필수항목 -->		
										</tr>
											
										
										<tr>
											<th align="center"> * 아이디 </th> <!-- *붙이면 필수항목 -->
											<td>
												<input type="text" class="input" name="cs_id" size="30" placeholder="공백없이 20자 이내로 작성해라" required autofocus> 
											</td>
										</tr>
							
							
										<tr>
											<td colspan="2" style="border-bottom:none">
												<br>
												<div align="center">
													<input class="inputButton" type="submit" value="확인" > 
													<input class="inputButton" type="reset" value="초기화" > 
												</div>
											</td>
										</tr>	
									</table>
								</c:if>				

							
								<!-- id가 중복이 아닐 떄 -->
								<c:if test="${inConfirmCnt != 1}">
				
								<table align="center" width="500px">
										<tr>
											<th colspan="2" align="center">
												<span>${cs_id} 는 사용할 수 있습니다.</span> 
												<!-- 표현식으로 적용 -->
											</th> <!-- *붙이면 필수항목 -->		
										</tr>

										<tr>
											<td colspan="2" style="border-bottom:none">
												<br>
												<div align="center">
													<input class="inputButton" type="button" value="확인" onclick="setUserid('${cs_id}')"> 	
																														<!-- 싱글로 감싸야함 -->										
												</div>
											</td>
										</tr>	
									</table>	
								</c:if>
						
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>							
</body>	
</html>