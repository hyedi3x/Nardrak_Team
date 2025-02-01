# Nardrak_Team

===============================================
1. 관리자 등록 시 약관 동의 modal 부트스트랩 설명

1 ) <a> 태그에서 부트트랩 속성 추가
-  data-bs-toggle="modal" => UI 요소 모달을 제어하기 위한 속성
- data-bs-target="#exampleModal" => 모달 ID 정의

 2 ) 모달 페이지 불러오기 
 - <%@ include file="./terms.jsp" %>

3 ) 모달 페이지 / 모달 속성 설명
- <div class="modal fade" id="exampleModal" ...> => target과 ID 일치
- <h1 class="modal-title fs-5" id="exampleModalLabel">
   => title 클래스의 <h1> 태그에서 타이틀 작성
- <div class="modal-body">
   => body 클래스의 <div> 태그에서 본문 작성
- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
   => 모달을 닫는 버튼을 footer에서 작성
-  <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="terms_chk(1)">동의하기</button>
   => 모달을 닫으면서 click 시 js 함수를 호출하는 버튼을 footer에서 작성