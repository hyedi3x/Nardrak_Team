<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>1:1 문의내역</title>

<!-- css -->
<link href="${path}/resources/css/myInfo/myInfo_Inquiry/res_status.css" rel="stylesheet">

<!-- js -->
<script src="${path}/resources/js/myInfo/qnaResponse.js" defer></script>
</head>
<body>
	<c:set var="status" value="${param.status == 'complete' ? 'complete' : 'pending'}" scope="request"/>	
	<c:choose>
	    <c:when test="${param.status == 'pending'}">
	        <div id="tableWrap">
	            <table>
	                <thead>
	                    <tr>
	                        <th scope="col" style="width: 50px">NO</th>
	                        <th scope="col" style="width: 90px">이미지</th>
	                        <th scope="col" style="width: 200px">문의 제목</th>
	                        <th scope="col" style="width: 130px">카테고리</th>
	                        <th scope="col" style="width: 120px">답변 여부</th>
	                        <th scope="col" style="width: 130px">등록일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                        <c:when test="${empty inquiryRes}">
	                            <tr>
	                                <td colspan="6">등록된 게시물이 없습니다.</td>
	                            </tr>
	                        </c:when>
	                        <c:otherwise>
	                            <c:forEach var="dto" items="${inquiryRes}">
	                                <tr>
	                                    <td style="width: 50px">${dto.rn}</td>
	                                    <td style="width: 90px"><img src="${path}${dto.i_imgUpload}" alt="img x" width="50px" /></td>
	                                    <td style="width: 200px">${dto.i_title}</td>
	                                    <td style="width: 130px">${dto.i_category}</td>
	                                    <td style="width: 120px">${dto.i_status}</td>
	                                    <td style="width: 130px">${fn:substring(dto.i_writeDate, 0, 10)}</td>
	                                </tr>
	                            </c:forEach>
	                        </c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
	    </c:when>
	    <c:when test="${param.status == 'complete'}">
	        <div id="tableWrap">
	            <table>
	                <thead>
	                    <tr>
	                        <th scope="col" style="width: 50px">NO</th>
	                        <th scope="col" style="width: 90px">이미지</th>
	                        <th scope="col" style="width: 200px">문의 제목</th>
	                        <th scope="col" style="width: 130px">카테고리</th>
	                        <th scope="col" style="width: 120px">답변 여부</th>
	                        <th scope="col" style="width: 130px">등록일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                        <c:when test="${empty inquiryRes}">
	                            <tr>
	                                <td colspan="7">등록된 게시물이 없습니다.</td>
	                            </tr>
	                        </c:when>
	                        <c:otherwise>
	                            <c:forEach var="dto" items="${inquiryRes}">
	                                <tr>
	                                    <td style="width: 50px">${dto.rn}</td>
	                                    <td style="width: 90px"><img src="${path}${dto.i_imgUpload}" alt="img x" width="50px" /></td>
	                                    <td style="width: 200px">${dto.i_title}</td>
	                                    <td style="width: 130px">${dto.i_category}</td>
	                                    <td style="width: 120px">${dto.i_status}</td>
	                                    <td style="width: 130px">${fn:substring(dto.i_writeDate, 0, 10)}</td>
	                                </tr>
	                            </c:forEach>
	                        </c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
	    </c:when>
	</c:choose>
	
	<div id="pagingTd">
	    <c:if test="${paging.startBlock > paging.pageBlock}">
	        <a onclick="load('${path}/res_status.do?page=${paging.prev}&status=${param.status}')"> &lt;&lt; prev </a>
	    </c:if>
	
		<c:forEach var="num" begin="${paging.startBlock}" end="${paging.endBlock}">
			<a onclick="load('${path}/res_status.do?page=${num}&status=${param.status}')">${num}</a>
		</c:forEach>
	
	    <c:if test="${paging.next <= paging.pageNum}">
	        <a onclick="load('${path}/res_status.do?page=${paging.next}&status=${param.status}')"> next &gt;&gt; </a>
	    </c:if>
	</div>
</body>
</html>
