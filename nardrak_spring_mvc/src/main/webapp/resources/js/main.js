/**
 * 
 */
document.addEventListener("DOMContentLoaded", function () {
    const swiper = new Swiper(".swiper", {
        loop: true, // 무한 루프
        autoheight: true,
        
        // 자동재생 여부
        autoplay: {
            delay: 3000, // 3초마다 자동 슬라이드
            disableOnInteraction: false, // 스와이프해도 자동 재생 유지
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        slidesPerView : 3,
        spaceBetween: 10,
        pagination: {
            el: ".swiper-pagination",
            clickable: true, // 점을 클릭하면 이동
        },
        effect: "slide", // 기본 슬라이드 효과
        });
});

