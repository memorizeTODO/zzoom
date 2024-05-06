<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>공지사항 폼</title>
<!-- 테일윈드 CSS 링크 -->
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet"/>
	
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<!-- 상단 고정바 -->
	<nav class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
	<div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
		<a href="https://www.naver.com/"
			class="flex items-center space-x-3 rtl:space-x-reverse">
			<img src="img\logozzoom.png" class="h-10" alt="ZZOM Logo" />
			<span class="self-center text-2xl font-semibold whitespace-nowrap mt-3 mb-3"></span>
		</a>
		
		<div class="flex flex-row-reverse md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
			<button type="button"
				class="text-white bg-purple-500 hover:bg-purple-400 focus:ring-10 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3">
				로그인
			</button>
		</div>
		
		<div id="navbar-sticky"
			class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1 justify-end">
			
			<ul 
			class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white">
				<li>
					<a href="#" aria-current="page"
						class="block py-3 px-4 text-white bg-gray-900 rounded md:bg-transparent md:text-purple-500 md:p-0">
						회의시작
					</a>
				</li>
				<li>
					<a href="#"
						class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-purple-500 md:p-0">
						공지사항
					</a>
				</li>
				<li>
					<a href="#"
						class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-purple-500 md:p-0">
						문의사항
					</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- --------------------------------------------------------------------------------------------------------------------------------- -->

<body class="bg-gray-100">
	<div class="flex justify-center text-gray-500 text-2xl font-bold mt-40 mb-5">공지 작성</div>
	
	<!-- 공지사항 작성 폼 -->
	<div class="flex justify-center">
	<form action="noticeinsert" method="post"
		class="bg-white shadow-md rounded w-1/2 px-8 pt-6 pb-8 mb-4">
		
		<div class="mb-6">
		<label
			for="notice_subject"
			class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
			공지 제목
		</label>
		<input
			type="text"
			id="notice_subject"
			name="notice_subject"
			class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-lg focus:ring-purple-300 focus:border-purple-500 block w-full p-2.5"
			placeholder="공지사항 제목을 입력 하세요."
			required/>
		</div>
        
        <div class="mb-6">
          <label
            for="notice_content"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            >공지 내용</label
          >
          <textarea
            id="notice_content"
            name="notice_content"
            rows="5"
            class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-lg focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5"
            placeholder="공지사항 내용을 2000자 이내로 작성하세요."
            required
          ></textarea>
        </div>
        <div class="flex justify-between">
          <!-- 공지 작성 버튼 -->
          <button
            type="submit"
            class="text-white bg-purple-500 hover:bg-purple-300 focus:ring-2 focus:outline-none focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
          >
            공지
          </button>
          <!-- 취소 버튼 -->
          <button
            type="button"
            class="text-gray-700 bg-gray-200 hover:bg-gray-300 focus:ring-2 focus:outline-none focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
            onclick="window.history.back()"
          >
            취소
          </button>
        </div>
      </form>
    </div>
  </body>
</html>
