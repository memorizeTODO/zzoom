<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script>
	function check() {
		if ($.trim($("#member_passwd").val()) == "") {
			alert("비밀번호를 입력하세요!");
			$("#member_passwd").val("").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="del_wrap">
		<h2 class="del_title">회원탈퇴</h2>
		<form method="post" action="delete" onsubmit="return check()">
			<table id="del_t">
				<tr>
					<th>회원아이디</th>
					<td>${sessionScope.member_id }</td>
					<input type="hidden" name="member_id" value="${member_id }"/>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_passwd"
						id="member_passwd" size="14" class="input_box" /></td>
				</tr>
			</table>

			<div id="del_menu">
				<input type="submit" value="회원탈퇴" class="input_button" /> <input
					type="reset" value="취소" class="input_button"
					onclick="$('#member_passwd').focus();" />
			</div>
		</form>
	</div>
</body>
</html>