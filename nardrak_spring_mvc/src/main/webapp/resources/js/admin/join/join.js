 
// 태영 추가 : 메인으로 이동 (임시: 로그인 페이지)
function mainBTN(path){
	window.location=path+"/main.do";
}

// id 중복확인
function idConfirm1(path){
	let ad_id = $('#ad_id').val();  // jQuery : $('요소아이디 || 요소 클래스 || 태그').val() = document요소.value : 선택 요소의 값을 가져온다.
	if(!ad_id){
		alert("아이디를 입력하세요.");
		return false;
	}
	let url = path+"/adminidConfirm.ad?ad_id="+ad_id;
	// menubar=no : 메뉴바 없이, width & height: 새창 크기, left & top= 새창 생성위치 조정 
	window.open(url, "adminidConfirm", "menubar=no, width=450, height=270, left=900, top=250"); 
}

// id 중복확인 성공 시 보여지는 확인 버튼 (idChk에 1값을 value로 반환한 후(submit하기위해) self.close)
function idConfirm2(ad_id){
	opener.$('#ad_id').val(ad_id);
	opener.$('#idChk').val(1);
	self.close();
}

//  id 중복확인 후, 아이디가 중복되었을 경우 : 사용자가 아이디를 입력하지 않고 중복확인 버튼을 클릭했을 때
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
   
   if(pw != pwdChk){
      alert("비밀번호가 일치하지 않습니다.");
      $('#ad_pwd').focus();
      return false;
   }
   
   if($('#idChk').val() != 1){
      alert("아이디 중복을 확인해주세요.");
      $('#ad_id').focus();
      return false;      
   }   
   
   if($('#modalChk1').val() == 0 || $('#modalChk2').val() == 0){
      alert("필수 약관을 읽고 동의해주세요");
      return false;
   }
   
   if( adBirth != 6 ){
      alert("생년월일 6자리를 정확하게 입력해주세요.");
      $('#ad_birth').focus();
      return false;
   }
   
   if($('#ad_phone2').val().length != 11 ){
      alert("전화번호 11자리를 정확히 입력해주세요.");
      return false;
   }
   
   if($('#idValCheck').val() == 0){
      alert("아이디 입력을 다시 확인해주세요");
      $('#ad_id').focus();
      return false;
   }
   
   if($('#emailVal1Check').val() == 0){
      alert("이메일 입력을 다시 확인해주세요");
      $('#ad_email1').focus();
      return false;
   }
   
   if($('#emailVal2Check').val() == 0){
      alert("이메일 입력을 다시 확인해주세요");
      return false;
      $('#ad_email2').focus();
   }
   if($('#brithValCheck').val() == 0){
      alert("생년월일 입력을 다시 확인해주세요");
      $('#ad_birth').focus();
      return false;
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
			
// 정규식 체크
// 아이디, 이메일1, 이메일2 정규식
const reg_id = /^(?=.*[a-z])[a-z\d]{4,10}$/;
const reg_email1 = /^(?=.*[a-z])[a-z\d]*$/;
const reg_email2 = /^[a-z]+\.[a-z]+$/;
	
// 생년월일, 휴대폰 번호 입력 확인
// 입력이 변할 때 마다 함수가 실행되어(실시간 함수 실행) 6자리가 입력되지 않으면 스타일을 변경하고 #birthChk 문구를 띄운다
$(function(){

	// 핸드폰
	$('#ad_phone2').on('keyup', function(){
		let ad_phone = $('#ad_phone2').val();
		if(ad_phone.length == 0 || ad_phone.length == 11){
			$('#phoneChk').css('display', 'none');
			$('#ad_phone2').css('border', '1px solid #d9d9d9');
			$('#ad_phone2').css('outline', 'none');
			$('#ad_phone2:hover').css('border-color', '#729ea1');
		}
		else{
			$('#phoneChk').css('display', 'flex');
			$('#ad_phone2').css('border', '1px solid rgba(255, 0, 0)');
			$('#ad_phone2').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
		}
	});
	
	// 아이디
	$('#ad_id').on('keyup', function(){
		let ad_id = $('#ad_id').val();
			if(reg_id.test(ad_id) || ad_id.length == 0){
				$('#idStr').css('display', 'none');
				$('#ad_id').css('border', '1px solid #d9d9d9');
				$('#ad_id').css('outline', 'none');
				$('#idValCheck').val(1);
			}
			else{
				$('#idStr').css('display', 'flex');
				$('#ad_id').css('border', '1px solid rgba(255, 0, 0)');
				$('#ad_id').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
				$('#idValCheck').val(0);
			}
	});
	
	// 비밀번호
	$('#pwdChk').on('keyup', function(){
			if($('#pwdChk').val() == $('#ad_pwd').val()){
				$('#pwdStr').css('display', 'none');
				$('#pwdChk').css('border', '1px solid #d9d9d9');
				$('#pwdChk').css('outline', 'none');
			}
			else{
				$('#pwdStr').css('display', 'flex');
				$('#pwdChk').css('border', '1px solid rgba(255, 0, 0)');
				$('#pwdChk').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
			}
	});
	
	// 이메일
	$('#ad_email1').on('keyup', function(){
		let ad_email1 = $('#ad_email1').val();
			if(reg_email1.test(ad_email1) || ad_email1.length == 0){
				$('#email1Str').css('display', 'none');
				$('#ad_email1').css('border', '1px solid #d9d9d9');
				$('#ad_email1').css('outline', 'none');
				$('#emailVal1Check').val(1);
			}
			else{
				$('#email1Str').css('display', 'flex');
				$('#ad_email1').css('border', '1px solid rgba(255, 0, 0)');
				$('#ad_email1').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
				$('#emailVal1Check').val(0);
			}
	});
	
	// 이메일2
	$('#ad_email2').on('keyup', function(){
		// 값 직접 입력시에만 실행
		$('#emailVal2Check').val(0);
		let ad_email2 = $('#ad_email2').val();
		if(reg_email2.test(ad_email2) || ad_email2.length == 0){
			$('#email2Str').css('display', 'none');
			$('#ad_email2').css('border', '1px solid #d9d9d9');
			$('#ad_email2').css('outline', 'none');
			$('#emailVal2Check').val(1);
		}
		else{
			$('#email2Str').css('display', 'flex');
			$('#ad_email2').css('border', '1px solid rgba(255, 0, 0)');
			$('#ad_email2').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
			$('#emailVal2Check').val(0);
		}
	});
	
	// 생년월일
	$('#ad_birth').on('keyup', function(){
		// 값 직접 입력시에만 실행
		let ad_birthY = $('#ad_birth').val().substring(0,2);
		let ad_birthM = $('#ad_birth').val().substring(2,4);
		let ad_birthD = $('#ad_birth').val().substring(4,6);
		let ad_birth = $('#ad_birth').val();
		if(ad_birth.length == 6){
			if( ad_birthY <= 10 && ad_birthY >= 00 && ad_birthM >=1 && ad_birthM <=12
			|| ad_birthY >= 65 && ad_birthY <=99 && ad_birthM >=1 && ad_birthM <=12 ){
				if(ad_birthM % 2 == 0){
					if(ad_birthD >= 1 && ad_birthD <= 31){
						$('#birthChk').css('display', 'none');
						$('#ad_birth').css('border', '1px solid #d9d9d9');
						$('#ad_birth').css('outline', 'none');
						$('#brithValCheck').val(1);
					}
					else{
						$('#birthChk').css('display', 'flex');
						$('#ad_birth').css('border', '1px solid rgba(255, 0, 0)');
						$('#ad_birth').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
						$('#brithValCheck').val(0);
					}
				}
				if(ad_birthM % 2 != 0){
					if(ad_birthD >= 1 && ad_birthD <= 30){
						$('#birthChk').css('display', 'none');
						$('#ad_birth').css('border', '1px solid #d9d9d9');
						$('#ad_birth').css('outline', 'none');
						$('#brithValCheck').val(1);
					}
					else if(ad_birth.length == 0){
						$('#birthChk').css('display', 'none');
						$('#ad_birth').css('border', '1px solid #d9d9d9');
						$('#ad_birth').css('outline', 'none');
						$('#brithValCheck').val(0);
					}
				}
			}
		}
		else{
			$('#birthChk').css('display', 'flex');
			$('#ad_birth').css('border', '1px solid rgba(255, 0, 0)');
			$('#ad_birth').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
			$('#brithValCheck').val(0);
		}
	});
	
	// input type이 number일 때, 지정한 maxlength 만큼 입력이 됨
	// .on('input', function(ev) { ... }) : 사용자가 입력할 때(input 이벤트 발생 시) 실행되는 함수
	$('input[type=number][maxlength]').on('input', function(ev) {
	    var $this = $(this);                             // 현재 입력 이벤트가 발생한 <input> 요소를 jQuery 객체로 저장
	    var maxlength = $this.attr('maxlength');         // maxlength 속성 값을 불러옴
	    var value = $this.val();
	    
	    if (value && value.length >= maxlength) {
	        $this.val(value.substr(0, maxlength));
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


// jquery: 요소.prop() = 요소의 실제적인 상태(selected, checked)를 제어 (true, false)하기에 적합하다.
// 요소('속성') = true || fales를 반환 , .prop('속성', vlaue) = 속성이 있다면 값을 변경, 속성이 없다면, 속성과 속성값을 요소에 추가 
/* 약관 전체 선택 체크박스 */
let check = $('#allCheck');
check.on('click', () => {
	if(check.prop('checked') == true){
	    $('.chkList').prop('checked', true);
	}
	else{
		$('.chkList').prop('checked', false);
	}
	
	// 필수 약관의 모달에서 동의를 하지 않으면 체크가 안되도록한다.
	if($('#modalChk1').val() == 0){
		$('#allCheck').prop('checked', false);
		$('#chkList1').prop('checked', false);
		$('#chkList3').prop('checked', false);
		$('#chkList4').prop('checked', false);
	}
	if($('#modalChk2').val() == 0){
		$('#allCheck').prop('checked', false);
		$('#chkList2').prop('checked', false);
		$('#chkList3').prop('checked', false);
		$('#chkList4').prop('checked', false);
	}
});

/* 약관 체크 */
// 모달 footer에서 필수 약관(1번, 2번)을 동의할 경우 hidden midalChk1,2의 값을 (submit을 위해) 0 => 1로 변경한다. (3번, 4번은 선택 약관)
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

// 약관을 읽지 않고 체크박스를 선택하는 경우 .prop('checked',false)로 체크가 되지 않도록 한다. 약관을 읽지 않은 체크박스에 포커스
function chkListClick(chk){
	
	// 1번 체크박스 클릭하는 경우
	if(chk.val() == 1){
		if($('#modalChk1').val() == 0){
			alert("약관을 읽고 동의해주세요.");
			$('#chkList1').prop('checked', false);
			$('#chkList1').focus();
		}
	}
	
	// 2번 체크박스 클릭하는 경우
	if(chk.val() == 2){
		if($('#modalChk2').val() == 0){
			alert("약관을 읽고 동의해주세요.");
			$('#chkList2').prop('checked', false);
			$('#chkList2').focus();
		}
	}
	
	// 전체선택 체크박스 클릭하는 경우
	if(chk.val() == 'a'){
		// 체크 해제시에는 검사 안함
		if(check.prop('checked') == true){
			// 1번 약관
			if($('#modalChk1').val() == 0){
				alert("필수약관 1을 읽고 동의해주세요.");
				$('#chkList1').focus();
			}
			// 2번 약관
			else if($('#modalChk2').val() == 0){
				alert("필수약관 2를 읽고 동의해주세요.");
				$('#chkList2').focus();
			}
		}
	}
	
}

// 우편번호 API
const btn = $('#ad_ZIPBTN');
btn.on("click", () => {
	new daum.Postcode({
		
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
            console.log(data); // 검색 결과를 콘솔에서 출력
            	$('#ad_zip1').val(data.zonecode); // 우편번호
            	$('#ad_zip2').val(data.address);  // 기본주소
        }
    }).open();
});

/* 비밀번호 유효성 체크 (태영 추가) */
// 비밀번호 입력창 정보 가져오기
let elInputPassword = $('#ad_pwd'); // input id: ad_pwd

elInputPassword.on('keyup', () => {

// 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
let elStrongPasswordMessage = $('.strongPassword-message'); // div.strongPassword-message.hide

// 영어,숫자,특수문자 조합 8자 이상 16이하 
function strongPassword (str) {
  return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/.test(str);
}

  // 값을 입력한 경우
  if (elInputPassword.val().length != 0) {
    if(strongPassword(elInputPassword.val())) { 
    	elStrongPasswordMessage.addClass('hide'); // 해당 클래스에 hide 속성 추가
    	
		$('#ad_pwd').css('border', '1px solid #d9d9d9');
		$('#ad_pwd').css('outline', 'none');
		
		// 비밀번호 유효성 체크
    	$('#pwdValCheck').val(1);
    	
    }
    else {
		elStrongPasswordMessage.removeClass('hide'); // 실패 메시지가 보여야 함
		
		$('#ad_pwd').css('border', '1px solid rgba(255, 0, 0)');
		$('#ad_pwd').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
    }
  }
  // 값을 입력하지 않은 경우 (지웠을 때)
  // 모든 메시지를 가린다.
  else {
    elStrongPasswordMessage.classList.add('hide');
  }
});
