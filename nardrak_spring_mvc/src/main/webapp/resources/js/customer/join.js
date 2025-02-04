// 아이디 중복확인 버튼 클릭시
function confirmId() {
    if (!document.inputform.cs_id.value) {
        alert("아이디를 입력하세요!!");
        document.inputform.cs_id.focus();
        return false;
    }
    let url = "/nardrak_spring_mvc/idConfirmAction.do?cs_id=" + document.inputform.cs_id.value;
    window.open(url, "confirm", "menubar=no, width=500, height=400");
}

// 아이디 중복 확인후 cs_id 적용
function setUserid(userid) {
	opener.document.inputform.cs_id.value = userid;
	opener.document.inputform.hiddenUserId.value = 1;
	self.close();
}