 
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
	window.open(url, "adminidConfirm", "menubar=no, width=450, height=290, left=900, top=250"); 
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
// 핸드폰, 성별 유효성 체크용
let phone_input = 0;
let jender_input = 0;
function submitChk(){
   
   // 아이디 중복 확인
   if($('#idChk').val() != 1){
      alert("아이디 중복을 확인해주세요.");
      $('#ad_id').focus();
      return false;      
   }
   
   // 아이디 정규식
   if($('#idValCheck').val() == 0){
      alert("아이디 입력을 다시 확인해주세요");
      $('#ad_id').focus();
      return false;
   }
   
   // 비밀번호 일치
   if($('#ad_pwd').val() != $('#pwdChk').val()){
      alert("비밀번호가 일치하지 않습니다.");
      $('#ad_pwd').focus();
      $('#pwdChk').val("");
      return false;
   }
   
   // 비밀번호 정규식
   if($('#pwdValCheck').val() == 0){
      alert("비밀번호를 확인해주세요.");
      $('#ad_pwd').focus();
      $('#pwdChk').val("");
      return false;
   }
   
   // 전화번호 정규식
   if(phone_input != 1 ){
      alert("전화번호 11자리를 정확히 입력해주세요.");
      $('#ad_phone2').focus();
      return false;
   }
   
   // 이메일 사용자이름 정규식
   if($('#emailVal1Check').val() == 0){
      alert("이메일 입력을 다시 확인해주세요");
      $('#ad_email1').focus();
      return false;
   }
   
   // 이메일 도메인 정규식
   if($('#emailVal2Check').val() == 0){
      alert("이메일 입력을 다시 확인해주세요");
       $('#ad_email2').focus();
      return false;
     
   }
   
   // 생년월일 범위 검사
   if($('#brithValCheck').val() == 0){
      alert("생년월일 입력을 다시 확인해주세요");
      $('#ad_birth').focus();
      return false;
   }
   
   // 주소 공란 검사
   if(!$('#ad_zip1').val() || !$('#ad_zip2').val()){
   	alert('주소를 입력해주세요.');
    $('#ad_ZIPBTN').focus();
   	return false;
  	}
  	
  	// 주민번호 성별 확인
  	if(jenderChk == 0){
   	alert('주민번호 뒷자리를 확인해 주세요.');
    $('#ad_jender').focus();
   	return false;
  	}
  	
  	// unique 폰, 이메일, 사번 ajax로 받아오기
  	if($('#uniquePhone').val()!=1){
   	alert('이미 등록된 핸드폰 번호입니다.');
    $('#ad_phone2').focus();
   	return false;
  	}
  	
  	if($('#uniqueEmail').val()!=1){
   	alert('이미 등록된 이메일입니다.');
    $('#ad_email1').focus();
   	return false;
  	}
  	
  	if($('#uniqueEmpnum').val()!=1){
   	alert('이미 등록된 사번입니다.');
    $('#ad_empnum').focus();
   	return false;
  	}
}

// 비밀 번호 표시 - 아이콘 클릭시 비밀번호 이미지와 타입 변경
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

