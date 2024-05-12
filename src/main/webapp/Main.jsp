<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Main Page</title>
	
	<!-- 테일윈드 CSS 링크 -->
	<script src="https://cdn.tailwindcss.com"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
		rel="stylesheet"/>
		
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Swiper JS -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<!-- 상단 고정바 -->
<nav class="bg-white fixed w-full z-20 top-0 start-0 border-b border-gray-200">
	
	<!-- 로고 -->
	<div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
		<a href="/main"
			class="flex items-center space-x-3 rtl:space-x-reverse ml-2">
		<img src="img\logozzoom.png" class="h-10" alt="logo" />
		<span class="self-center text-2xl font-semibold whitespace-nowrap mt-3 mb-3"></span>
		</a>
		
	<div class="flex items-center md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
	
	<!-- 마이페이지 -->
	<div class="flex items-center md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
	<div class="ml-10 mr-5">
		<button type="button"  id="user-menu-button" aria-expanded="false"  onClick="location='myPage'"
			data-dropdown-toggle="user-dropdown" data-dropdown-placement="bottom"
			class="flex text-sm bg-purple-200 rounded-full md:me-0 focus:ring-2 focus:ring-purple-700" >
			<span class="sr-only">user page</span>
			<img src="img\mypage.png" alt="user photo"
				class="w-9 h-9 rounded-full">
		</button>
	</div>
	
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
	</div>
	
	<!-- 목록 -->
	<div id="navbar-sticky"
		class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1 justify-end mr-10">
		<ul 
		class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white">
			<li>
				<a href="meeting_reservation" aria-current="page"
					class="font-bold block py-3 px-4 text-white bg-gray-900 rounded md:bg-transparent md:text-purple-700 md:p-0">
					회의시작
				</a>
			</li>
		<!-- 	<li>
				<a href="" aria-current="page"
					class="font-bold block py-3 px-4 text-white bg-gray-900 rounded md:bg-transparent md:text-purple-700 md:p-0">
					회의참가
				</a>
			</li> -->
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

<!-- ****************************************************************************************************** -->

