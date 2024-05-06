<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Notice Form</title>
<!-- 테일윈드 CSS 링크 -->
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet"/>
	
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body class="bg-gray-100">
	<div class="container mx-auto mt-10">
		<h1 class="text-3xl font-bold mb-5">공지사항 수정</h1>
		<!-- 공지사항 수정 폼 -->
		<form action="update_notice" method="post"
			class="max-w-lg bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
			<input type="hidden" name="notice_id" value="${notice.notice_id }">
			<input type="hidden" name="page" value="${page}">

			<div class="mb-6">
				<label for="notice_subject"
					class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">공지
					제목</label> <input type="text" id="notice_subject" name="notice_subject"
					class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					placeholder="공지사항 제목을 입력 하세요." required
					value=" ${notice.notice_subject}" />
			</div>
			<div class="mb-6">
				<label for="notice_content"
					class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">공지
					내용</label>
				<textarea id="notice_content" name="notice_content" rows="5"
					class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg block w-full p-2 dark:border-purple-600"
					placeholder="공지사항 내용을 2000자 이내로 작성하세요." required> ${notice.notice_content}</textarea>
			</div>
			<div class="flex justify-between">

				<!-- 공지 작성 버튼 -->
				<button type="submit"
					class="text-white bg-purple-400 hover:bg-purple-700 focus:ring-4 focus:outline-none focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
					수정</button>

				<!-- 공지 삭제 버튼 -->
					<button type="button"
						class="text-white bg-purple-400 hover:bg-purple-700 focus:ring-4 focus:outline-none focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
						onClick="location.href='noticeDelete?notice_id=${notice.notice_id }&page=${page }'   ">
						삭제</button>

				<!-- 취소 버튼 -->
				<button type="button"
					class="text-gray-700 bg-gray-200 hover:bg-gray-300 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
					onclick="window.history.back()">취소</button>
			</div>
		</form>
	</div>
</body>
</html>
