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


//  == delete.jsp ==
// 관리자 삭제페이지
function termsLoad(ad_terms){
	$('#termsTd3').css('display','none');
	$('#termsTd4').css('display','none');
	if(ad_terms.includes('1')){
		$('#termsTd1').css({'display':'flex', 'width':'800px'});
		$('#terms1').html($('#exampleModalLabel1').text()+$('#exampleModal1 .modal-body').text());
	}
	if(ad_terms.includes('2')){
		$('#termsTd2').css({'display':'flex', 'width':'800px'});
		$('#terms2').html($('#exampleModalLabel2').text()+$('#exampleModal2 .modal-body').text());
	}
	if(ad_terms.includes('3')){
		$('#termsTd3').css({'display':'flex', 'width':'800px'});
		$('#terms3').html($('#exampleModalLabel3').text()+$('#exampleModal3 .modal-body').text());
	}
	if(ad_terms.includes('4')){
		$('#termsTd4').css({'display':'flex', 'width':'800px'});
		$('#terms4').html($('#exampleModalLabel4').text()+$('#exampleModal4 .modal-body').text());
	}
}

function deleteSubmit(){
	if($('#deleteChk').val() != "동의합니다."){
		alert("다시 입력해주세요.");
		$('#deleteChk').val('');
		$('#deleteChk').focus();
		return false;
	}
	else{
		return confirm('정말 삭제하시겠습니까?');
	}
}

function myInfoBTN(path){
	if(confirm('마이페이지로 돌아가시겠습니까?')){
		window.location=path+"/myInfo.do";
	}
}