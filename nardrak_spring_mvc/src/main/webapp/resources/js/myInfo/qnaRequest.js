/*
 * qnaRequest.js
 */
 
// 한글 글자 수 계산 함수 (한글/영어 각각 다른 계산)
function getKoreanLength(str) {
    let length = 0;
    for (let i = 0; i < str.length; i++) {
        // 한글은 삼 바이트, 나머지는 한 바이트로 계산
        if (/[\uac00-\ud7af]/.test(str[i])) {
            length += 3; // 한글 글자는 3으로 계산
        } else {
            length += 1; // 영어 및 기타 문자는 1로 계산
        }
    }
    return length;
 }
            
 // 폼 유효성 검사를 수행하는 함수
function requestInCheck() {
    // 제목, 유형, 내용 필드 값 가져오기
    var title = document.getElementById("i_title").value.trim();
    var category1 = document.getElementById("i_category1").value.trim();
    var category2 = document.getElementById("i_category2").value.trim();
    var content = document.getElementById("i_content").value.trim();

	// 글자 수 제한(한글 기준)
	const titleLimit = 80;
    const contentLimit = 200;
    
    // 제목과 내용의 글자 수
    const titleLength = getKoreanLength(title);
    const contentLength = getKoreanLength(content);
            
    // 제목이 비어 있으면 경고 메시지
    if (!title) {
        alert("문의 제목을 입력해주세요.");
        document.getElementById("i_title").focus();
        return false;
    }
    
    // 글자 수 제한 초과 여부 확인
    if (titleLength > titleLimit) {
        alert("제목은 80자 이내로 입력해야 합니다.");
        document.getElementById("i_title").focus();
        return false;
    }

    // 문의 유형이 선택되지 않으면 경고 메시지
    if (!category1) {
        alert("문의 유형을 선택해주세요.");
        document.getElementById("i_category1").focus();
        return false;
    }

    // 첫 번째 유형이 "국내여행"일 때, 두 번째 유형도 선택해야 하므로 체크
    if (category1 === "국내여행" && !category2) {
        alert("두 번째 유형을 선택해주세요.");
        document.getElementById("i_category2").focus();
        return false;
    }
    
    // 문의 내용이 비어 있으면 경고 메시지
    if (!content) {
        alert("문의 내용을 입력해주세요.");
        document.getElementById("i_content").focus();
        return false;
    }
    
    if (contentLength > contentLimit) {
        alert("문의 내용은 200자 이내로 입력해야 합니다.");
        document.getElementById("i_content").focus();
        return false;
    }
    
    // 모든 필드가 유효하면 폼 제출을 허용
    return true;
}