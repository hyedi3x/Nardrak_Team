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
   <!-- 주요 콘텐츠 영역 감싸는 컨테이너 역할 -->
   <!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>
	
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
				<a href="${path}/qnaResponse.do">1:1 문의 내역</a>
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
				
				<p class="txt_tbl_info">
					<span class="required">*</span> 는 필수 입력 정보입니다.
				</p>
				
				<form name="qnaForm" id="qnaForm" action="inquiryAction.do" method="post" onsubmit="return requestInCheck()" enctype="multipart/form-data">
					<table class="tbl_basic">
							<tr>
								<th>
									<label for="i_title">
										<span class="required">*</span>문의 제목
									</label>
								</th>
								<td>
									<input type="text" name="i_title" id="i_title" placeholder="제목을 입력하세요">
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="cs_name">
										<span class="required">*</span>이름
									</label>
								</th>
								<td>
									<input type="text" name="cs_name" id="cs_name" value="${dtoCS.cs_name}" readonly>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="cs_phone">
										<span class="required">*</span>휴대폰 번호
									</label>
								</th>
								<td>
									<input type="text" name="cs_phone" id="cs_phone" value="${dtoCS.cs_phone}" readonly>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="i_category">
										<span class="required">*</span>문의 유형
									</label>
								</th>
								
								<td>
									<div id="selectData">
										<select title="문의 유형 선택" name="i_category1" id="i_category1">
											<option value="">선택하세요</option>
											<option value="A">국내여행</option>
										</select>
									
										<select title="지역 선택" name="i_category2" id="i_category2">
											<option value="">선택하세요</option>
											<option value="00">전국</option>
											<option value="11">서울특별시</option>
											<option value="21">부산광역시</option>
											<option value="22">대구광역시</option>
											<option value="23">인천광역시</option>
											<option value="24">광주광역시</option>
											<option value="25">대전광역시</option>
											<option value="26">울산광역시</option>
											<option value="29">세종특별자치시</option>
											<option value="31">경기도</option>
											<option value="32">강원도</option>
											<option value="33">충청북도</option>
											<option value="34">충청남도</option>
											<option value="35">전라북도</option>
											<option value="36">전라남도</option>
											<option value="37">경상북도</option>
											<option value="38">경상남도</option>
											<option value="39">제주특별자치도</option>
										</select>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="cs_email">
										<span class="required">*</span>이메일
									</label>
								</th>
								<td>
									<input type="text" name="user_email" id="user_email" value="${dtoCS.cs_email}" readonly>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="i_content">
										<span class="required">*</span>문의 내용
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
									<input type="file" name="i_imgUpload" id="i_imgUpload" placeholder="파일 첨부" accept="image/*">
								</td>
							</tr>
					</table>
					
				
				<ul class="tbl_info_list">
					<li>이름과 휴대폰 번호, 이메일은 수정하실 수 없습니다.</li>
					<li>수정하고 싶다면, <a href="/nardrak_mvc/myInfo.do" class="btn_go_page">마이페이지</a>에서 수정하실 수 있습니다.</li>
					<li>주민번호나 여권번호 등 개인정보는 작성에 유의하시기 바랍니다.</li>
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
	<!-- footer end -->
</body>
</html>