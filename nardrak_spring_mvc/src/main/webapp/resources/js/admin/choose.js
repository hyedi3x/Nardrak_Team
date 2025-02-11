/**
 * 
 */
 
 /* 첫번째 Swiper 초기화 */
    const swiper1 = new Swiper(".mySwiper1", { // .mySwiper에 html 요소 적용
	   loop: true, // 루프 모드
	   slidesPerView: 1, // 한 번에 보이는 슬라이드 개수
	   spaceBetween: 600, // 각 슬라이드 사이 간격
	   pagination: {
	       el: '.mySwiper1 .swiper-pagination', // 페이지네이션(슬라이드에 대한 작은 버튼들)을 표시하고, 그 버튼을 클릭할 수 있게 만들어줌
	       clickable: true,
	   },   
	   loop: true,  // 무한 루프 설정
       autoplay: {
          delay: 5000,  // 2초마다 자동으로 슬라이드 이동
          disableOnInteraction: false,  // 사용자가 슬라이드를 조작해도 자동 재생을 멈추지 않도록 설정
       },   
	   navigation: {
	       nextEl: '.mySwiper1 .swiper-button-next',
	       prevEl: '.mySwiper1 .swiper-button-prev',
    },
});
 
 
 /* 두번째 Swiper2 초기화 */
 	 const swiper2 = new Swiper(".mySwiper2", { // .mySwiper에 html 요소 적용
      slidesPerView: 3, // 한번에 보여지는 슬래이드 개수 3개로 설정
      spaceBetween: 30, // 각 슬라이드 사이의 간격 30px
      freeMode: true,   // 슬라이드 자유롭게 끌어서 이동할 수 있도록 설정
      pagination: {	    
        el: ".mySwiper2-pagination",  // 페이지네이션(슬라이드에 대한 작은 버튼들)을 표시하고, 그 버튼을 클릭할 수 있게 만들어줌
        clickable: true, // 첫 번째 버튼을 클릭하면 첫 번째 슬라이드로, 두 번째 버튼을 클릭하면 두 번째 슬라이드로 이동
      },
      loop: true,  // 무한 루프 설정
      autoplay: {
        delay: 3500,  // 2초마다 자동으로 슬라이드 이동
        disableOnInteraction: false,  // 사용자가 슬라이드를 조작해도 자동 재생을 멈추지 않도록 설정
      },
    });
    
 
 
 /* 세번째 Swiper3 초기화 */
 	 const swiper3 = new Swiper(".mySwiper3", { // .mySwiper에 html 요소 적용
      slidesPerView: 2, // 한번에 보여지는 슬래이드 개수 2개로 설정
      spaceBetween: 30, // 각 슬라이드 사이의 간격 30px
      freeMode: true,   // 슬라이드 자유롭게 끌어서 이동할 수 있도록 설정
      pagination: {	    
        el: ".mySwiper3-pagination",  // 페이지네이션(슬라이드에 대한 작은 버튼들)을 표시하고, 그 버튼을 클릭할 수 있게 만들어줌
        clickable: true, // 첫 번째 버튼을 클릭하면 첫 번째 슬라이드로, 두 번째 버튼을 클릭하면 두 번째 슬라이드로 이동
      },
    });   