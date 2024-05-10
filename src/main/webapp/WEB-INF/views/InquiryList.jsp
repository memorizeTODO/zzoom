<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>문의사항 목록</title>

<!-- 테일윈드 CSS 링크 -->
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet"/>
	
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
	// jQuery 사용
	$(document).ready(function () {
		$(".subject").click(function () {
			$(this).next(".content").slideToggle();
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
				<a href="/noticelist"
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

<body class="bg-gray-100">
	<div class="container mx-auto py-4" >
	<div class="text-center text-gray text-3xl font-bold mt-40 mb-5">문의 사항</div>
	
	<!-- 검색기능 -->
	<form class="max-w-md mx-auto">
		<div class="relative">
			<div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
				<!-- 아이콘 -->
				<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20"
					class="w-4 h-4 text-gray-500 dark:text-gray-400" >	
					<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
				</svg>
			</div>
		
		<input type="search" id="inquirysearch"  placeholder="  검색어를 입력하세요." required 
			class="block w-full p-3 ps-7 text-sm text-purple-700 border border-gray-300 rounded-lg bg-gray-50 focus:ring-purple-500 focus:border-purple-500"/>
		<button type="submit" 
			class="text-white absolute end-1 top-1 bottom-1 bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none focus:ring-purple-700 font-medium rounded-lg text-sm px-4 py-2">
			검색
		</button>
		</div>
	</form>
		
		<!-- 문의사항 목록 출력 -->
		<div class="container mx-auto mt-3 " align="center">
		<table class=" w-4/5 table-fixed">
			<thead>
				<tr class="bg-purple-700 text-white">
					<th class="w-2/12 py-2">번호</th>
					<th class="w-3/6 py-2">제목</th>
					<th class="w-1/6 py-2">작성자</th>
					<th class="w-1/6 py-2">작성일</th>
					<th class="w-1/6 py-2">답변여부</th>
				</tr>
			</thead>
			
			<!-- 화면 출력 번호 -->
			<tbody>
				<c:set var="num" value="${listcount-(page-1)*10 }" />
				<c:forEach items="${inquirylist}" var="inquiry">
					<tr class="border-b border-gray-200 hover:bg-gray-50">
						<td class="py-3 bg-white text-center">${num} <c:set var="num" value="${num-1}" /></td>
						<td class="py-3 bg-white cursor-pointer subject">
							<a href="inquirydetail?inquiry_id=${inquiry.inquiry_id}&page=${page}">${inquiry.inquiry_subject}</a>
						</td>
							<td class="py-3 bg-white text-center">${inquiry.member_id}</td>
							<td class="py-3 bg-white text-center">${inquiry.inquiry_date}</td>
							<td class="py-3 bg-white text-center">
								<c:if test="${inquiry.inquiry_completed == '1'}">답변대기</c:if>
								<c:if test="${inquiry.inquiry_completed == '2'}">답변완료</c:if>
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		
	<!-- 페이지 처리 -->
	<center>
		<c:if test="${listcount > 0 }">
			<!-- 1page로 이동 -->
			<a href="inquirylist?page=1" style="text-decoration: none"> < </a>

			<!-- 이전 블럭으로 이동 -->
			<c:if test="${startPage > 10 }">
				<a href="inquirylist?page=${startPage-10}">[이전]</a>
			</c:if>

			<!-- 각 블럭에 10개의 페이지 출력 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == page }">
					<!-- 현재 페이지 -->
                       [${i}]
               </c:if>
				<c:if test="${i != page }">
					<!-- 현재 페이지가 아닌 경우 -->
					<a href="inquirylist?page=${i}">[${i}]</a>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭으로 이동 -->
			<c:if test="${endPage < pageCount }">
				<a href="inquirylist?page=${startPage+10}">[다음]</a>
			</c:if>

			<!-- 마지막 페이지로 이동 -->
			<a href="inquirylist?page=${pageCount}"
				style="text-decoration: none"> > </a>
			</c:if>
		</center>
	</div>
	
		<!-- 문의하기 생성 버튼 -->
		<div class="flex flex justify-center w-full">
			<button type="button"
				class="text-white bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none focus:ring-purple-700 font-medium rounded-lg text-sm px-5 py-2.5 text-center "
				onClick="location.href='inquiryform' ">문의하기
			</button>
		</div>
		
</body>
</html>
</html>
