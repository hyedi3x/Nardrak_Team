/**
 * 일반회원탈퇴 js
 */
 
    function submitForm() {
        // 약관 동의 여부 체크
        var agreeChecked = document.getElementById("agree1").checked;

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
            return false; // 폼 제출을 막음
        }

        if (!reasonChecked) {
            alert("탈퇴 사유를 선택해주세요.");
            return false; // 폼 제출을 막음
        }

        // 모든 조건을 만족하면 폼을 제출
        return true;
    }
