<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet" />
<script>
	/*비번찾기 공지창*/
	function passwd_find() {
		window.open("findPasswdForm", "비번찾기", "width=450,height=500");
		//자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
		//메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
	}
	function id_find() {
		window.open("findid", "아이디찾기", "width=450, height=500");
	}
</script>
<title>Login Page</title>
</head>
<body>
	<div id="login_wrap">
		<h2 class="login_title">로그인</h2>
		<form method="post" action="member_login" onsubmit="return check()">
			<table id="login_t">
				<tr>
					<th>아이디</th>
					<td><input name="member_id" id="member_id" size="20"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_passwd"
						id="member_passwd" size="20" class="input_box" /></td>
				</tr>
			</table>

			<input type="submit" value="로그인" class="input_button" /> 
			<input type="reset" value="취소" class="input_button" onclick="$('#member_id').focus();" /> <input type="button"
					value="회원가입" class="input_button" onclick="location='join'" /> 
			<input type="button" value="비번찾기" class="input_button" onclick="passwd_find()" /> <input type="button" value="아이디찾기"
					class="input_button" onclick="id_find()" />
		</form>
	</div>

</body>
</html>