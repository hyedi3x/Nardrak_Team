/**
 * 
 */
 
 /* 첫번째 Swiper 초기화 */
    const swiper1 = new Swiper(".mySwiper1", { // .mySwiper에 html 요소 적용
	   loop: true,  // 무한 루프 설정
	   slidesPerView: 1, // 한 번에 보이는 슬라이드 개수
	   spaceBetween: 600, // 각 슬라이드 사이 간격
	   pagination: {
	       el: '.mySwiper1 .swiper-pagination', // 페이지네이션(슬라이드에 대한 작은 버튼들)을 표시하고, 그 버튼을 클릭할 수 있게 만들어줌
	       clickable: true,
	   },   
	   loop: true,  // 무한 루프 설정
       autoplay: {
          delay: 5000,  // 5초마다 자동으로 슬라이드 이동
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
    
    /* 찜하기 관련 기능 */
    document.addEventListener("DOMContentLoaded", function () {
    // 로그인 상태 확인 (isLogin 변수를 서버에서 전달받거나, 세션 상태 확인)
    
    // 찜 목록을 서버에서 받아오기.
    $.ajax({
        url: path + "/getFavoriteList.fa", // 찜 목록을 가져오는 requestMapping한 URL
        method: "POST",
        dataType: "json",
        success: function(favorites) {
            // 찜한 여행지 목록을 받아와서 해당하는 체크박스를 체크합니다.
            favorites.forEach(function(favorite) {
                // 찜한 여행지 이름을 기준으로 체크박스를 찾고 체크합니다.
                document.querySelectorAll(".heart-checkbox").forEach(function(checkbox) {
                    const label = checkbox.nextElementSibling; // 체크박스 다음에 있는 <label> 요소
                    const icon = label.querySelector("i"); // 하트 아이콘

                    // 각 체크박스가 해당 여행지에 해당하는지 확인
                    const destName = checkbox.closest('.card').querySelector('.card-title').textContent;

                    if (destName === favorite.dest_name) {
                        checkbox.checked = true; // 체크박스를 체크
                        icon.classList.remove("fa-regular");
                        icon.classList.add("fa-solid");
                    }
                });
            });
        },
        error: function(xhr, status, error) {
            console.error("찜 목록을 가져오는데 실패했습니다. 상태:", status, "오류:", error); // 디버깅용 출력
            alert("찜 목록을 가져오는데 실패했습니다.");
        }
    });

    // 하트 체크박스를 클릭할 때의 처리
    const heartCheckboxes = document.querySelectorAll(".heart-checkbox");
    heartCheckboxes.forEach((checkbox) => {
        const label = checkbox.nextElementSibling;
        const icon = label.querySelector("i");

        checkbox.addEventListener("change", function (event) {
            if (!isLogin) {
                event.preventDefault();
                alert("로그인 후 찜하기 기능을 사용할 수 있습니다.");
                window.location = "/nardrak_mvc/login.do";
                return;
            }
            
            if(!isCustomer){
            	event.preventDefault();
            	alert("고객만 찜하기를 할 수 있습니다.");
            	return;
            }

            const destName = $(this).closest('.card').find('.card-title').text();
            const imageUrl = $(this).closest('.card').find('img').attr('src');
            const description = $(this).closest('.card').find('.card-text').text();
            const isAdd = checkbox.checked;

            // 찜하기 추가/삭제 AJAX 요청
            $.ajax({
                url: path + "/favorite.fa",
                method: "POST",
                data: {
                    dest_name: destName,
                    image_url: imageUrl,
                    description: description,
                    isAdd: isAdd
                },
                dataType: "json",
                success: function(response) {
                    alert(response.message);
                },
                error: function () {
                    alert("에러입니다.");
                }
            });

            // 하트 아이콘 스타일 변경
            if (checkbox.checked) {
                icon.classList.remove("fa-regular");
                icon.classList.add("fa-solid");
            } else {
                icon.classList.remove("fa-solid");
                icon.classList.add("fa-regular");
            }
        });

        label.addEventListener("click", function () {
            checkbox.checked = !checkbox.checked;
            checkbox.dispatchEvent(new Event("change"));
        });
    });
});
