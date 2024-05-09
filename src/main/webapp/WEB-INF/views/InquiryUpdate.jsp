<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>inquiry Form</title>

<!-- 테일윈드 CSS 링크 -->
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet"/>
	
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<!-- 상단 고정바 -->
<nav class="bg-white fixed w-full z-20 top-0 start-0 border-b border-gray-200">
	
	<!-- 로고 -->
	<div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
		<a href="https://www.naver.com/"
			class="flex items-center space-x-3 rtl:space-x-reverse ml-5">
		<img src="img\logozzoom.png" class="h-10" alt="C:\Users\qwzx0\git\zzoom\src\main\resources\static\img\logozzoom.png" />
		<span class="self-center text-2xl font-semibold whitespace-nowrap mt-3 mb-3"></span>
		</a>
	
	<!-- 로그인버튼 -->
	<div class="flex flex-row-reverse md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
		<button type="button"
			class="text-white font-bold bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3 mr-5">
			로그인
		</button>
	</div>
	
	<!-- 목록 -->
	<div id="navbar-sticky"
		class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1 justify-end">
		<ul 
		class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white">
			<li>
				<a href="#" aria-current="page"
					class="font-bold block py-3 px-4 text-white bg-gray-900 rounded md:bg-transparent md:text-purple-700 md:p-0">
					회의시작
				</a>
			</li>
			<li>
				<a href="/noticeList"
					class="font-bold block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-purple-700 md:p-0">
					공지사항
				</a>
			</li>
			<li>
				<a href="#"
					class="font-bold block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-purple-700 md:p-0">
					문의사항
				</a>
			</li>
		</ul>
	</div>
	</div>
</nav>

<!-- --------------------------------------------------------------------------------------------------------------------------------- -->

<body class="bg-gray-100">
	<div class="flex justify-center text-gray-500 text-2xl font-bold mt-40 mb-5">문의 수정</div>
		
	<!-- 공지사항 수정 폼 -->
	<div class="flex justify-center ">
	<form action="update_inquiry" method="post"
		class="max-w-lg bg-white shadow-md rounded w-3/4 px-8 pt-6 pb-8 mb-4">
		<input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id }">
		<input type="hidden" name="page" value="${page}">

	<div class="flex justify-between mb-5">
	<!-- 유저명 -->	
	<div class="mb-2">
		<label for="member_name" 
			class="block mb-2 text-md font-bold text-purple-700"> 
			아이디 
		</label>
		<div class="flex flex-center">
			<input type="text" id="member_id" name="member_id" value="${inquiry.member_id}"
				class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5"
				readonly/>
		</div>
	</div>
	
	<!-- 문의일자 -->
	<div class="mb-2">
		<label for="member_name"
			class="block mb-2 text-md font-bold text-purple-700">
			문의일자
		</label>
		<div class="flex flex-center">
			<input type="text" name="member_name" id="member_name" value="${inquiry.inquiry_date}" 
				class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5"
				 readonly/>
		</div>
	</div>
	</div>		
	
	<!-- 문의제목 -->
	<div class="mb-2">
		<label for="inquiry_subject" 
			class="block mb-2 text-md font-bold text-purple-700">
			제목
		</label>
		<div class="flex flex-center">
			<input type="text" id="inquiry_subject" name="inquiry_subject" value=" ${inquiry.inquiry_subject}"
				class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5""
				placeholder="수정할 제목을 입력 하세요." 
				required />
		</div>
	</div>
	
	<!-- 문의내용 -->
	<div class="mb-2">
		<label for="inquiry_content"
			class="lock mb-2 text-md font-bold text-purple-700">
			문의내용
		</label>
		<div class="flex flex-center">
			<textarea id="inquiry_content" name="inquiry_content" rows="10"
				class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5"
				placeholder="수정할 문의사항을 2000자 이내로 작성하세요." 
				required> 
				${inquiry.inquiry_content}
			</textarea>
		</div>
	</div>
	
	<!-- 버튼 -->
	<div class="flex justify-between mt-5">
		<!-- 문의 작성 버튼 -->
		<button type="submit"
			class="text-white bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none focus:ring-purple-700 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
			수정
		</button>

		<!-- 문의 삭제 버튼 -->
		<button type="button"
			class="text-white bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
			onClick="location.href='inquiryDelete?inquiry_id=${inquiry.inquiry_id }&page=${page }'   ">
			삭제
		</button>

		<!-- 취소 버튼 -->
		<button type="button"
			class="text-gray-700 bg-gray-200 hover:bg-gray-300 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
			onclick="window.history.back()">
			취소
		</button>
	</div>
	
	</form>
	</div>
</body>
</html>
