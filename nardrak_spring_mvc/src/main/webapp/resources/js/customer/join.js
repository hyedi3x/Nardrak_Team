// 아이디 중복확인 버튼 클릭시
function confirmId(path) {
    if (!document.inputform.cs_id.value) {
        alert("아이디를 입력하세요!!");
        document.inputform.cs_id.focus();
        return false;
    }
    let url = path+"/idConfirmAction.do?cs_id=" + document.inputform.cs_id.value;
    window.open(url, "confirm", "menubar=no, width=500, height=400");
}

// 아이디 중복 확인후 cs_id 적용
function setUserid(userid) {
	opener.document.inputform.cs_id.value = userid;
	opener.document.inputform.hiddenUserId.value = 1;
	self.close();
}

// 기존 메시지 숨기기
function hideAllErrorMessages() {
    document.getElementById("idChk").style.display = "none";
    document.getElementById("pwdChk").style.display = "none";
    document.getElementById("nameChk").style.display = "none";
    document.getElementById("phoneChk").style.display = "none";
    document.getElementById("emailChk").style.display = "none";
    document.getElementById("birthChk").style.display = "none";
    document.getElementById("addressChk").style.display = "none";
}

// 오류 메시지 출력
function showErrorMessage(id, message) {
    const element = document.getElementById(id);
    element.style.display = "block";
    element.innerText = message;
}


// 비밀번호 눈 아이콘 클릭시 숨김 해제기능
function PasswordOne() {
    const passwordField = document.getElementById('cs_pwd');
    const toggleIcon = document.getElementById('togglePassword');

    // 비밀번호 타입을 'password' 또는 'text'로 토글
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        toggleIcon.classList.remove('fa-eye');
        toggleIcon.classList.add('fa-eye-slash'); // 아이콘을 눈 감은 모양으로 변경
    } else {
        passwordField.type = 'password';
        toggleIcon.classList.remove('fa-eye-slash');
        toggleIcon.classList.add('fa-eye'); // 아이콘을 원래의 눈 모양으로 변경
    }
}

// 비밀번호 강도 체크 (정규식 포함)
function checkPasswordStrength(password) {
    const strength = document.getElementById("pwdStrength");
    const regexWeak = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{6,}$/; // 약한 비밀번호 (영문+숫자)
    const regexMedium = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/; // 보통 비밀번호 (특수문자 포함)
    const regexStrong = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{12,}$/; // 강력한 비밀번호 (길이 + 복잡성)

    if (regexStrong.test(password)) {
        strength.style.display = "block";
        strength.innerText = "강력한 비밀번호입니다.";
        strength.style.color = "green";
    } else if (regexMedium.test(password)) {
        strength.style.display = "block";
        strength.innerText = "보통 비밀번호입니다.";
        strength.style.color = "orange";
    } else if (regexWeak.test(password)) {
        strength.style.display = "block";
        strength.innerText = "약한 비밀번호입니다.";
        strength.style.color = "red";
    } else {
        strength.style.display = "none";
    }

    // 비밀번호 규칙 메시지 체크
    const pwdChk = document.getElementById("pwdChk");
    if (password.length < 8 || !/[A-Za-z]/.test(password) || !/\d/.test(password) || !/[@$!%*#?&]/.test(password)) {
        pwdChk.style.display = "block";
    } else {
        pwdChk.style.display = "none";
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


// 이메일 선택시 처리
function selectEmailChk() {
    const selectedEmail = document.inputform.user_email3.value;
    const emailInput = document.inputform.user_email2;

    if (selectedEmail === "0") { // "직접입력" 선택시
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

// 회원가입 체크 함수
function signlnCheck() {
    hideAllErrorMessages();
 	
    // 아이디 유효성 체크
    const userId = document.inputform.cs_id.value;
    if (!userId) {
        showErrorMessage("idChk", "아이디를 입력하세요!");
        return false;
    }

    // 비밀번호 유효성 체크
    const password = document.inputform.cs_pwd.value;
    if (!password || password.length < 8) {
        showErrorMessage("pwdChk", "비밀번호는 8자 이상이어야 합니다!");
        return false;
    }

    // 전화번호 유효성 체크
    const phone = document.inputform.user_hp2.value + document.inputform.user_hp3.value;
    if (!phone || phone.length !== 8) {
        showErrorMessage("phoneChk", "전화번호를 올바르게 입력해주세요!");
        return false;
    }

    // 이메일 유효성 체크
    const email = document.inputform.user_email1.value + "@" + document.inputform.user_email2.value;
    if (!validateEmail(email)) {
        showErrorMessage("emailChk", "이메일을 올바르게 입력해주세요!");
        return false;
    }

    return true;
}

