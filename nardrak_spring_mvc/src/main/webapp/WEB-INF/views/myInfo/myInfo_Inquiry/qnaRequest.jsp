<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>1:1 문의하기</title>

<!-- css -->
<link href="${path}/resources/css/myInfo/myInfo_Inquiry/qnaRequest.css" rel="stylesheet">
<link href="${path}/resources/css/myInfo/myInfo_left.css" rel="stylesheet">

<!-- js -->
<script src="${path}/resources/js/myInfo/qnaRequest.js" defer></script>

</head>
<body>
    <!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>
	
	<!-- 주요 콘텐츠 영역 감싸는 컨테이너 역할 -->
	<div id="wrap"> 
		<div id="container">
			<ul id="page_nav">
				<li>
					<a href="${path}/main.do">홈</a> >
				</li>
				<li>
					<a href="${path}/myInfo.do">마이페이지</a> >
				</li>
				<li>
					<a href="${path}/qnaResponse.do">1:1 문의</a>
				</li>
			</ul>
	      
			<div id="content"> <!-- 메뉴바 + 본문 내용 들어갈 박스 -->
				<!-- 왼쪽 메뉴바 -->
				<div id="myInfo_left">
					<%@ include file="/WEB-INF/views/myInfo/leftMenuTab/toggle_left.jsp" %>
				</div>
	         
				<!-- 본문 -->
				<div id="contentRight">
		        	<h1>1:1 문의</h1>

				
					<p class="txt_tb_info">
						<span class="required">*</span> 는 필수 입력 정보입니다.
					</p>
				
					<form name="qnaForm" id="qnaForm" action="inquiryResult.do" method="post" onsubmit="return requestInCheck()" enctype="multipart/form-data">
						<table class="tb_basic">
							<tr>
								<th>
									<label for="i_title">
										문의 제목 <span class="required">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="i_title" id="i_title" placeholder="제목을 입력하세요">
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="cs_name">
										이름 <span class="required">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="cs_name" id="cs_name" value="${dtoCS.cs_name}" readonly>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="cs_phone">
										휴대폰 번호 <span class="required">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="cs_phone" id="cs_phone" value="${dtoCS.cs_phone}" readonly>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="i_category">
										문의 유형 <span class="required">*</span>
									</label>
								</th>
								
								<td>
									<div id="selectData">
										<select title="문의 유형 선택" name="i_category1" id="i_category1">
											<option value="">선택하세요</option>
											<option value="국내여행">국내여행</option>
										</select>
									
										<select title="지역 선택" name="i_category2" id="i_category2">
											<option value="">선택하세요</option>
											<option value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="강원">강원</option>
											<option value="충청">충청</option>
											<option value="경상">경상</option>
											<option value="전라">전라</option>
											<option value="제주">제주</option>
										</select>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="cs_email">
										이메일 <span class="required">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="user_email" id="user_email" value="${dtoCS.cs_email}" readonly>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="i_content">
										문의 내용 <span class="required">*</span>
									</label>
								</th>
								<td>
									<div class="tbl_line">
										<textarea name="i_content" id="i_content" placeholder="내용을 입력하세요."></textarea>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="i_imgUpload">파일 첨부</label>
								</th>
								<td>
									<!-- accept="image/*" : 모든 이미지 파일 (PNG, JPG, GIF 등) -->
									<input type="file" name="i_imgUpload" id="i_imgUpload" placeholder="파일 첨부" accept="image/*">
								</td>
							</tr>
						</table>
						
						<!-- 사용자 정보 수정사항 권고 -->
						<ul class="tb_info_list">
							<li>※ 이름과 휴대폰 번호, 이메일은 수정하실 수 없습니다.</li>
							<li>※ 수정하고 싶다면, <a href="/nardrak_mvc/myInfo.do" class="btn_go_page">마이페이지</a>에서 수정하실 수 있습니다.</li>
							<li>※ 주민번호나 여권번호 등 개인정보는 작성에 유의하시기 바랍니다.</li>
						</ul>
						<!-- 버튼 -->
						<div class="btn_area">
							<input type="submit" id="req_button" class="req_button" value="문의하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- footer start -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
</body>
</html>