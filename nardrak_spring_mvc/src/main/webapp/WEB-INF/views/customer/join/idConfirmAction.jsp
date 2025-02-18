<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!-- include 필수!! 하지않으면 CSS나 JS 반영안됨 주의★ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ID 중복확인 </title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/customer/join/idconfirm.css">

<script src="${path}/resources/js/customer/join.js" defer></script>

</head>
<body>
    <div class="container">
        <h2> ID 중복확인 </h2>
        
        <form name="confirmform" action="idConfirmAction.do" method="post">
            
            <!-- id가 중복일 때, id를 입력받아 다시 중복체크 -->
            <c:if test="${inConfirmCnt == 1}">
                <div class="message">
                    <span>입력하신 아이디 <span class="idValue">${strId}</span>는 사용할 수 없습니다.</span>
                </div>
                
                <table>
		            <tr>
		                <th> 아이디 <span class="requiredAll">*</span></th> 
		                <td>
		                    <input type="text" id="inputId" name="cs_id" placeholder="영문, 숫자  4~10자 이내" oninput="checkId(this.value)" required autofocus> 
		                    <input type="submit" id="inputIdConfirm" value="중복" onclick="confirmId('${path}')">
		                    <div id="idChk"></div>
		                </td>
		            </tr>  
                </table>
            </c:if>

            <!-- id가 중복이 아닐 때 -->
            <c:if test="${inConfirmCnt != 1}">
                <div class="message">
                    <span>입력하신 아이디 <span class="idValue">${strId}</span>는 사용할 수 있습니다.</span>
                </div>

                <table>
                    <tr>
                        <td colspan="2">
                            <div align="center">
                                <input class="inputButton" type="button" value="확인" onclick="setUserid('${strId}')"> 
                            </div>
                        </td>
                    </tr>    
                </table>    
            </c:if>
        </form>            
    </div>
</body>    
</html>
