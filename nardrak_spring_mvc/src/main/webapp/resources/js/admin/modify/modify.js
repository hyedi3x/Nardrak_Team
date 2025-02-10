//
//
//  == modify.jsp ==

//관리자페이지 수정 body onload 함수, submit 변수값 초기화
function bodyOnLoad(){
	phone_input = 1; 
	jender_input = 1; 
	jenderChk =1;
}

// 서브밋 할 때 받아온 값과 동일한 경우에는 중복이여도 상관 없으니 유니크 검사 성공처리
function modifySubmit(ad_phone2, ad_email1, ad_email2, ad_empnum){
	alert($(ad_phone2).val());
	alert($('#ad_phone2').val());
	if($(ad_phone2).val() == $('#ad_phone2').val()){
		$('#uniquePhone').val(1);
	}
	if($(ad_email1).val() == $('#ad_email1').val() && 
	   $(ad_email2).val() == $('#ad_email2').val()){
		$('#uniqueEmail').val(1);
	}
	if($(ad_empnum).val() == $('#ad_empnum').val()){
		$('#uniqueEmpnum').val(1);
	}
}