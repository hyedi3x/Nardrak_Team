<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/settings.jsp" %>        
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>서울 여행지 및 맛집</title>
    <link rel="stylesheet" href="styles.css"> <!-- 외부 스타일시트 링크 -->
    
    <!-- css -->
	<link rel="stylesheet" href="${path}/resources/css/customer/local/local.css">
    
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    
    <!-- JS -->
    <script src="${path}/resources/js/customer/trable.js" defer></script> 
    
</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %> 

<div>


<div class="name">
	<h3><i class="fa-solid fa-leaf"></i> 여행지 </h3>
	<div class="name_tag">
		<h align="left">#전체</h>
	</div>
</div>
<form action="submit.php" method="POST">
	 <div class="container">
        <div class="content">
            <div class="place-list">
                <a href="${path}/myeongdongPage.tr">
	                <div class="place">
	                    <div class="place-img">
	                        <img src="${path}/resources/image/customer/국내여행/명동.jpg" alt="명동">
	                    </div>
	                    <div class="place-text">
	                        <h3>명동</h3>
	                        <p>서울 종로구</p>
	                        <p>전세계인들의 관광지 1순위</p>
	                        <p style="color:4361ee;">#관광지 #맛집 #쇼핑</p>
	                    </div>
	                </div>
                </a>

                <div class="divider"></div>

                <div class="place">
                    <div class="place-img">
                        <img src="${path}/resources/image/customer/국내여행/63빌딩.jpg" alt="63빌딩">
                    </div>
                    <div class="place-text">
                        <h3>63빌딩</h3>
                        <p>서울시 영등포구 63로 50</p>
                        <p>서울의 대표적인 랜드마크로, 한강과 도심을 한눈에 조망할 수 있는 전망대</p>
                        <p style="color:4361ee;">#랜드마크 #서울야경 #전망대</p>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="place">
                    <div class="place-img">
                        <img src="${path}/resources/image/customer/국내여행/여의도공원.jpg" alt="여의도공원">
                    </div>
                    <div class="place-text">
                        <h3>여의도공원</h3>
                        <p>서울시 영등포구 여의도동</p>
                        <p>서울 도심 속에서 자연을 즐길 수 있는 대규모 공원</p>
                        <p style="color:4361ee;">#도심속공원 #산책 #휴식</p>
                    </div>
                </div>
                
                <div class="divider"></div>
		
				<div class="place">
				    <div class="place-img">
				        <img src="${path}/resources/image/customer/국내여행/한강공원.jpg" alt="한강공원">
				    </div>
				    <div class="place-text">
				        <h3>한강공원</h3>
				        <p>서울시 전역 (여의도, 반포, 뚝섬 등)</p>
				        <p>강변 산책과 자전거 라이딩, 피크닉 등을 즐길 수 있는 명소</p>
				        <p style="color:4361ee;">#강변산책#자전거#피크닉</p>
				        <input type="hidden" name="place[]" value="한강공원,서울시 전역,서울의 대표적인 강변 휴식 공간">
				    </div>
				</div>
				
				<div class="divider"></div>
				
				<div class="place">
				    <div class="place-img">
				        <img src="${path}/resources/image/customer/국내여행/남산타워2.jpg" alt="N서울타워">
				    </div>
				    <div class="place-text">
				        <h3>N서울타워</h3>
				        <p>서울시 용산구 남산공원길 105</p>
				        <p>서울의 대표적인 야경 명소로, 다양한 문화공간이 있는 랜드마크 타워</p>
				        <p style="color:4361ee;">#야경명소#서울전망#연인의성지</p>
				        <input type="hidden" name="place[]" value="N서울타워,서울시 용산구 남산공원길 105,서울의 대표적인 야경 명소">
				    </div>
				</div>
				
				<div class="divider"></div>
				
				<div class="place">
				    <div class="place-img">
				        <img src="${path}/resources/image/customer/국내여행/광화문 광장.jpg" alt="광화문광장">
				    </div>
				    <div class="place-text">
				        <h3>광화문광장</h3>
				        <p>서울시 종로구 세종대로 172</p>
				        <p>서울의 중심부에 위치한 역사적 장소로, 다양한 문화행사와 전시가 열리는 시민들의 대표적인 공간</p>
				        <p style="color:4361ee;">#서울의중심#역사와문화#광장</p>
				        <input type="hidden" name="place[]" value="광화문광장,서울시 종로구 세종대로 172,서울의 중심 역사 공간">
				    </div>
            	</div>
        	</div>
        </div>
    </form>
    
       <div class="tag-box">
           <h4>태그</h4>
               <div class="tag-list">
                    <span>#전체</span>
                    <span>#서울</span>
                    <span>#부산</span>
                    <span>#대구</span>
                    <span>#인천</span>
                    <span>#광주</span>
                    <span>#대전</span>
                    <span>#울산</span>
                    <span>#강원</span>
                    <span>#경기</span>
                    <span>#전주</span>
                    <span>#문화시설</span>
                    <span>#역사</span>
                    <span>#맛집</span>
                    <span>#쇼핑</span>
                    <span>#힐링</span>
                    <span>#자연</span>
              </div>
         </div>
    </div>  
</div>  
    
    <!-- 페이징 처리 -->
   <div class="paging-container">
            <ul class="pagination">
                <!-- 이전 버튼 -->
                <c:if test="${paging.startPage > 10}">
                    <li><a href="${path}/ad_product_list.pd?pageNum=${paging.prev}" class="prevPage">[이전]</a></li>
                </c:if>

                <!-- 페이징 번호 -->
                <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                    <li>
                        <a href="${path}/ad_product_list.pd?pageNum=${num}" 
                           class="<c:if test='${num == paging.currentPage}'>active</c:if>">${num}</a>
                    </li>
                </c:forEach>

                <!-- 다음 버튼 -->
                <c:if test="${paging.endPage < paging.pageCount}">
                    <li><a href="${path}/ad_product_list.pd?pageNum=${paging.next}" class="nextPage">»</a></li>
                </c:if>
           </ul>
    </div>


			
<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>   
<!-- footer 종료 -->			
			
</body>
</html>