<body class="bg-gray-100">
	<!-- 이미지와 내용이 들어갈 컨테이너 -->
	<div class="mb-5">
	<div class="w-full">
	<img src="img\mainpicture2.png" alt="Main Picture" 
		class="rounded-lgmt-4 md-5"/>
	</div>

	<!-- 텍스트와 버튼 -->
	<div class="absolute inset-0 flex flex-col items-center justify-center text-center text-white" >
		<!-- 버튼 -->
		<button class="bg-purple-700 hover:bg-purple-500 px-8 py-3 rounded-lg text-lg md:text-lg font-bold" > 회의 참가 </button>
	</div>
	</div>
	
	<hr />
	
	<!-- ***************************************************************************************** -->
	
	<!-- 첫번째 이미지 설명 -->
	<div class="flex flex-col md:flex-row items-center justify-between px-4 my-4 mt-5 ml-20 mr-20">
	<!-- 왼쪽: 이미지 설명 -->
	<div class="md:w-1/2 mb-4 ml-20 p-5">
		<div class="text-purple-700 text-xl font-bold mb-2">메신저에서 바로 시작</div>
		<p class="text-gray-500 text-lg">
			화상회의 프로그램 설치, ZZOOM에서는 필요하지 않아요!<br/>
			복잡한 설치 없이 ZZOOM 메신저에서 화상회의를 바로 시작해 보세요.
		</p>
	</div>
		<!-- 오른쪽: 이미지 -->
		<div class="md:w-1/3 mr-20 p-10">
			<img src="img/info1.jpg" alt="sub pictures" 
				class="rounded-2xl w-full h-auto "/>
		</div>
	</div>
	
	<!-- 두번째 이미지 설명 -->
	<div class="flex flex-col md:flex-row items-center justify-between px-4 my-4 mt-5 ml-20 mr-20">
	<!-- 왼쪽: 이미지 설명 -->
	<div class="md:w-1/2 mb-4 ml-20 p-5">
		<div class="text-purple-700 text-xl font-bold mb-2">메신저에서 바로 시작</div>
		<p class="text-gray-400 text-lg">
			화상회의 프로그램 설치, ZZOOM에서는 필요하지 않아요!<br/>
			복잡한 설치 없이 ZZOOM 메신저에서 화상회의를 바로 시작해 보세요.
		</p>
	</div>
		<!-- 오른쪽: 이미지 -->
		<div class="md:w-1/3 mr-20 p-10">
			<img src="img/info2.jpg" alt="sub pictures" 
				class="rounded-2xl w-full h-auto "/>
		</div>
	</div>

	<!-- 세번째 이미지 설명 -->
	<div class="flex flex-col md:flex-row items-center justify-between px-4 my-4 mt-5 ml-20 mr-20">
	<!-- 왼쪽: 이미지 설명 -->
	<div class="md:w-1/2 mb-4 ml-20 p-5">
		<div class="text-purple-700 text-xl font-bold mb-2">초대하기</div>
		<p class="text-gray-500 text-lg">
			협력업체와의 화상회의가 필요하다면 게스트 초대하기를 사용해 보세요.<br/>
			ZZOM을 사용하지 않는 회사여도 ZZOM 화상회의 방에 초대할 수 있어요.
		</p>
	</div>
		<!-- 오른쪽: 이미지 -->
		<div class="md:w-1/3 mr-20 p-10">
			<img src="img/info3.jpg" alt="sub pictures" 
				class="rounded-2xl w-full h-auto "/>
		</div>
	</div>
	
	<!-- 네번째 이미지 설명 -->
	<div class="flex flex-col md:flex-row items-center justify-between px-4 my-4 mt-5 ml-20 mr-20">
	<!-- 왼쪽: 이미지 설명 -->
	<div class="md:w-1/2 mb-4 ml-20 p-5">
		<div class="text-purple-700 text-xl font-bold mb-2">설문, 프레젠테이션, 비디오 공유</div>
		<p class="text-gray-500 text-lg">
			프레젠테이션 자료나 비디오를 공유하고 함께 보며 회의를 진행할 수 있어요.<br/>
			화상회의 참여자의 실시간 의견과 반응을 파악해 보고 싶다면 설문조사와 투표 기능을 활용해 보세요.
		</p>
	</div>
		<!-- 오른쪽: 이미지 -->
		<div class="md:w-1/3 mr-20 p-10">
			<img src="img/info4.jpg" alt="sub pictures" 
				class="rounded-2xl w-full h-auto "/>
		</div>
	</div>
	
	<!-- 다섯번째 이미지 설명 -->
	<div class="flex flex-col md:flex-row items-center justify-between px-4 my-4 mt-5 ml-20 mr-20">
	<!-- 왼쪽: 이미지 설명 -->
	<div class="md:w-1/2 mb-4 ml-20 p-5">
		<div class="text-purple-700 text-xl font-bold mb-2">채팅, 노트 공유</div>
		<p class="text-gray-500 text-lg">
			화상회의 중 채팅을 하면서 시시각각 나오는 주제에 대해 자유롭게 대화할 수 있어요.<br/>
			노트기능에 중요한 내용들을 기록하여 화상회의 참여자와 의견을 공유해 보세요.
		</p>
	</div>
		<!-- 오른쪽: 이미지 -->
		<div class="md:w-1/3 mr-20 p-10">
			<img src="img/info5.jpg" alt="sub pictures" 
				class="rounded-2xl w-full h-auto "/>
		</div>
	</div>
	
	<!-- *************************************************************************************************** -->	
	
	<div clas="flex justify-center mt-5">
	<footer class="bg-gray-800 text-white py-8">
		</footer><div class="container mx-auto px-4">
			<div class="flex flex-wrap justify-between">
	            <!-- 왼쪽 영역: 사이트 정보 -->
	            <div class="w-full md:w-1/3 mb-4">
	                <div class="text-lg font-bold mb-2">회사 소개</div>
	                <p>중앙정보기술인재개발원</p>
	                <p>주소 : 서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)</p>
	                <p>전화번호 : 02-561-1911</p>
	                <p>Email : infoprotect@choongang.co.kr</p>
	            </div>
	            <!-- 중앙 영역: 사회 네트워크 및 연락처 링크 -->
	            <div class="w-full md:w-1/3 mb-4">
	                <h2 class="text-lg font-bold mb-2">연락처 및 소셜 미디어</h2>
	                <ul class="list-none">
	                    <li><a href="#">Instagram</a></li>
	                    <li><a href="#">Facebook</a></li>
	                    <li><a href="#">Twitter</a></li>
	                </ul>
	            </div>
	            <!-- 오른쪽 영역: 사이트 내비게이션 -->
	            <div class="w-full md:w-1/3 mb-4">
	                <h2 class="text-lg font-bold mb-2">사이트 내비게이션</h2>
	                <ul class="list-none">
	                    <li><a href="#">홈</a></li>
	                    <li><a href="#">서비스</a></li>
	                    <li><a href="#">회사 소개</a></li>
	                    <li><a href="#">고객 지원</a></li>
	                    <li><a href="#">문의하기</a></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</footer>
	</div>
	
	
</body>
</html>
