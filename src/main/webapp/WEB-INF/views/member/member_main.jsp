<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
</head>
<body>
<h1 align="center">메인페이지 import 예정</h1>

${sessionScope.member_id} 님 환영 합니다.<br>

<c:if test="${sessionScope.member_id != null}">
	마이페이지
</c:if>
<c:if test="${sessionScope.member_id == null}">
	로그인
</c:if>
<form method="post" action="member_logout"> 
   <table id="main_t">
    <tr>
     <th colspan="2">
     <input type="button" value="정보수정" class="input_button"
     		onclick="location='myPage'" />
     <input type="button" value="회원탈퇴" class="input_button"
     		onclick="location='deleteForm'" />
     <input type="submit" value="로그아웃" class="input_button" />     
     </th>
    </tr>
   </table>
   </form>
</body>
</html>