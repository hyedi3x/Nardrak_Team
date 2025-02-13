<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 약관 페이지</title>
<!-- CSS -->
<link rel="stylesheet" href="${path}/resources/css/customer/delete/deleteInfo.css">

<!-- js -->
<script src="${path}/resources/js/customer/delete.js" defer></script>

</head>
<body>

	<!-- header start -->
		<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>
	<!-- header end -->
	
<div id="wrap"> <!-- 주요 콘텐츠 영역 감싸는 컨테이너 역할 -->

	<div id="container">
		<div class="page_navigation">	<!-- 네비게이션 태그 -->
			<ul class="page_nav">
				<li>
					<a href="/main.do">홈</a>
				</li>
				<li>
					<a href="/myInfoAdmin.do"> > 마이페이지</a>
				</li>
				<li>
					<a href="#"> > 개인정보</a>
				</li>
				<li>
					<a href="/deleteInfo.do"> > 회원 탈퇴</a>
				</li>
			</ul>
		</div>
		
		<div class="content_block"> <!-- 메뉴바 + 본문 내용 들어갈 박스 -->
			<!-- 왼쪽 메뉴 띄우기 -->
			<script src="#"></script>
			<div class="Inb_block" style="top: 0px;">
				<div class="#">
					<h2 class="tit_Inb_title"></h2>
					<ul class="Inb_nav"></ul>
				</div>
			</div>
			<!-- 왼쪽 메뉴 띄우기 끝 -->
			
			<!-- 본문 -->
			<div class="content" id="content">
				<h3 class="big_title">회원탈퇴</h3>
				<form name="frmPass" id="frmPass" action="delete.do" method="post" onsubmit="return submitForm()">
					<div class="detailContent">
						<div class="notice">
							<p> "회원탈퇴 전에 "
								<em class="emp_red">안내사항</em>
								<strong>을 꼭 확인</strong>
								"해주세요."
							</p>
						</div>
						
						<div class="box_guide wline">
							<h3 class="bg_1_1">회원님 나드락 서비스를 이용하시는데 불편함이 있으셨나요?</h3>
							<ol class="list_number"> <!-- ol : "ordered list" 순서가 있는 목록을 나타내는 태그 -->
								<li>
								나드락에서 발송하는 SMS & 메일 수신거부는 '마이페이지 > 개인정보'에서 확인하세요.
								</li>
								<li>
								이용 불편 및 각종 문의 사항은 고객센터로 문의 주시면 성심 성의껏 답변 드리겠습니다.
								</li>
							</ol>
						</div>
						
						<div class="box_qna">
							<p class="txt_info multi">
								<span class="info">
									<a href="#" class="btn_go_page">자주하는 질문</a>
								</span>
								<span class="info">
									<a href="#" class="btn_go_page">1:1 문의</a>
								</span>
								<span class="info">전화문의 1544-2288</span>
							</p>
						</div>
						
						<div class="noti_info">
							<i class="fa-solid fa-circle-exclamation">안내사항</i>
							<ul class="tbl_info_list">
								<li>‘전자상거래 등에서의 소비자 보호에 관한 법률’ 에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한
								<br>기록은 5년, 소비자의 불만 또는 분챙처리에 관한 기록은 3년 동안 보존됩니다.
								</li>
								
								<li>회원탈퇴 후 노랑풍선 서비스에 입력하신 상품문의 및 후기 등은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제 처리가 원천적으로 불가능 합니다.
								<br>
								- 상품문의 및 후기 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.
								</li>
								
								<li>회원탈퇴 후 모든 개인정보는 개인정보 처리방침에 의거하여 삭제됩니다. 노랑풍선 이벤트에 참여하신 댓글내역도 삭제됩니다.
								</li>
								
								<li>회원탈퇴 후 이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.
								</li>
							</ul>
						</div>
					
					<div class="box_agree">
						<span class="form_block">
							<input type="checkbox" name="agree1" id="agree1">
							<label for="agree1"> 위 내용을 모두 확인하였으며, 동의합니다. </label>
						</span>
					</div>
					
					<p class="txt_check">
					고객님들께 더 좋은 서비스를 제공하기 위하여 아래 
					<span class="emp_blue">회원 탈퇴 사유를 선택</span>해 주세요.
					<br>
					모든 고객님께서 만족하실 수 있는 나드락이 되도록 항상 노력하겠습니다.
					</p>
					
					<h4 class="stit_con_title">탈퇴 사유 선택 (필수)</h4>
					<ul class="list_align_category">
					<li>
						<span class="form_block">
							<input type="radio" name="levCd" id="chk1" value="A">
							<label for="chk1">
								서비스가 기대에 미치지 않아서
							</label>
						</span>
					</li>
					<li>
						<span class="form_block">
							<input type="radio" name="levCd" id="chk2" value="B">
							<label for="chk2">
								자주 이용하지 않아서
							</label>
						</span>
					</li>
					<li>
						<span class="form_block">
							<input type="radio" name="levCd" id="chk3" value="C">
							<label for="chk3">
								회원가입 후 사용하지 않아서
							</label>
						</span>
					</li>
					<li>
						<span class="form_block">
							<input type="radio" name="levCd" id="chk4" value="D">
							<label for="chk4">
								기타 사이트에 비슷한 서비스가 있어서
							</label>
						</span>
					</li>
					<li>
						<span class="form_block">
							<input type="radio" name="levCd" id="chk5" value="E">
							<label for="chk5">
								개인 정보 보호 문제
							</label>
						</span>
					</li>
					<li>
						<span class="form_block">
							<input type="radio" name="levCd" id="chk6" value="F">
							<label for="chk6">
								기타(자세한 사유 기입)
							</label>
						</span>
					</li>
					</ul>
					
					<div class="block_tit_area blc">
						<h4 class="stit_con_title">나드락에 바라는 점 (선택)</h4>
						<div class="p_align_right">
							<p class="txt_nor_info">기타 사유나 나드락에 전달하실 내용이 있으시면 작성하세요.</p>
						</div>
					</div>
					<textarea class="tf_wish" name="etcCmmt" id="etcCmmt" cols="30" rows="10" placeholder="내용을 입력하세요." title="기타 사유/나드락에 전달하실 내용"></textarea>
					
					<div class="block_tit_area align_ctr">
						<h3 class="stit_con_mix">
						<strong>'탈퇴하기'를 누르면 즉시 탈퇴</strong>가 처리되며<br>
						같은 아이디로 재가입 하더라도 기존 정보는 복구는 불가능합니다.<br>
						다시 한번 확인해주세요.
						</h3>
					</div>
					
					<!-- 버튼 -->
					<div class="btn_area">
						<button type="submit" id="btnok" class="btn_cof" value="탈퇴하기">탈퇴하기</button>
						<button type="button" id="btncancel" class="btn_cof" value="취소" onclick="window.location='${path}/myInfo.do'">취소</button>
					</div>
					
					</div>
				</form>
			</div>
			<!-- 본문 끝 -->
		</div>
	</div>
</div>

	<!-- footer start -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
	<!-- footer end -->
</body>
</html>