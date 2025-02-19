
function submitForm(formId, actionType) {
    const form = document.getElementById(formId);

    // actionType에 따라 form의 action을 다르게 설정
    if (actionType === 'update') {
        form.action = "updateImage.do";  // 수정
        form.submit();
    } else if (actionType === 'delete') {
        // 삭제 확인
        if (confirm("정말 삭제하시겠습니까?")) {
            form.action = "deleteImage.do";  // 삭제
            form.submit();
        }
    }
}