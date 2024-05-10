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
		<c:if test="${sessionScope.member_id == null}">
			<button type="button" onClick="location='login'"
				class="text-white font-bold bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3 mr-5">
				로그인
			</button>
		</c:if>
		<c:if test="${sessionScope.member_id != null}">
			<button type="button" onClick="location='member_logout'"
				class="text-white font-bold bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3 mr-5">
				로그아웃
			</button>
		</c:if>
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
				<a href="/noticelist?page=1"
					class="font-bold block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-purple-700 md:p-0">
					공지사항
				</a>
			</li>
			<li>
				<a href="/inquirylist?page=1"
					class="font-bold block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-purple-700 md:p-0">
					문의사항
				</a>
			</li>
		</ul>
	</div>
	</div>
</nav>

<!-- ***************************************************************************************** -->

<body class="bg-gray-100">
	<div class="flex justify-center text-gray-600 text-2xl font-bold mt-40 mb-2">공지 사항</div>
	<div class="flex justify-center text-gray-400 text-lg font-bold mb-5">ZZOOM의 서비스 안내와 공지에 대한 소식을 전해드립니다.</div>
	
	<div class="flex justify-between">
	
	<!-- 공지사항 상세 정보 표시 -->
	<div class="flex justify-center container mx-auto mt-5 " >
	<div class="max-w-lg bg-white shadow-md rounded w-1/2 px-8 pt-6 pb-8 mb-4">
	
	<div class="flex justify-between mb-5">
	<!-- 관리자명 -->
	<div class="mb-2">
		<label for="manager_name"
			class="block mb-2 text-md font-bold text-purple-700">
			관리자
		</label>
		<div class="flex flex-center">
			<input type="text" name="manager_name"  id="manager_name" value="${notice.manager_name}" 
				class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5"
				 readonly/>
		</div>
	</div>
	
	<!-- 공지일자 -->
	<div class="mb-2">
		<label for="inquiry_date"
			class="block mb-2 text-md font-bold text-purple-700">
			공지일자
		</label>
		<div class="flex flex-center">
			<input type="text" name="inquiry_date" id="inquiry_date" value="${notice.notice_date}" 
				class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5"
				 readonly/>
		</div>
	</div>
	</div>

	<!-- 공지글 제목 -->
	<div class="mb-2">
		<label for = "notice_subject"
			class="block mb-2 text-md font-bold text-purple-700">
			제목
		</label>
		<div class="flex flex-center">
			<input type="text" name="notice_subject" id="notice_subject" value= "${notice.notice_subject}"
				class = "bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purple-500 block w-full p-2.5"
				readonly/>
		</div>
	</div>
	
	<!-- 공지글 내용 -->
	<div class="mb-20">
		<label for = "notice_content"
			class = "block mb-2 text-md font-bold text-purple-700">
			공지내용
		</label>
		<div class="flex flex-center">
			<textarea name="notice_content" id="notice_content"  rows="10" style="height: auto; max_height : 20rem"  readonly
    			class="scrollbar-hide bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-purple-500 focus:border-purpel-500 block w-full p-2.5">
    			${notice.notice_content}
    		</textarea>
		</div>		
	</div>
	
	<!-- 취소 버튼 -->
	<button type="button"
		onclick="location.href='noticelist?page=${page}'  "
		class="text-gray-700 bg-gray-200 hover:bg-gray-300 focus:ring-2 focus:outline-none focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
		목록
	</button>
	</div>
	
	</div>
	</div>
      
    </div>
  </body>
</html>
