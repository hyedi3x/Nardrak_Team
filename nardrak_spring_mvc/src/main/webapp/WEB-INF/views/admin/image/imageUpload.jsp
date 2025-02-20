<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/admin/image/ImageUpload.css">

<!-- js -->
<script src="${path}/resources/js/admin/image/ImageUpload.js" defer></script>
<title>사진 관리</title>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header_SessionScope.jsp" %>

    <h3>새로운 사진 등록</h3>

    <!-- 새로운 사진 업로드 -->
	<div class="image-upload-container">
	    <form action="uploadImageAction.img" method="post" enctype="multipart/form-data">
	        <input type="file" name="ad_img" accept="image/*" required><br><br>
	
	        <!-- 업로드한 사람 정보 추가 -->
	        <label for="uploaded_by">업로드한 사람:</label>
	        <input type="text" name="image_uploader" id="image_uploader" value="${sessionID}" readonly><br><br>
	        
	        <!-- 이미지 설명 입력 필드 추가 -->
	        <label for="image_detail">이미지 설명:</label>
	        <textarea name="image_detail" id="image_detail" placeholder="255자 이내" rows="4" cols="50" required></textarea><br><br>
	
	        <button type="submit">업로드</button>
	    </form>
	</div>

    <!-- 기존 이미지 목록 -->
    <h3>현재 등록된 사진:</h3>
	<c:choose>
	    <c:when test="${not empty images}">
	        <div class="image-container">
	            <c:forEach var="image" items="${images}">
	                <div class="image-item">
	                    <img src="${image.image_path}" alt="등록된 사진">
	                    <div class="btn-group">
	                        <!-- 수정 버튼 -->
	                        <form action="#" id="form-${image.image_id}" method="post" enctype="multipart/form-data">
	                            <input type="hidden" name="imageId" value="${image.image_id}">
	                            <input type="hidden" name="hiddenPath" value="${image.image_path}">
	                            <input type="file" name="ad_img" accept="image/*" style="display: none;" id="file-${image.image_id}">
	                            <textarea name="image_rewrite" placeholder="수정할 설명을 입력하세요" rows="4" cols="50" required>${image.image_detail}</textarea><br><br>
	                            <button type="button" class="btn-icon" onclick="document.getElementById('file-${image.image_id}').click();">✏️</button>
	                            <button type="button" class="btn-icon" onclick="submitForm('form-${image.image_id}', 'update')">✔️</button>
                                <button type="button" class="btn-icon" onclick="submitForm('form-${image.image_id}', 'delete')">🗑️</button>
	                        </form>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>
	    </c:when>
	    <c:otherwise>
	        <p>현재 등록된 사진이 없습니다.</p>
	    </c:otherwise>
	</c:choose>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>