 
function myInfoBTN(path){
	if(confirm('마이페이지로 돌아가시겠습니까?')){
		window.location=path+"/myinfo.do";
	}
}

$('#local_title').on('input', function(){
	$('#keyword-search').val($('#local_title').val());
});
// 유니크 컬럼들 ajax로 조회하기 
// 매개변수 = (컨텍스트경로, 변경될 dev id, 입력한 input id)
function uniqueChk(path, elementId, inputId){
	
	// 매개변수로 요소 호출하기, 각자의 변수로 함수 재사용
	//emial, phone, empnum의  input 요소
	let input = $(inputId)
	//ajax 적용 위치
	let element = $(elementId);
	
	// 객체의 key, value로 넘겨 value에 따라 다른 조건으로 실행
	let elementJson = {};
	
	//객체에 value와 id를 저장
	elementJson.value = input.val();
	
	// 이메일은 값을 둘다 받아야한다.
	if(elementId == '#emailUnique'){
		elementJson.id = 'ad_email';
		elementJson.value = $('#ad_email1').val()+"@"+$('#ad_email2').val(); 
	}
	else if(elementId == '#phoneUnique'){
		elementJson.id = 'ad_phone';
	}
	else if(elementId == '#empnumlUnique'){
		elementJson.id = 'empnum';
		
	}
	
	// ajax에서 전달 된 객체의 key와 value에 getParameter로 접근
	// 성공하면 actionResult에서 요청된 요소 별로 다르게 input 요소를 hidden으로 추가하여 
	// submit 할 때 값을 검사한다. !(요소)는 존재여부로 검사가 안되어 val()==1 로 submit 조건 수정
	// 요청 성공 시(조회된 값이 없을 때), actionResult에서 비동기적으로 input 요소를 만들어 element.html()에 담는다.
	// 요소가 생성되면 value를 조회 가능하여 submit 함수에서 조회가 되지 않으면 alert() 실행
	$.ajax({
		url: path+"/uniqueCheck.ad",
		data:elementJson, // get 방식으로 넘기기에 parameter로 받기	
		type: 'POST',
		success: function(result){
			element.html(result);
		},
		error: function(){
			alert("error");
		}
	});
	
}
