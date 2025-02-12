// DOMContentLoaded 이벤트 : HTML 문서의 모든 요소가 로드된 후 실행되도록 이벤트 리스너를 추가하는 코드.
document.addEventListener("DOMContentLoaded", function () {
    const myInfoLeft = document.querySelectorAll("#left_menubar h4");  // #left_menubar 안의 <h4> 태그들을 모두 선택

	// myInfoLeft에 들어 있는 모든 <h4> 태그를 하나씩 반복하며 header 변수에 저장.
    myInfoLeft.forEach(header => {
        // header.textContent(기존 텍스트) 옆에 방향 아이콘 추가
        header.innerHTML = `${header.textContent} <i class="fa-solid fa-angle-down"></i>`;

        // 클릭 이벤트 추가
        header.addEventListener("click", function () {
            const menuList = header.nextElementSibling;    // 해당 h4(header) 아래의 ul 요소 선택
            const icon = header.querySelector("i");        // 현재 h4 내부의 아이콘 선택
            const isVisible = menuList.style.display === "block";  // <ul>의 display 값이 "block"이면 → true (아이콘 오픈)

            // 모든 리스트 닫기
            document.querySelectorAll(".info_menu").forEach(menu => {
                menu.style.display = "none";
            });
            
            // 메뉴가 닫히면 모든 아이콘을 fa-angle-up → fa-angle-down으로 바꿈.
            document.querySelectorAll("#left_menubar h4 i").forEach(icon => {
                icon.classList.remove("fa-angle-up");
                icon.classList.add("fa-angle-down");
            });

            // 현재 리스트 토글
            if (!isVisible) {
                menuList.style.display = "block";
                icon.classList.remove("fa-angle-down");
                icon.classList.add("fa-angle-up");
            }
        });

        // 초기 메뉴 숨김 (페이지가 처음 로드될 때 모든 메뉴가 닫힘.)
        header.nextElementSibling.style.display = "none";
    });
});

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

