<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의 수정결과</title>
</head>
<body>

<c:if test="${result == 1 }">
	<script>
		alert("회의가 수정 성공");
		location.href="meetinglist";
	</script>
</c:if>
	
<c:if test="${result != 1 }">
	<script>
		alert("회의 목록 수정 실패");
		location.href="meetinglist";
	</script>
</c:if>	 

</body>
</html>