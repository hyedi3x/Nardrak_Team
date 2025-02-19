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
    
    	// heart-checkbox 클래스를 가진 모든 체크박스 요소를 선택(값이 여러개라 배열로 나옴)
    	const heartCheckboxes = document.querySelectorAll(".heart-checkbox");
    	    
    	// 각 체크박스에 대해 기능 반복
	    heartCheckboxes.forEach((checkbox) => {
	        const label = checkbox.nextElementSibling; // 체크박스 다음에 있는 <label> 요소 (하트 아이콘이 포함됨)
	        const icon = label.querySelector("i"); // <label> 내에 있는 <i> 태그 (Font Awesome 하트 아이콘)
	
	        // 체크박스 상태가 변경될 때마다 실행되는 이벤트 리스너(체크 상태에 따라 하트 아이콘 모양 변경)
	        checkbox.addEventListener("change", function (event) {
	        
	        	// 로그인 상태 확인
	        	 if (!isLogin) {
	                // 로그인되지 않은 상태라면 기본 동작을 막고, 경고 메시지 띄우기
	                event.preventDefault(); // 이벤트의 기본 동작 취소
	                alert("로그인 후 찜하기 기능을 사용할 수 있습니다.");
	                window.location="/nardrak_mvc/login.do"; // 로그인 페이지로 리다이렉트
	                return;	// 이후 코드를 실행하지 않고 함수 종료
	            }
	        
	        	// 체크박스가 위치한 카드에서 필요한 데이터를 추출
	        	var destId = $(this).closest('.card').find('.dest-id').val(); 			// 여행지 ID
			    var destName = $(this).closest('.card').find('.card-title').text();		// 여행지 이름
			    var imageUrl = $(this).closest('.card').find('img').attr('src');		// 여행지 이미지 URL
			    var description = $(this).closest('.card').find('.card-text').text();	// 여행지 설명
			    var isAdd = checkbox.checked;
				
	            // 하트 상태에 따라 찜하기 추가/삭제 AJAX 요청
	            if (checkbox.checked) {
	                // 찜하기 추가 요청
	                $.ajax({
	                    url: "/nardrak_mvc/favorite.fa",
	                    method: "POST",
	                    data: {
	                    	dest_id: destId,
	                        dest_name: destName,
	                        image_url: imageUrl,
	                        description: description,
	                        isAdd: isAdd
	                    },
	                    success: function(response) {
	                        alert("찜하기 추가 성공");
	                    },
	                    error: function(error) {
	                        alert("찜하기 추가 실패");
	                        console.log(error);
	                    }
	                });
	            }
	            else {
				    // 찜하기 삭제
				    $.ajax({
				        url: "/nardrak_mvc/favorite.fa",
				        method: "POST",
				        data: {
				            dest_id: destId,
	                        dest_name: destName,
	                        image_url: imageUrl,
	                        description: description,
	                        isAdd: false
				        },
				        success: function(response) {
				            alert("찜하기 삭제 성공");
				        },
				        error: function(error) {
				            alert("찜하기 삭제 실패", error);
	                        console.log(error);
				        }
			    	});
			    }
	            
	             // 하트 아이콘 색상 변경 : 체크 상태에 따라 하트 아이콘 스타일 변경
	            if (checkbox.checked) {
	                icon.classList.remove("fa-regular");
	                icon.classList.add("fa-solid");
	            } else {
	                icon.classList.remove("fa-solid");
	                icon.classList.add("fa-regular");
	            }
	        });

	        // 라벨(하트 아이콘) 클릭 시 체크박스 상태 변경
	        label.addEventListener("click", function () {
	            checkbox.checked = !checkbox.checked;		// 체크박스 상태 반전
	            checkbox.dispatchEvent(new Event("change")); // 상태 변경 이벤트 발생('change' 이벤트 리스너 실행)
	        });
    	});
});