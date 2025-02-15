// AJAX 요청 함수
function sendRequest(callback, url, method, params) {
    // 서버와 비동기 통신을 수행 
    let httpRequest = new XMLHttpRequest();   // XMLHttpRequest(XHR)는 브라우저와 서버 간 비동기적으로 데이터를 주고받을 수 있도록 해주는 API

	// onreadystatechange : 벤트 핸들러를 설정하여 요청 상태(readyState)가 변화할 때마다 실행
    httpRequest.onreadystatechange = function () {
        if (httpRequest.readyState === 4) { // 요청 완료
            if (httpRequest.status === 200) { // 응답 정상, 콜백 함수 실행 
                callback(httpRequest);
            } else {
                console.error("AJAX 요청 실패: 상태 코드", httpRequest.status);
            }
        }
    };

    httpRequest.open(method, url, true);    // 요청 (매개변수 | HTTP 메서드, 요청할 URL, 비동기 여부)
    // Content-Type을 application/x-www-form-urlencoded로 지정, 폼 데이터를 전송하는 방식과 동일하게 서버에 데이터를 전달함.
    // POST 요청을 보낼 때, 서버가 데이터를 "key=value&key2=value2" 형식으로 해석
    httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  // 요청 헤더 설정
    httpRequest.send(params);  // 요청 서버로 전송(params 값을 서버에 전송)
}


// load 함수 : myInfo_leftCs.jsp a onclick="load()"
// 왼쪽 메뉴 탭 로드 
function load(url){
	// sendRequest(callback, url, method, params) {}
	sendRequest(load_infoMenu, url, "GET", "");
};

// 콜백 함수 
function load_infoMenu(httpRequest) {
	let infoMenu = document.getElementById("infoMenu");
			infoMenu.innerHTML = httpRequest.responseText;   // responseText: 서버에서 응답한 HTML 문자열
};

