/**
 * 
 */
 
 
// 태영 추가 : 메인으로 이동 (임시: 로그인 페이지)
function mainBTN(){
	window.location="/nardrak_spring_mvc/adminLogIn.ad";
}

// id 중복확인
function idConfirm1(){
	let ad_id = $('#ad_id').val();
	if(!ad_id){
		alert("아이디를 입력하세요.");
		return false;
	}
	let url = "/nardrak_spring_mvc/adminidConfirm.ad?ad_id="+ad_id;
	window.open(url, "adminidConfirm", "width=600, height=400");
}

// id 중복확인 성공 버튼
function idConfirm2(ad_id){
	opener.$('#ad_id').val(ad_id);
	opener.$('#idChk').val(1);
	self.close();
}

// id 중복확인 버튼 2
function idConfirm3(){
	let ad_id = $('#ad_id').val();
	if(!ad_id){
		alert("아이디를 입력하세요.");
		return false;
	}
}	

/* submit 
1. 비밀번호 일치 확인
2. 생년월일, 휴대폰 번호 길이 확인
3. id 중복 확인
4. 비밀번호 체크
5. 모달창 체크
*/

function submitChk(){
   let pw = $('#ad_pwd').val();
   let pwdChk = $('#pwdChk').val();
   let pwd = $('#ad_pwd').val().length;
   let adBirth = $('#ad_birth').val().length;
   let adTel = $('#ad_tel').val().length;
   
   
   if(pw != pwdChk){
      alert("비밀번호가 일치하지 않습니다.");
      $('#ad_pwd').focus();
      return false;
   }
   
   if($('#idChk').val() != 1){
      alert("아이디 중복을 확인해주세요");
      $('#ad_id').focus();
      return false;      
   }   
   
   if($('#modalChk1').val() == 0 || $('#modalChk2').val() == 0){
      alert("필수 약관을 읽고 동의해주세요");
      return false;
   }
   
   if( adBirth != 6 ){
      alert("생년월일을 정확히 입력해주세요");
      $('#ad_birth').focus();
      return false;
   }
   
   if($('#ad_phone2').val().length != 11 ){
      alert("전화번호를 정확히 입력해주세요.");
      return false;
   }
   
   if( !(adTel == 9 || adTel == 10 || adTel == 11) ){
      alert(adTel+"사내전화번호를 정확히 입력해주세요.");
      $('#ad_tel').focus();
      return false;
   }
   
   if($('#pwdValCheck').val() == 0){
      alert("비밀번호를 정확히 입력해주세요.");
      return false;
      $('#ad_pwd').focus();
   }
}



// 아이콘 클릭시 비밀번호 이미지와 타입 변경
function pwdShow(pwhChk){ 
	if(pwhChk == 0){
		$('#pwdIcon1').css('display','none');
		$('#pwdIcon2').css('display','inline');
		$('#ad_pwd').prop('type','text');
	}
	else{
		$('#pwdIcon1').css('display','inline');
		$('#pwdIcon2').css('display','none');
		$('#ad_pwd').prop('type','password');
	}

}

// id 값이 바뀌면 다시 중복확인
$(function(){
	$('#ad_id').on('change', ()=> {
		$('#idChk').val(0);
	});
});
			
			
// 생년월일, 휴대폰 번호 입력 확인
$(function(){
	$('#ad_birth').on('keyup', function(){
		let ad_birth = $('#ad_birth').val();
		if(ad_birth.length == 0 || ad_birth.length == 6){
			$('#birthChk').css('display', 'none');
			$('#ad_birth').css('border', '1px solid lightgray');
			$('#ad_birth').css('outline', 'none');
			$('#ad_birth:hover').css('border-color', '#0052FF');
		}
		else{
			$('#birthChk').css('display', 'flex');
			$('#ad_birth').css('border', '1px solid rgba(255, 0, 0)');
			$('#ad_birth').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
		}
	});
	
	$('#ad_phone2').on('keyup', function(){
		let ad_phone = $('#ad_phone2').val();
		if(ad_phone.length == 0 || ad_phone.length == 11){
			$('#phoneChk').css('display', 'none');
			$('#ad_phone2').css('border', '1px solid lightgray');
			$('#ad_phone2').css('outline', 'none');
			$('#ad_phone2:hover').css('border-color', '#0052FF');
		}
		else{
			$('#phoneChk').css('display', 'flex');
			$('#ad_phone2').css('border', '1px solid rgba(255, 0, 0)');
			$('#ad_phone2').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
		}
	});
	
});
 
 
// 이메일 값주기
function emailFn(){
	let email3 = $('#ad_email3');
	let email2 = $('#ad_email2');
	if(email3.val() != 0){
		email2.val(email3.val());
	}
	else{
		email2.val('');
		email2.focus();
	}
}
 
/* 약관 전체 선택 체크박스 */
let check = $('#allCheck');
check.on('click', () => {
if(check.prop('checked') == true){

    $('.chkList').prop('checked', true);
}
else{
	$('.chkList').prop('checked', false);
}

});

/* 약관 체크 */
function terms_chk(num) {
	if(num == 1){
		document.querySelector('#chkList1').checked='true';
		$('#modalChk1').val(1);
	}
	if(num == 2){
		document.querySelector('#chkList2').checked='true';
		$('#modalChk2').val(1);
	}
	if(num == 3){
		document.querySelector('#chkList3').checked='true';
	}
	if(num == 4){
		document.querySelector('#chkList4').checked='true';
	}
}

function chkListClick(chk){
	if(chk.val() == 1){
		if($('#modalChk1').val() == 0){
			alert("약관을 읽고 동의해주세요.");
			$('#chkList1').prop('checked', false);
			$('#chkList1').focus();
		}
	}
	
	if(chk.val() == 2){
		if($('#modalChk2').val() == 0){
			alert("약관을 읽고 동의해주세요.");
			$('#chkList2').prop('checked', false);
			$('#chkList2').focus();
		}
	}
	
}

/* 비밀번호 유효성 체크 (태영 추가) */
// 비밀번호 입력창 정보 가져오기
let elInputPassword = document.querySelector('#ad_pwd'); // input id: ad_pwd

elInputPassword.onkeyup = function () {

// 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
let elStrongPasswordMessage = document.querySelector('.strongPassword-message'); // div.strongPassword-message.hide

// 영어,숫자,특수문자 조합 8자 이상 16이하 
function strongPassword (str) {
  return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/.test(str);
}


  // 값을 입력한 경우
  if (elInputPassword.value.length != 0) {
    if(strongPassword(elInputPassword.value)) { 
    	elStrongPasswordMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
    	
    	$('#ad_pwd:focus').css('border-color', '#0052FF');
		$('#ad_pwd:focus').css('outline', 'rgba(0, 82, 255, 0.2)');
		$('#ad_pwd:hover').css('border-color', '#0052FF');
		$('#ad_pwd').css('border', '1px solid lightgray');
		$('#ad_pwd').css('outline', 'none');
		
		// 비밀번호 유효성 체크
    	$('#pwdValCheck').val(1);
    	
    }
    else {
		elStrongPasswordMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
		
		$('#ad_pwd').css('border', '1px solid rgba(255, 0, 0)');
		$('#ad_pwd').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
    }
  }
  // 값을 입력하지 않은 경우 (지웠을 때)
  // 모든 메시지를 가린다.
  else {
    elStrongPasswordMessage.classList.add('hide');
  }
}
