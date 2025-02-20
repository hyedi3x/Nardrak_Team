/**
 * 
 */
 
 
// 1. 모든 페이지 번호(<a> 태그)를 선택하고, 각각에 대해 이벤트 리스너를 추가
document.querySelectorAll(".pagination a").forEach(page => {
    page.addEventListener("click", function (e) {
        e.preventDefault(); // 기본 링크 이동 동작을 막음 (페이지가 새로고침되지 않도록 방지)

        // 2. 현재 활성화된 페이지에서 'active' 클래스를 제거 (이전 선택된 페이지 비활성화)
        document.querySelector(".pagination .active").classList.remove("active");

        // 3. 클릭한 페이지(<a> 태그)에 'active' 클래스를 추가하여 현재 페이지로 설정
        this.classList.add("active");

        // 4. 선택한 페이지의 data-page 값을 가져옴
        let selectedPage = this.dataset.page;
        console.log(`선택한 페이지: ${selectedPage}`); // 선택한 페이지 번호를 콘솔에 출력

        // 5. 페이지 변경 시 데이터 로딩 등의 추가 로직을 여기에 구현 가능
        // 예: fetch()를 사용해 새로운 페이지 데이터를 가져오는 기능 추가 가능
    });
});
