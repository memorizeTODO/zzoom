<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<!-- <link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<script src="./js/jquery.js"></script> -->
<script>
 function check(){
	 if($.trim($("#member_email").val())==""){
		 alert("이메일을 입력하세요!");
		 $("#member_email").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#member_passwd").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>
 <div id="pwd_wrap">
 
 <c:if test="${empty mem}"> 
  <h2 class="pwd_title">아이디찾기</h2>
  <form method="post" action="findIdForm"
  		onsubmit="return check()">  
   <table id="pwd_t">
    <tr>
     <th>이메일</th>
     <td><input name="member_email" id="member_email" size="14" class="input_box" /></td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td><input name="member_passwd" id="member_passwd" size="14" class="input_box" /></td>
    </tr>
   </table>
   <div id="pwd_menu">
    <input type="submit" value="찾기" class="input_button" />
    <input type="reset" value="취소" class="input_button" 
    onclick="$('#member_email').focus();"/>
   </div>
   <div id="pwd_close">
    <input type="button" value="닫기" class="input_button"
    onclick="self.close();" />
    <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
   </div>
  </form>
  </c:if>
  
  
  <c:if test="${!empty mem}">
    <h2 class="pwd_title2">아이디찾기 결과</h2>
    <table id="pwd_t2">
     <tr>
      <th>검색한 비번:</th>
      <td>${mem.member_id}</td>
     </tr>
    </table>
    <div id="pwd_close2">
    <input type="button" value="닫기" class="input_button"
    onclick="self.close();" />
    <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
    </div>
  </c:if> 
  
 </div>
</body>
</html>