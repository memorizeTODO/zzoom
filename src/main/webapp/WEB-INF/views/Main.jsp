<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<!-- 상단 고정바 -->
<nav class="bg-white fixed w-full z-20 top-0 start-0 border-b border-gray-200">
	
	<!-- 로고 -->
	<div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
		<a href="https://www.naver.com/"
			class="flex items-center space-x-3 rtl:space-x-reverse">
		<img src="img\logozzoom.png" class="h-10" alt="C:\Users\qwzx0\git\zzoom\src\main\resources\static\img\logozzoom.png" />
		<span class="self-center text-2xl font-semibold whitespace-nowrap mt-3 mb-3"></span>
		</a>
	
	<!-- 로그인버튼 -->
	<div class="flex flex-row-reverse md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
		<button type="button"
			class="text-white font-bold bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3">
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
				<a href="notice_list"
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
	<!-- 이미지와 내용이 들어갈 컨테이너 -->
<!-- 	<div class="">
	<img src="img\mainpicture.jpg" alt="Main Picture" 
		class="rounded-lg w-full h-100 mt-4 md-5"/>
	</div> -->


<!-- 이미지 슬라이드 / 검색 -->
<div class="w-full">
	<div class="swiper">
		<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="0"
			centered-slides="true" autoplay-delay="5000" autoplay-disable-on-interaction="false">
			<swiper-slide>
				<img src="img\mainpicture.jpg" class="w-full">
			</swiper-slide>
			<swiper-slide>
				<img src="img\mainpicture2.png" class="w-full">
			</swiper-slide>
		</swiper-container>
	</div>

	<!-- 텍스트와 버튼 -->
	<div class="absolute inset-0 flex flex-col items-center justify-center text-center text-white" >
		<!-- 텍스트 -->
		<h2 class="text-3xl md:text-5xl font-bold mb-4">ONLY MEEEEEEETING</h2>
		<p class="text-lg md:text-2xl mb-8">화상회의의 뒷북을 치다</p>
		
		<!-- 버튼 -->
		<button class="bg-purple-700 hover:bg-purple-400 px-11 py-4 rounded-lg text-lg md:text-lg font-bold" > 회의 참가 </button>
	</div>
	</div>
	
	<hr />
	
	<!-- 이미지 설명 -->
	<div class="flex flex-col md:flex-row items-center justify-between px-4 my-4 ">
	
	<!-- 왼쪽: 이미지 설명 -->
	<div class="md:w-1/2 mb-4 md:mb-0 px-5">
		<h3 class="text-2xl font-bold mb-2">메신저에서 바로 시작</h3>
		<p class="text-gray-400 text-2xl">
		화상회의 프로그램 설치, ZZOOM에서는 필요하지 않아요!
		복잡한 설치 없이 ZZOOM 메신저에서 화상회의를 바로 시작해 보세요.
		</p>
	</div>
	
	<!-- 오른쪽: 이미지 -->
	<div class="md:w-1/2 p-10">
		<img src="img/info1.jpg" alt="Main Picture Description" class="rounded-2xl w-full h-auto "/>
	</div>
	</div>
	
<br/>

	<div class="flex flex-col md:flex-row items-center justify-between px-10 my-10 ">
	
	<!-- 왼쪽: 이미지 설명 -->
	<div class="md:w-1/2 mb-4 md:mb-0 px-5">
	<h3 class="text-2xl font-bold mb-2">게스트 초대하기</h3>
	<p class="text-gray-400 text-2xl">
	협력업체와의 화상회의가 필요하다면 게스트 초대하기를 사용해 보세요.
	ZZOM을 사용하지 않는 회사여도 ZZOM 화상회의 방에 초대할 수 있어요.
	</p>
	</div>
	
	<!-- 오른쪽: 이미지 -->
	<div class="md:w-1/2 p-10">
		<img src="img/info2.jpg" alt="Main Picture Description" class="rounded-2xl w-full h-auto"/>
	</div>
</div>
<br/>
<div class="flex flex-col md:flex-row items-center justify-between px-10 my-10">
  <!-- 왼쪽: 이미지 설명 -->
<div class="md:w-1/2 mb-4 md:mb-0 px-5">
  <h3 class="text-2xl font-bold mb-2">설문, 프레젠테이션, 비디오 공유</h3>
  <p class="text-gray-400 text-2xl">프레젠테이션 자료나 비디오를 공유하고 함께 보며 회의를 진행할 수 있어요.
  화상회의 참여자의 실시간 의견과 반응을 파악해 보고 싶다면 설문조사와 투표 기능을 활용해 보세요.</p>
</div>
<!-- 오른쪽: 이미지 -->
  <div class="md:w-1/2 p-10">
    <img src="img/info3.jpg" alt="Main Picture Description" class="rounded-2xl w-full h-auto" rounded />
  </div>
</div>
<br/>
<div class="flex flex-col md:flex-row items-center justify-between px-10 my-10">
  <!-- 왼쪽: 이미지 설명 -->
<div class="md:w-1/2 mb-4 md:mb-0 px-5">
  <h3 class="text-2xl font-bold mb-2">채팅, 노트 공유</h3>
  <p class="text-gray-400 text-2xl">화상회의 중 채팅을 하면서 시시각각 나오는 주제에 대해 자유롭게 대화할 수 있어요.
    노트기능에 중요한 내용들을 기록하여 화상회의 참여자와 의견을 공유해 보세요.</p>
</div>
<!-- 오른쪽: 이미지 -->
  <div class="md:w-1/2 p-10">
    <img src="img/info4.jpg" alt="Main Picture Description" class="rounded-2xl w-full h-auto" rounded />
  </div>
</div>
<br/>
<div class="flex flex-col md:flex-row items-center justify-between px-10 my-10">
  <!-- 왼쪽: 이미지 설명 -->
<div class="md:w-1/2 mb-4 md:mb-0 px-5">
  <h3 class="text-2xl font-bold mb-2">상태 공유</h3>
  <p class="text-gray-400 text-2xl">부재중과 같은 참여 상태 공유는 물론, 현재 논의 중인 내용에 대한 생각과 감정을 표현해 보세요. '부재중, 올리기, 미결정, 혼란함, 슬픔, 박수' 등을 표시할 수 있어요.</p>
</div>
<!-- 오른쪽: 이미지 -->
      <div class="md:w-1/2 p-10">
        <img src="img/info5.jpg" alt="Main Picture Description" class="rounded-2xl w-full h-auto" rounded />
      </div>
    </div>
  </div>
  </body>
</html>
