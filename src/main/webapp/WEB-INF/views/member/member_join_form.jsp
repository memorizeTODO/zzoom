<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<!-- Tailwind CSS CDN 추가 -->
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
	<script src="https://cdn.tailwindcss.com"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
<body class="bg-gray-100 ">
	<div class="bg-white shadow-md rounded m-80 p-40 scroll-m-0">
		<h1 class="text-center text-xl font-bold">회원가입</h1>
		<br /> <br />
		<form method="post" action="memberInsert" onSubmit="return check()">

			<div class="grid gap-6 mb-6 md:grid-cols-1">
				<div>
					<label for="member_id"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">아이디</label>
					<div class="flex flex-row">
						<input type="text" name="member_id" id="member_id"
							class="mr-5 bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
							placeholder="아이디를 입력해 주세요." /> 
							<input type="button"
							value="아이디 중복체크" class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" onclick="id_check()" />
					</div>
					<div id="idcheck"></div>
				</div>
				<div>
					<label for="password"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">비밀번호</label>
					<input type="password" name= "member_passwd" id="member_passwd"
						class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="•••••••••" />
				</div>
				<div>
					<label for="confirm_password"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">비밀번호
						확인</label> <input type="password" name="confirm_password"
						id="confirm_password"
						class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="•••••••••" />
				</div>
				<div>
					<label for="member_name"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">이름</label>
					<input type="text" name="member_name" id="member_name"
						class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="이름을 입력해 주세요." />
				</div>
				<div>
					<label for="member_phone"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴대전화
						번호 </label> <input type="tel" name="member_phone" id="member_phone"
						class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="휴대전화 번호를 입력해 주세요."
						pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" />
				</div>
				<div>
					<label for="member_zipcode"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">우편번호</label>
					<input name="member_zipcode" id="member_zipcode"
						class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-1/3 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="우편번호를 입력해 주세요." readonly onclick="openDaumPostcode()" />
					<!-- <input type="button" value="우편번호검색" class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto mx-60 my  px-2 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"" onclick="openDaumPostcode()" /> -->

				</div>
				<div>
					<label for="member_address"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">주소
					</label> <input name="member_address" id="member_address"
						class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="주소를 입력해 주세요." readonly onclick="openDaumPostcode()" />
				</div>
				<div>
					<label for="member_address_detail"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">상세주소</label>
					<input name="member_address_detail" id="member_address_detail"
						class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="상세주소를 입력해 주세요."/>
				</div>
			</div>
			<div class="mb-6">
				<label for="member_email"
					class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">Email
				</label> <input type="email" name="member_email" id="member_email"
					class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					placeholder="example@example.com" />
			</div>

			<div class="grid gap-6 mb-6 md:grid-cols-2">
				<button type="submit"
					class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" >확인</button>
				<button type="reset"
					class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" onclick="history.go(-1);">취소</button>
			</div>
		</form>
	</div>
</body>

</html>
