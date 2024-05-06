<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Notice Detail</title>

<!-- 테일윈드 CSS 링크 -->
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet"/>
	
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
	<style>.content {display: none;}</style>
	
	// jQuery 사용
	<script>
	$(document).ready(function () {
		$(".subject").click(function () { 				// 클래스가 subject인 요소를 클릭했을 때
		$(this).next(".content").slideToggle();	// 형제 요소 중 클래스가 content인 요소를 찾아 토글
		});
	});
	</script>
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

<body class="bg-gray-100">
	<div class="flex justify-center text-2xl font-bold mt-40 mb-5">공지 사항</div>
	<div class="text-xl md-5">ZZOOM의 서비스 안내와 공지에 대한 소식을 전해드립니다.</div>
	<div class="flex flex justify-center container mx-auto mt-30">
	
	<!-- 공지사항 상세 정보 표시 -->
	<div class="max-w-lg bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
	<div class="mb-6">
		<label for="notice_subject"
			class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
			공지 제목
		</label>
			<p id="notice_subject" class="text-gray-900 dark:text-white">${notice.notice_subject}</p>
</div>
        <div class="mb-6">
          <label
            for="notice_content"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            >공지 내용</label
          >
          <p id="notice_content" class="text-gray-900 dark:text-white">
            ${notice.notice_content}
          </p>
        </div>
      </div>
      
		<!-- 공지 수정 버튼 -->
          <button
            type="button"
            class="text-white bg-purple-500 hover:bg-purple-300 focus:ring-2 focus:outline-none focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
         	onclick="location.href= 'noticeUpdate?notice_id=${notice.notice_id}&page=${page}'   "
          >
            수정
          </button>

      <!-- 취소 버튼 -->
      <button
        type="button"
        class="text-gray-700 bg-gray-200 hover:bg-gray-300 focus:ring-2 focus:outline-none focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
        onclick="location.href='noticelist?page=${page}'  "
      >
        목록으로
      </button>
    </div>
  </body>
</html>
