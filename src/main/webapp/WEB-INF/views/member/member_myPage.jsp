<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<script src="./js/jquery.js"></script>
<script src="./js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						document.getElementById('member_zipcode').value = data.zonecode;
						document.getElementById('member_address').value = data.address;
					}
				}).open();
	}
</script>
</head>
<body>
	<div id="join_wrap">
		<h2 class="join_title">회원수정</h2>
		<form method="post" action="myPageEdit"
			onsubmit="return edit_check()">
			<table id="join_t">
				<tr>
					<th>회원아이디</th>
					<td>${sessionScope.member_id}</td>
					<!-- sessionScope.변수명 생략 가능 -->
				</tr>

				<tr>
					<th>회원비번</th>
					<td><input type="password" name="member_passwd"
						id="member_passwd" size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>회원비번확인</th>
					<td><input type="password" name="member_passwd2"
						id="member_passwd2" size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>회원이름</th>
					<td><input name="member_name" id="member_name" size="14"
						class="input_box" value="${member.member_name}" /></td>
				</tr>

				<tr>
					<th>우편번호</th>
					<td><input name="member_zipcode" id="member_zipcode" size="5"
						class="input_box" readonly onclick="post_search()"
						value="${member.member_zipcode}" /> <input type="button" value="우편번호검색"
						class="input_button" onclick="openDaumPostcode()" /></td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input name="member_address" id="member_address" size="50"
						class="input_box" readonly value="${member.member_address}"
						onclick="post_search()" /></td>
				</tr>

				<tr>
					<th>나머지 주소</th>
					<td><input name="member_address_detail"
						id="member_address_detail" size="37" value="${member.member_address_detail}"
						class="input_box" /></td>
				</tr>
				<tr>
					<th>휴대전화번호</th>
					<td><input name="member_phone" id="member_phone" size="11"
						maxlength="11" class="input_box" value="${member.member_phone}" />
						</td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input name="member_email" id="member_email" size="10"
						class="input_box" value="${member.member_email}" /></td>
				</tr>
			</table>

			<div id="join_menu">
				<input type="submit" value="회원수정" class="input_button" /> <input
					type="reset" value="수정취소" class="input_button"
					onclick="$('#member_passwd').focus();" />
			</div>
		</form>
	</div>
</body>
</html>