function myInfoBTN(path){
	if(confirm('마이페이지로 돌아가시겠습니까?')){
		window.location=path+"/myInfo.do";
		}
	}

// 회원가입 submit 체크 함수
function signlnCheck() {
    // 비밀번호 유효성 체크
    const password = document.inputform.cs_pwd.value;
    if (!password || password.length < 8) {
        alert("비밀번호 형식을 맞춰주세요!");
        document.inputform.cs_pwd.focus();
        return false;
    }

    // 비밀번호 일치 여부 확인
    const re_password = document.inputform.re_cs_pwd.value;
    if (password !== re_password) {
        alert("비밀번호가 일치하지 않습니다.");
        document.inputform.re_cs_pwd.focus();
        return false;
    }

    // 전화번호 유효성 체크 (뒷번호가 총 8자리가 아닌 경우)
    const phone = document.inputform.user_hp2.value + document.inputform.user_hp3.value;
    if (!phone || phone.length !== 8) {
        alert("전화번호 형식을 맞춰주세요!");
        document.inputform.user_hp2.focus();
        return false;
    }
    
    // 전화번호 중복 확인
    const phoneChk = document.getElementById("phoneChk").innerText;
    if (phoneChk.includes("등록된 전화번호")) {
        alert("이미 등록된 전화번호입니다. 다른 번호를 사용하세요.");
        return false;
    }

    const email1 = document.inputform.user_email1.value.trim();
    const email2 = document.inputform.user_email2.value.trim();

    console.log("입력된 이메일:", `"${email1}"`, `"${email2}"`); // 값 확인

    // **공백만 입력한 경우 체크**
    if (email1 === "" || email2 === "") {  
        alert("이메일을 올바르게 입력해주세요! (공백만 입력할 수 없습니다)");
        return false;
    }

    // **공백 포함 여부 검사** (입력값 내부에 공백이 포함되었는지 검사)
    if (/\s/.test(email1) || /\s/.test(email2)) {
        alert("이메일에는 공백을 포함할 수 없습니다!");
        return false;
    }

    // 이메일 앞부분: 영문, 숫자, 일부 특수문자 허용 (공백 X)
    const pattern1 = /^[a-zA-Z0-9._%+-]+$/;
    
    // 이메일 도메인 부분: 영문, 숫자, 점(.)과 하이픈(-) 허용 (첫 글자가 점이면 안 됨, 공백 X)
    const pattern2 = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 
    
    // 정규식 검사
    if (!pattern1.test(email1)) {
        alert("이메일 아이디(앞부분)를 올바르게 입력해주세요!");
        document.inputform.user_email1.focus();
        return false;
    } 
    if (!pattern2.test(email2)) {
        alert("이메일 도메인 부분을 올바르게 입력해주세요!");
        document.inputform.user_email2.focus();
        return false;
    }
    
    // 이메일 중복 확인
    const emailChk = document.getElementById("emailChk").innerText;
    if (emailChk.includes("등록된 이메일")) {
        alert("이미 등록된 이메일입니다. 다른 이메일을 사용하세요.");
        return false;
    }

    return true;
}

