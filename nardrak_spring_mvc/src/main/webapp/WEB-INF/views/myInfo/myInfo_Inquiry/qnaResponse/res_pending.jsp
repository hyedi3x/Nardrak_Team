<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>진행 중인 1:1 문의내역</title>

<!-- css -->
<link href="${path}/resources/css/myInfo/myInfo_Inquiry/res_pending.css" rel="stylesheet">

</head>
<body>
<div id="tableWrap">
	<table>
		<thead>
			<tr>
				<th scope="col">NO</th>
				<th scope="col">이미지</th>
				<th scope="col">문의 제목</th>
				<th scope="col">카테고리</th>
				<th scope="col">답변 여부</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty qnaRequestList}">
					<tr>
						<td colspan="6">등록된 게시물이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${qnaRequestList}">
						<tr>
							<td>${dto.rn}</td>
							<td><img src="${dto.i_imgUpload}" alt="이미지 없음" width="50"/></td>
							<td>${dto.i_title}</td>
							<td>${dto.i_category}</td>
							<td>${dto.adI_reply}</td>
							<td>${dto.i_writeDate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<%-- 페이징 처리 --%>
	<div id="pagingTd" class="font20">
		<c:if test="${paging.startBlock > paging.pageBlock}">
			<a href="${path}/qnaResponse.do?page=${paging.prev}"> << 이전 </a>
		</c:if>

		<c:forEach var="num" begin="${paging.startBlock}" end="${paging.endBlock}">
			<c:choose>
				<c:when test="${num == paging.currentPage}">
					<strong>${num}</strong>
				</c:when>
				<c:otherwise>
					<a href="${path}/qnaResponse.do?page=${num}">${num}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${paging.endBlock < paging.pageNum}">
			<a href="${path}/qnaResponse.do?page=${paging.next}"> 다음 >> </a>
		</c:if>
	</div>
</div>
</body>
</html>