// id 값이 바뀌면 다시 중복확인하기
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
const reg_pwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&])[a-zA-Z0-9@$!%*#?&]{8,16}$/;  // 0개이상 문자뒤에 영소, 0~9, 특수기호 요구
// 생년월일, 휴대폰 번호 입력 확인
// 입력이 변할 때 마다 함수가 실행되어(실시간 함수 실행) 6자리가 입력되지 않으면 스타일을 변경하고 #birthChk 문구를 띄운다

	
// input type이 number일 때, maxlength 속성이 존재하는 요소 선택
$('input[type=number][maxlength]').on('input', function() { 
    var num = $(this);                             // this = 이벤트 발생시킨 요소
    var maxlength = num.attr('maxlength');         // maxlength 속성 값을 불러옴
    var numval = num.val();
    if (numval.length > maxlength) {
        num.val(numval.substr(0, maxlength)); //길이초과하면 되돌리기
        
	}
});

// 핸드폰
$('#ad_phone2').on('input', function(){
	
	// 기본 설정
    phone_input = 0;
    $('#phoneChk').css('display', 'flex');
	$('#ad_phone2').css('border', '1px solid rgba(255, 0, 0)');
	$('#ad_phone2').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
	
	let ad_phone = $('#ad_phone2').val();
	
	// 값이 없으면 초기화
	if(ad_phone.length == 0){
		$('#phoneChk').css('display', 'none');
		$('#ad_phone2').css('border', '1px solid #d9d9d9');
		$('#ad_phone2').css('outline', 'none');
		$('#ad_phone2:hover').css('border-color', '#729ea1');
	}
	// 길이가 11이며, 010으로 시작하면 정상
	if(ad_phone.length == 11){
		// 핸드폰 앞자리 010으로 통합됨
		if(ad_phone.substring(0,3) == '010'){
			$('#phoneChk').css('display', 'none');
			$('#ad_phone2').css('border', '1px solid #d9d9d9');
			$('#ad_phone2').css('outline', 'none');
			$('#ad_phone2:hover').css('border-color', '#729ea1');
			phone_input = 1;
		}
	}
});

// 아이디
$('#ad_id').on('input', function(){
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
$('#ad_pwd').on('input', function(){
	let ad_pwd = $('#ad_pwd').val();
	if(reg_pwd.test(ad_pwd) || ad_pwd.length == 0){
		$('#pwdStr1').css('display', 'none');
		$('#ad_pwd').css('border', '1px solid #d9d9d9');
		$('#ad_pwd').css('outline', 'none');
		$('#pwdValCheck').val(1);
	}
	else{
		$('#pwdStr1').css('display', 'flex');
		$('#ad_pwd').css('border', '1px solid rgba(255, 0, 0)');
		$('#ad_pwd').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
		$('#pwdValCheck').val(0);
	}
});

// 비밀번호 확인
$('input[type=password]').on('input', function(){
		if($('#pwdChk').val() == $('#ad_pwd').val()){
			$('#pwdStr2').css('display', 'none');
			$('#pwdChk').css('border', '1px solid #d9d9d9');
			$('#pwdChk').css('outline', 'none');
		}
		else{
			$('#pwdStr2').css('display', 'flex');
			$('#pwdChk').css('border', '1px solid rgba(255, 0, 0)');
			$('#pwdChk').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
		}
});

// 이메일
$('#ad_email1').on('input', function(){
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
$('#ad_email2').on('input', function(){
	// 값 직접 입력시에만 실행
	$('#emailVal2Check').val(0);
	$('#ad_email3 option').prop('selected',false);  // 이메일 select option들은 직접입력하면 초기화
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
$('#ad_birth').on('input', function(){
	// 값 직접 입력시에만 실행
	let ad_birthY = parseInt($('#ad_birth').val().substring(0,2));
	let ad_birthM = parseInt($('#ad_birth').val().substring(2,4));
	let ad_birthD = parseInt($('#ad_birth').val().substring(4,6));
	let ad_birth = $('#ad_birth').val();
	
	//현재 년월일 받아오기
	let date = new Date();
	currY = date.getFullYear() % 100; // 100으로 나눈 나머지 반환 = 10의 자리년도 형식 
	currM = date.getMonth()+1;
	currD = date.getDate();
	
	// 년도로 나이 계산 
	let yearChk = (currY >= ad_birthY)? currY-ad_birthY : (100-ad_birthY)+currY;
	
	// 생년월일 체크용
	let b_inputChk = 0;
	
	// 값 없어지면 경고창 지우기
	if(ad_birth.length == 0){
		$('#birthChk').css('display', 'none');
        $('#ad_birth').css('border', '1px solid #d9d9d9');
        $('#ad_birth').css('outline', 'none');
        $('#brithValCheck').val(0);
	}
	
	else{
		// 입력이 6자리면
		if(ad_birth.length == 6){
		
		// 주민번호 뒷자리 판단
		jender_input = (currY >= ad_birthY)? 2 : 1; // 2이면 뒷자리 3,4 1이면 1,2
		
			// 1~12 월만 참 
			if( ad_birthM >=1 && ad_birthM <=12){
				// 2월 체크
				if(ad_birthM == 2){
					// 윤년일 때 29일까지
					if(ad_birthY  % 4 == 0){
						if(ad_birthD >= 1 && ad_birthD <= 29){
							b_inputChk = 1;
						}
					}
					// 윤년 아닐 때
					else if(ad_birthD >= 1 && ad_birthD <= 28){
						b_inputChk = 1;
					}
				}
				//2월이 아닌 나머지 중 홀수월 && 1~30일
				else if(ad_birthM % 2 != 0){
					if(ad_birthD >= 1 && ad_birthD <=30){
						b_inputChk = 1;
					}
				}
				// 짝수월 확정, 1~31일
				else if (ad_birthD >= 1 && ad_birthD <=31){
					b_inputChk = 1;
				}
			} // 1~12월
		} // 입력 6자리
		else{ // 입력 6자리 아님
				$('#birthChk').css('display', 'flex');
                $('#ad_birth').css('border', '1px solid rgba(255, 0, 0)');
                $('#ad_birth').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
                $('#brithValCheck').val(0);
                jender_input = 0;
		}
	} // 0일 때 else
	
	// 입력 값 검사 후 정상 입력 범위일 때만 실행 
	if(b_inputChk == 1){
		// 생일 안지났으면 한살 뺴기
        if(currM < ad_birthM || currM == ad_birthM && currD < ad_birthD){
           yearChk = yearChk-1;

         }      
        if(yearChk >= 14 && yearChk <= 60){ // 14세 이상, 60세 미만
            
           $('#birthChk').css('display', 'none');
           $('#ad_birth').css('border', '1px solid #d9d9d9');
           $('#ad_birth').css('outline', 'none');
           $('#brithValCheck').val(1);
           
           // 생년월일 변경시 주민번호 뒷자리 성별 검사 다시 실행
           jender();
           
        }
        else{ // 14세 미만
           $('#birthChk').css('display', 'flex');
           $('#ad_birth').css('border', '1px solid rgba(255, 0, 0)');
           $('#ad_birth').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
           $('#brithValCheck').val(0);
        }
     }
	
});
	
// submit에서 검사용
let jenderChk =0;
// 주민번호 뒷자리 input[type=number] 첫 한자리 입력 성별 검사
// jender의 값을 읽는다.
function jender(){
	
	// 함수가 시작되면 초기화
	jenderChk =0;
	
	let ad_jender = $('#ad_jender').val();
	
	
	// 생년월일 검사에서 입력이 6자리이면 삼항식으로 값을 1 또는 2로 변경 
	if(jender_input == 1){
		if(ad_jender == 1 || ad_jender == 2){
			jenderChk = 1;
		}
	}
	else if(jender_input == 2){
		if(ad_jender == 3 || ad_jender == 4){
			jenderChk = 1;
		}
	}
	else{
		jenderChk = 0;
	}
	
	if(jenderChk == 1){
		$('#jenderChk').css('display', 'none');
		$('#ad_jender').css('border', '1px solid #d9d9d9');
		$('#ad_jender').css('outline', 'none');
	}
	else{
		$('#jenderChk').css('display', 'flex');
			$('#ad_jender').css('border', '1px solid rgba(255, 0, 0)');
			$('#ad_jender').css('outline', '3px solid rgba(255, 0, 0, 0.3)');
	}
}

 
// 이메일 값주기
function emailFn(){
	let email3 = $('#ad_email3');
	let email2 = $('#ad_email2');
	if(email3.val() != 0){
		email2.val(email3.val());
		$('#email2Str').css('display', 'none');
		$('#ad_email2').css('border', '1px solid #d9d9d9');
		$('#ad_email2').css('outline', 'none');
		$('#emailVal2Check').val(1);

	}
	else{
		email2.val('');
		email2.focus();
	}
}

// 부서코드 & 사내 번호 연동
$('#ad_dep').on('change', function(){
	// this.options는 모든 옵션을 배열로 가져옴(배열객체), this.selectedIndex는 선택된 인덱스
	
	// dep 선택시 선택된 요소의 인덱스 번호가 tel의 eq()에 들어간다.
	$('#ad_tel option').eq(this.selectedIndex).prop('selected',true);
		
});
$('#ad_tel').on('change', function(){
	// this.options는 모든 옵션을 배열로 가져옴(배열객체), this.selectedIndex는 선택된 인덱스
	
	// dep 선택시 선택된 요소의 인덱스 번호가 tel의 eq()에 들어간다.
	$('#ad_dep option').eq(this.selectedIndex).prop('selected',true);
		
});


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
		dataType:"json",  // response.getWritter().write("문자열");을 json 타입으로 지정
		success: function(response){
			
			if(response.uniqueCheck == 0){
				if(elementId == '#phoneUnique'){
					element.html('<div class="inputAjax"> 사용 가능한 번호입니다. </div>');
					element.find('.inputAjax').css({"color": "#50858b", 'font-size': '14px'});
					$('#phoneUnique').val(1);
				}
				if(elementId == '#emailUnique'){
					element.html('<div class="inputAjax"> 사용 가능한 이메일입니다. </div>');
					element.find('.inputAjax').css({"color": "#50858b", 'font-size': '14px'});
					$('#uniqueEmail').val(1);
				}
				if(elementId == '#empnumlUnique'){
					element.html('<div class="inputAjax"> 사용 가능한 사번입니다. </div>');
					element.find('.inputAjax').css({"color": "#50858b", 'font-size': '14px'});
					$('#uniqueEmail').val(1);
				}
			}
			
			if(response.uniqueCheck == 1){
				if(elementId == '#phoneUnique'){
					element.html('<div class="inputAjax"> 이미 등록된 번호입니다. </div>');
					$('#uniqueEmail').val(1);
					element.find('.inputAjax').css({"color": "rgba(255, 0, 0)", 'font-size': '14px'});
				}
				if(elementId == '#emailUnique'){
					element.html('<div class="inputAjax"> 이미 등록된 이메일입니다. </div>');
					element.find('.inputAjax').css({"color": "rgba(255, 0, 0)", 'font-size': '14px'});
					$('#uniqueEmail').val(1);
				}
				if(elementId == '#empnumlUnique'){
					element.html('<div class="inputAjax"> 이미 등록된 사번입니다. </div>');
					element.find('.inputAjax').css({"color": "rgba(255, 0, 0)", 'font-size': '14px'});
					$('#empnumlUnique').val(1);
				}
			}
			if(input.val() == 0){
				if(elementId == '#phoneUnique' || elementId == '#emailUnique' || elementId == '#empnumlUnique'){
					element.find('.inputAjax').css("display", "none");
				}
			}
			
		},
		error: function(){
			alert("error");
		}
	});
}