// 비밀번호 강도 체크 (정규식 포함)
function checkPasswordStrength(password) {
    const strength = document.getElementById("pwdStrength");
    // 약한 비밀번호 최소 8자 이상, 알파벳 1개 이상, 숫자 1개 이상 (특수문자 제외)
    const regexWeak = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/; 

	// 보통 비밀번호 : 최소 8자 이상, 알파벳 1개 이상, 숫자 1개 이상, 특수문자 1개 이상 포함
    const regexMedium = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/; 
    
    // 강력한 비밀번호 : 최소 12자 이상, 알파벳 1개 이상, 숫자 1개 이상, 특수문자 1개 이상 포함
    const regexStrong = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{12,}$/;

    if (regexStrong.test(password)) {
        strength.style.display = "block";
        strength.innerText = "강력한 비밀번호입니다.";
        strength.style.color = "#50858b";
		strength.style.fontSize = "13px"; 
		strength.style.paddingTop = "4px"; 
    } else if (regexMedium.test(password)) {
        strength.innerText = "보통 비밀번호입니다.";
		strength.style.display = "block";
        strength.style.color = "#ffc43d";
		strength.style.fontSize = "13px"; 
		strength.style.paddingTop = "4px";
    } else if (regexWeak.test(password)) {
        strength.style.display = "block";
        strength.innerText = "약한 비밀번호입니다.";
        strength.style.color = "rgba(255, 0, 0)";
		strength.style.fontSize = "13px";
		strength.style.paddingTop = "4px"; 
    } else {
        strength.style.display = "none";
    }

    // 비밀번호 규칙 메시지 체크
    const pwdChk = document.getElementById("pwdChk");
    if (password.length < 8 || !/[A-Za-z]/.test(password) || !/\d/.test(password) || !/[@$!%*#?&]/.test(password)) {
        pwdChk.innerHTML = '<div class="font13">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요.</div>';
        
    } else {
        pwdChk.innerHTML = ''; // 일치하면 경고 메시지 지우기
    }
}

// 비밀번호 일치 여부 체크
function checkPasswordMatch(rePassword) {
    const password = document.getElementById("cs_pwd").value; // 비밀번호 입력값 가져오기
    const re_cs_pwd = document.getElementById("pwdReChk");

    if (password !== rePassword) {
        re_cs_pwd.innerHTML = '<div class="font13">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>';
        // 입력 필드에 포커스를 주기
        document.getElementById("re_cs_pwd").focus();
    } else {
        re_cs_pwd.innerHTML = ''; // 일치하면 경고 메시지 지우기
    }
}

// 비밀번호 눈 아이콘 클릭시 숨김 해제기능
function passwordOne() {
    const passwordField = document.getElementById('cs_pwd');
    const toggleIcon = document.getElementById('togglePassword');

    // 비밀번호 타입을 'password' 또는 'text'로 토글
    if (passwordField.type === 'password') {
        passwordField.type = 'text'; // Show password
        toggleIcon.classList.remove('fa-eye-slash');
        toggleIcon.classList.add('fa-eye'); // Change icon to open eye
    } else {
        passwordField.type = 'password'; // Hide password
        toggleIcon.classList.add('fa-eye-slash');
        toggleIcon.classList.remove('fa-eye'); // Change icon to closed eye
    }
}

// 14세미만 가입불가 (달력제한)
// 페이지 로드 시에 14년 전 날짜를 계산하여 max 속성에 설정
window.onload = function() {
    const today = new Date(); // 오늘 날짜
    const year = today.getFullYear(); // 현재 연도
    const month = today.getMonth() + 1; // 현재 월 (0부터 시작하므로 +1)
    const day = today.getDate(); // 오늘 날짜

    // 만 14세 이상을 위한 기준 날짜 (현재 날짜에서 14년을 빼기)
    const minDate = new Date(year - 14, month - 1, day); // 14년 전 날짜
    const minDateString = minDate.toISOString().split("T")[0]; // ISO 형식으로 변환 후 yyyy-mm-dd로 포맷팅

    // 생년월일 입력 칸에 max 속성 설정
    document.getElementById("cs_birth").setAttribute("max", minDateString);
};

function uniqueCheck(path, type) {
    let value;
    
    if (type === "phone") {
        value = document.inputform.user_hp1.value + "-" + 
                document.inputform.user_hp2.value + "-" + 
                document.inputform.user_hp3.value;
    } else if (type === "email") {
        value = document.inputform.user_email1.value + "@" + 
                document.inputform.user_email2.value;
    } else {
        alert("잘못된 type 입력:"+ type);
        return;
    }

    $.ajax({
        type: "POST",
        url: path + "/uniqueCheck.do",  // 통합된 컨트롤러 매핑
        data: { type: type, value: value },  // type과 value 전달
        dataType: "json",
        success: function(response) {
            let resultElementId = (type === "phone") ? "phoneChk" : "emailChk";
            let resultElement = $(`#${resultElementId}`);
            resultElement.css("display", "block");

            let successMessage = "";
	        let errorMessage = "";
	
	        if (type === "phone") {
	            successMessage = "사용 가능한 전화번호입니다.";
	            errorMessage = "이미 등록된 전화번호입니다.";
	        } else if (type === "email") {
	            successMessage = "사용 가능한 이메일입니다.";
	            errorMessage = "이미 등록된 이메일입니다.";
	        }
	
	        if (response.count === 0) {
	            resultElement.find(".font14").css("color", "#50858b").text(successMessage);
	        } else {
	            resultElement.find(".font14").css("color", "rgba(255, 0, 0)").text(errorMessage);
	        }
        },
        error: function() {
	        alert("오류 발생");
	    }
    });
}


// 이메일 입력 필드 수정 시 select 값 자동 변경
function checkCustomEmail() {
    const emailSelect = document.inputform.user_email3;
    const emailInput = document.inputform.user_email2;

    if (emailInput.value !== emailSelect.value) {
        emailSelect.value = "";  // select를 "직접 입력"으로 변경
    }
}

// 이메일 선택시 처리
function selectEmailChk() {
    const selectedEmail = document.inputform.user_email3.value;
    const emailInput = document.inputform.user_email2;

    if (selectedEmail === "") { // "직접입력" 선택시
        emailInput.value = "";
        emailInput.focus();
    } else {
        emailInput.value = selectedEmail;
    }
}


// 이메일 형식 체크 (정규식)
function validateEmail(email) {
    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return regex.test(email);
}

