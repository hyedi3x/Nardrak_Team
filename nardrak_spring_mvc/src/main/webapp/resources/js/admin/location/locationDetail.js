// 서브밋
let submitCheck = 1;
function submitChk(){
   if(submitCheck == 1){
      alert('중복된 여행지 이름이 있습니다.');
      $('#local_title').val('');
      $('#local_title').focus();
      return false;
   }
   else{
      return true;
   }
}
 // 취소 버튼
function myInfoBTN(path){

   if(confirm('마이페이지로 돌아가시겠습니까?')){
      window.location=path+"/myInfo.do";
   }
}

// 유니크 컬럼들 ajax로 조회하기 
// 매개변수 = (컨텍스트경로, 변경될 dev id, 입력한 input id)
function checkTitle(path, elementId, inputId){
   
   // 매개변수로 요소 호출하기, 각자의 변수로 함수 재사용
   //emial, phone, empnum의  input 요소
   let input = $(inputId).val()
   //ajax 적용 위치
   let element = $(elementId);
   // 객체의 key, value로 넘겨 value에 따라 다른 조건으로 실행
   let elementJson = {};
   
   //객체에 value와 id를 저장
   elementJson.value = input;
   
   elementJson.id = 'local_title';
   
   // ajax에서 전달 된 객체의 key와 value에 getParameter로 접근
   // 성공하면 actionResult에서 요청된 요소 별로 다르게 input 요소를 hidden으로 추가하여 
   // submit 할 때 값을 검사한다. !(요소)는 존재여부로 검사가 안되어 val()==1 로 submit 조건 수정
   // 요청 성공 시(조회된 값이 없을 때), actionResult에서 비동기적으로 input 요소를 만들어 element.html()에 담는다.
   // 요소가 생성되면 value를 조회 가능하여 submit 함수에서 조회가 되지 않으면 alert() 실행
   $.ajax({
      url: path+"/checkTitle.tr",
      data: elementJson, // get 방식으로 넘기기에 parameter로 받기   
      type: 'POST',
      success: function(response){
         if(response.count != 0){
            element.html('중복된 여행지 이름이 있습니다.');
            element.css('color','#ff0000');
            submitCheck = 1;
         }
         else{
            element.html('사용 가능한 여행지 이름입니다.');
            element.css('color','#0000ff');
            submitCheck = 0;
         }
      },
      error: function(){
         alert("error");
      }
   });
   
}
