const menu = document.querySelector(".menu");							// 메뉴 전체 영역 (배경 이미지 포함)
const menuButton = document.querySelector("#menu-button");				// 햄버거 메뉴 버튼
const sideMenu = document.querySelector("#side");						// 슬라이드 메뉴 (햄버거 메뉴 클릭 시 표시되는 메뉴)
const closeButton = document.querySelector("#close-btn");				// 슬라이드 메뉴 닫기 버튼 (X 버튼)

const arrows = document.querySelectorAll(".fa-angle-down");				// 화살표 아이콘 (슬라이드 메뉴에서 열기/닫기)
const sideTravelMenu = document.querySelectorAll(".side-travel-menu");	// 슬라이드 여행 관련 하위 메뉴

const travelItems = document.querySelectorAll(".travel li");			// travel 메뉴의 li 요소 (상위 메뉴 항목들)

// 햄버거 버튼 클릭 시 슬라이드 메뉴 열기
menuButton.addEventListener("click", () => {
    sideMenu.classList.add("active");  // 슬라이드 메뉴를 활성화 (화면에 표시)
    menu.classList.add("opacity"); // 배경 이미지에 투명도 적용
});

// 닫기(&times - X) 버튼 클릭 시 슬라이드 메뉴 닫기
closeButton.addEventListener("click", () => {
    sideMenu.classList.remove("active");  // 슬라이드 메뉴를 비활성화 (숨기기)
    menu.classList.remove("opacity"); // 배경 이미지의 투명도 제거
});

// 메뉴 외부 클릭 시 슬라이드 메뉴 닫기
document.addEventListener("click", (event) => {
    // 클릭한 위치가 슬라이드 메뉴나 햄버거 버튼이 아니라면 메뉴 닫기
    if (!sideMenu.contains(event.target) && event.target !== menuButton) {
        sideMenu.classList.remove("active"); // 슬라이드 메뉴 숨기기
        menu.classList.remove("opacity"); // 배경 이미지의 투명도 제거
    }
});

// 각 화살표 클릭 시 서브 메뉴 열기/닫기
arrows.forEach((arrow, index) => {
    arrow.addEventListener("click", () => {
        if (arrow.classList.contains("fa-angle-down")) {
            arrow.classList.remove("fa-angle-down"); // 화살표 방향을 아래에서 위로 변경
            arrow.classList.add("fa-angle-up");  // 화살표 방향을 위로 변경
             
            // 해당 서브 메뉴 열기
            sideTravelMenu[index].classList.add("active"); // 서브 메뉴 활성화
        } else {
            arrow.classList.remove("fa-angle-up"); // 화살표 방향을 위에서 아래로 변경
            arrow.classList.add("fa-angle-down"); // 화살표 방향을 아래로 변경
             
            // 해당 서브 메뉴 닫기
            sideTravelMenu[index].classList.remove("active"); // 서브 메뉴 숨기기
        }
    });
});

// travel 메뉴 항목에 마우스를 오버/아웃 시 서브 메뉴 표시/숨기기
travelItems.forEach((item, index) => {
    const submenu = item.querySelector(".travel-menu"); // travel 메뉴 항목 내의 하위 메뉴 찾기

    if (submenu) {
        // 마우스가 항목 위에 올라갔을 때
        item.addEventListener("mouseover", () => {
            submenu.classList.add("active"); // 하위 메뉴 활성화
            travelItems[index].classList.add("select"); // 상위 메뉴 항목에 선택된 스타일 추가
            menu.classList.add("active"); // 메뉴 활성화
            menu.classList.add("opacity"); // 배경 이미지에 투명도 적용
        });

        // 마우스가 항목에서 벗어났을 때
        item.addEventListener("mouseout", () => {
            submenu.classList.remove("active"); // 하위 메뉴 비활성화
            travelItems[index].classList.remove("select"); // 상위 메뉴 항목에서 선택된 스타일 제거
            menu.classList.remove("active"); // 메뉴 비활성화
            menu.classList.remove("opacity"); // 배경 이미지의 투명도 제거
        });
    }
});
