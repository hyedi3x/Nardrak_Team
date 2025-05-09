<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울 여행지 및 맛집</title>
    
    <!-- css -->
    <link rel="stylesheet" href="${path}/resources/css/customer/local/local.css">
    
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- JS -->
    <%-- <script src="${path}/resources/js/customer/trable.js" defer></script> --%>
    
</head>
<body>

<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>



<div class="name">
    <h3><i class="fa-solid fa-leaf"></i> 여행지 </h3>
    <div class="name_tag">
        <span align="left">#전체</span>
    </div>
</div>

	<div class="divider1"></div>
	
<div class="div1">
	<div class="container">
	    <div class="content">
	        <div class="place-list">
	            <c:forEach var="place" items="${locals}">
	               <a href="${path}/locationDetailPage.tr?local_title=${place.local_title}">
	                   <div class="place">
	                       <div class="place-img">
	                           <img src="${path}${place.local_image}" alt="${place.local_title}">
	                       </div>
	                       <div class="place-text">
	                           <h3>${place.local_title}</h3>
	                           <p>${place.region}</p>
	                           <p>${place.description}</p>
	                           <p style="color:#4361ee;">${place.local_tags}</p>
	                       </div>
	                   </div>
	               </a>
	               <c:if test="${sessionScope.login_session eq 'Admin'}">
					    <a href="${path}/locationDetailModify.tr?local_title=${place.local_title}">
					        수정하기
					    </a>
					</c:if>
	               <div class="divider"></div>
	           </c:forEach>
	        </div>
	    </div>
	</div>
	
	<div class="tag-box">
	    <h4>태그</h4>
	    <div class="tag-list">
	        <span><a href="${path}/local.tr?region=서울">#서울</a></span>
	        <span><a href="${path}/local.tr?region=경기">#경기</a></span>
	        <span><a href="${path}/local.tr?region=강원">#강원</a></span>
	        <span><a href="${path}/local.tr?region=충청">#충청</a></span>
	        <span><a href="${path}/local.tr?region=경상">#경상</a></span>
	        <span><a href="${path}/local.tr?region=전라">#전라</a></span>
	        <span><a href="${path}/local.tr?region=제주">#제주</a></span>	    
	    </div>
	</div>
</div>


<!-- 페이징 처리 -->
<div class="paging-container">
    <ul class="pagination">
        <c:if test="${paging.startPage > 10}">
            <li><a href="${path}/local.tr?pageNum=${paging.prev}" class="prevPage">≪</a></li>
        </c:if>

        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
            <li>
                <a href="${path}/local.tr?pageNum=${num}"
                   class="<c:if test='${num == paging.currentPage}'>active</c:if>">${num}</a>
            </li>
        </c:forEach>

        <c:if test="${paging.endPage < paging.pageCount}">
            <li><a href="${path}/local.tr?pageNum=${paging.next}" class="nextPage">≫</a></li>
        </c:if>
    </ul>
</div>




<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
