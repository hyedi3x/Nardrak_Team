<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/settings.jsp" %>
<!-- include 필수!! 하지않으면 CSS나 JS 반영안됨 주의★ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ID 중복확인 </title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/customer/join/join.css">

<script src="${path}/resources/js/customer/join.js" defer></script>


<style>
    /* 기본 레이아웃 설정 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        width: 100%;
        max-width: 500px;
        background-color: white;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    h3 {
        font-size: 24px;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        text-align: center;
        font-weight: bold;
        padding: 10px;
        background-color: #f4f7fc;
        font-size: 16px;
        color: #333;
    }

    td {
        padding: 10px;
        text-align: center;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    input[type="submit"], input[type="button"] {
        background-color: #9dbebb;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover, input[type="button"]:hover {
        background-color: #729ea1;
    }

    .message {
        margin: 10px 0;
        padding: 10px;
        border-radius: 5px;
        font-size: 16px;
        text-align: center;
    }

    .error {
        background-color: #f8d7da;
        color: #721c24;
    }

    .success {
        background-color: #d4edda;
        color: #155724;
    }

</style>

</head>
<body>
    <div class="container">
        <h3> ID 중복확인 </h3>
        
        <form name="confirmform" action="idConfirmAction.do" method="post">
            
            <!-- id가 중복일 때, id를 입력받아 다시 중복체크 -->
            <c:if test="${inConfirmCnt == 1}">
                <div class="message error">
                    <span>입력하신 ${cs_id}는 사용할 수 없습니다.</span>
                </div>
                
                <table>
                    <tr>
                        <th> * 아이디 </th>
                        <td>
                            <input type="text" class="input" name="cs_id" size="30" placeholder="공백없이 10자 이내로 작성해 주세요" required autofocus> 
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div align="center">
                                <input class="inputButton" type="submit" value="확인">
                            </div>
                        </td>
                    </tr>    
                </table>
            </c:if>

            <!-- id가 중복이 아닐 때 -->
            <c:if test="${inConfirmCnt != 1}">
                <div class="message success">
                    <span>입력하신 ${cs_id}는 사용할 수 있습니다.</span>
                </div>

                <table>
                    <tr>
                        <td colspan="2">
                            <div align="center">
                                <input class="inputButton" type="button" value="확인" onclick="setUserid('${cs_id}')"> 
                            </div>
                        </td>
                    </tr>    
                </table>    
            </c:if>
        </form>            
    </div>
</body>    
</html>
