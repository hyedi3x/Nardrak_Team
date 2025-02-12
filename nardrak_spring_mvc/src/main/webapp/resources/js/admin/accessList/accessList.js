/**
 * 
 */
 
 // 관리자 승인 버튼을 누르면 배열에 타입이 체크박스이고, 체크된 상태인 요소만 차례대로 담는다.
 function accessSubmit(){
 	let checks=[];
 	let index = 0;
 	$('input[type=checkbox]:checked').each(function() {
 		checks[index] = this.name;
 		index += 1;
 	});
 	
 	// 담은 배열을 한번 더 경고창에서 보여주고 get 방식으로 전달 
 	if(confirm('승인할 관리자 목록\n'+checks+'\n승인하시겠습니까?')){
		window.location='#'; 	
 	}
 	else{
 		window.location='#';
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