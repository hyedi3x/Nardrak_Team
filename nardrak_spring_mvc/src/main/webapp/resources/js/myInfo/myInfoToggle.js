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

