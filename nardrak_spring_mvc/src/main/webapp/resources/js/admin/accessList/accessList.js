/**
 * 
 */
 
 // 관리자 승인 버튼을 누르면 배열에 타입이 체크박스이고, 체크된 상태인 요소만 차례대로 담는다.
 function submitChk(){
 	let checks=[];
 	let index = 0;
 	$('input[type=checkbox]:checked').each(function() {
 		if($(this).is('#checkedAll')){ // 전체선택 체크박스도 포함되서 .is('식별자')로 전체 체크 박스인지 검사
 			return; // 현재 반복을 스킵하고 다음 요소로 넘어감(continue), 탈출을 원하면 return false;
 		} 
 		checks[index] = $(this).val();
 		index += 1;
 	});
 	if(checks[0] != null){
	 	// 담은 배열의 값을 1,2,3,5..형태로 hidden input에 저장하여 전달
	 	if(confirm('승인할 관리자 목록\n'+checks+'\n승인하시겠습니까?')){
			$('#ad_ids').val(checks);
			return true;
	 	}
	 	else{
	 		return false;
	 	}
 	}
 	else{
 		alert("승인할 인원을 1명이상 선택하세요");
 		return false;
 	}
 }
 
 // 전체 선택 클릭하면 해당 체크 박스 값에 따라 나머지 체크박스 값도 변경
 function allCheck(){

 	if($('#checkedAll').prop('checked')){
 		$('input[type=checkbox]').prop('checked',true);
 	}
 	else{
 		$('input[type=checkbox]').prop('checked',false);
 	}
 }
 
 $('.accessCheckbox').on('click', () =>{
 	if(!$('this').prop('checked')){
 		$('#checkedAll').prop('checked', false)
 		}

 });