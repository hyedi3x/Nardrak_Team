const header = document.querySelector("#header");						// 메뉴 전체 영역 (배경 이미지 포함)
const menuButton = document.querySelector("#menu-button");				// 햄버거 메뉴 버튼
const sideMenu = document.querySelector("#side");						// 슬라이드 메뉴 (햄버거 메뉴 클릭 시 표시되는 메뉴)
const closeButton = document.querySelector("#close-btn");				// 슬라이드 메뉴 닫기 버튼 (X 버튼)

// 햄버거 버튼 클릭 시 슬라이드 메뉴 열기
menuButton.addEventListener("click", () => {
    sideMenu.classList.add("active");  // 슬라이드 메뉴를 활성화 (화면에 표시)
});

// 닫기(&times - X) 버튼 클릭 시 슬라이드 메뉴 닫기
closeButton.addEventListener("click", () => {
    sideMenu.classList.remove("active");  // 슬라이드 메뉴를 비활성화 (숨기기)
});

// 메뉴 외부 클릭 시 슬라이드 메뉴 닫기
document.addEventListener("click", (event) => {
    // 클릭한 위치가 슬라이드 메뉴나 햄버거 버튼이 아니라면 메뉴 닫기
    if (!sideMenu.contains(event.target) && event.target !== menuButton) {
        sideMenu.classList.remove("active"); // 슬라이드 메뉴 숨기기
    }
});