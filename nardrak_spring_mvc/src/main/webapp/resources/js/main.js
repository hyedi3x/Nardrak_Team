document.addEventListener("DOMContentLoaded", function () {
    // Swiper 초기화
    const swiper = new Swiper(".swiper", {
        loop: true, // 무한 루프
        autoheight: true, // 높이 자동 조절
        autoplay: {
            delay: 4000, // 4초마다 자동 슬라이드
            disableOnInteraction: false, // 사용자 인터랙션 후 자동 재생 유지
        },
        pagination: {
            el: ".swiper-pagination", // 페이지네이션 요소
            clickable: true, // 클릭 가능
        },
        breakpoints: {
            // 화면 크기에 따른 슬라이드 개수 설정
            0: { // 0px ~ 767px
                slidesPerView: 3, // 3개 슬라이드 표시
            },
            768: { // 768px ~ 1799px
                slidesPerView: 4, // 4개 슬라이드 표시
            },
            1800: { // 1800px ~ 2099px
                slidesPerView: 5, // 5개 슬라이드 표시
            },
            2100: { // 2100px 이상
                slidesPerView: 6, // 6개 슬라이드 표시
            },
        },
    });
});