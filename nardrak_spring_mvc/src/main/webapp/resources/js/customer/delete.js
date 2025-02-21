/**
 * 일반회원탈퇴 js
 */
 
function submitForm() {
    // 약관 동의 여부 체크
    var agreeChecked = document.getElementById("agree1").checked;

    // 글자 수 제한(한글 기준)
    const etcCmmtLimit = 80;
    
    // 기타 사유 글자 수
    var etcCmmt = document.getElementById("etcCmmt").value.trim();
    const etcLength = getKoreanLength(etcCmmt);

    // 탈퇴 사유 선택 여부 체크
    var reasonChecked = false;
    var reasonRadios = document.getElementsByName("levCd");
    for (var i = 0; i < reasonRadios.length; i++) {
        if (reasonRadios[i].checked) {
            reasonChecked = true;
            break;
        }
    }

    // 약관에 동의하지 않았거나, 탈퇴 사유를 선택하지 않은 경우
    if (!agreeChecked) {
        alert("탈퇴 약관에 동의해주세요.");
        document.getElementById("agree1").focus();
        return false; // 폼 제출을 막음
    }

    if (!reasonChecked) {
        alert("탈퇴 사유를 선택해주세요.");
        return false; // 폼 제출을 막음
    }

    if (etcLength > etcCmmtLimit) {
        alert("탈퇴 사유는 80자 이내로 입력해야 합니다.");
        document.getElementById("etcCmmt").focus();
        return false; // 폼 제출을 막음
    }

    // 모든 조건을 만족하면 폼을 제출
    return true;
}


function myInfoBTN(path){
	if(confirm('마이페이지로 돌아가시겠습니까?')){
		window.location=path+"/myInfo.do";
	}
}

// 한글 글자 수 계산 함수 (한글/영어 각각 다른 계산)
function getKoreanLength(str) {
    let length = 0;
    for (let i = 0; i < str.length; i++) {
        // 한글은 삼 바이트, 나머지는 한 바이트로 계산
        if (/[\uac00-\ud7af]/.test(str[i])) {	//\uac00(가)부터 \ud7af(힣)까지
            length += 3; // 한글 글자는 3으로 계산
        } else {
            length += 1; // 영어 및 기타 문자는 1로 계산
        }
    }
    return length;
}

// 글자 수 업데이트 함수
function updateTxtCount() {
    var etcCmmt = document.getElementById("etcCmmt").value.trim();
    const maxLength = 80; // 최대 글자 수
    const etcLength = getKoreanLength(etcCmmt);

    // 글자 수 표시 업데이트
    document.getElementById("txtCount").textContent = etcLength + "자 / " + maxLength + "자";

    // 글자 수 제한을 넘었을 때 경고
    if (etcLength > maxLength) {
        document.getElementById("txtCount").style.color = "red";
    } else {
        document.getElementById("txtCount").style.color = "black";
    }
}