<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="scroll-smooth">
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
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
	
	// 회원정보 수정 유효성 검사
	function edit_check(){
		if($.trim($("#member_passwd").val())==""){
			 alert("비밀번호를 입력해 주세요.");
			 $("#member_passwd").val("").focus();
			 return false;
		 }
		 if($.trim($("#confirm_password").val())==""){
			 alert("비밀번호 확인을 입력해 주세요.");
			 $("#confirm_password").val("").focus();
			 return false;
		 }
		 if($.trim($("#member_passwd").val()) != $.trim($("#confirm_password").val())){
			 alert("비밀번호가 일치하지 않습니다.");
			 $("#member_passwd").val("");
			 $("#confirm_password").val("");
			 $("#member_passwd").focus();
			 return false;
		 }
		 
		 if($.trim($("#member_phone").val())==""){
			 alert("휴대전화번호를 입력해 주세요.");
			 $("#member_phone").val("").focus();
			 return false;
		 }
		 
		 if($.trim($("#member_email").val())==""){
			 alert("메일 아이디를 입력해 주세요.");
			 $("#member_email").val("").focus();
			 return false;
		 } 
	}
</script>

<title>마이페이지</title>
</head>
<body class="bg-gray-100 ">
<!-- 상단 고정바 -->
<nav class="bg-white fixed w-full z-20 top-0 start-0 border-b border-gray-200">
   
   <!-- 로고 -->
   <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
      <a href="/main"
         class="flex items-center space-x-3 rtl:space-x-reverse ml-2">
      <img src="image\logozzoom.png" class="h-10" alt="C:\Users\qwzx0\git\zzoom\src\main\resources\static\img\logozzoom.png" />
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
            <a href="#" aria-current="page"
               class="font-bold block py-3 px-4 text-white bg-gray-900 rounded md:bg-transparent md:text-purple-700 md:p-0">
               회의시작
            </a>
         </li>
      <!--    <li>
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
	<div class="bg-white shadow-md rounded m-80 p-40 scroll-m-0">
		<h1 class="text-center text-xl font-bold">마이 페이지</h1>
		<br /> <br />
		<form method="post" action="myPageEdit" onsubmit="return edit_check()">

			<div class="grid gap-6 mb-6 md:grid-cols-1">
			

<div class="mx-20 mb-10 w-full max-w-sm bg-white border border-purple-700 rounded-lg shadow-md dark:bg-gray-800 dark:border-gray-700">
    <div class="flex justify-end px-4 pt-4">
<!--         <button id="dropdownButton" data-dropdown-toggle="dropdown" class="inline-block text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:ring-4 focus:outline-none focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-1.5" type="button"> -->
<!--             <span class="sr-only">Open dropdown</span> -->
<!--             <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 3"> -->
<!--                 <path d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z"/> -->
<!--             </svg> -->
<!--         </button> -->
<!--         Dropdown menu -->
<!--         <div id="dropdown" class="z-10 hidden text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700"> -->
<!--             <ul class="py-2" aria-labelledby="dropdownButton"> -->
<!--             <li> -->
<!--                 <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Edit</a> -->
<!--             </li> -->
<!--             <li> -->
<!--                 <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Export Data</a> -->
<!--             </li> -->
<!--             <li> -->
<!--                 <a href="#" class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Delete</a> -->
<!--             </li> -->
<!--             </ul> -->
<!--         </div> -->
    </div>
    <div class="flex flex-col items-center pb-10">
        <img class="w-24 h-24 mb-3 rounded-full shadow-lg" src="/image/default_image.png" alt="default_image"/>
        <h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">${member.member_id} </h5>
        <span class="text-sm text-gray-500 dark:text-gray-400">일반회원</span>
        <div class="flex mt-4 md:mt-6">
            <a href="#" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-white bg-purple-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">아무거나 추가하자</a>
            <a href="#" class="py-2 px-4 ms-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-400 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">아무거나 추가하자</a>
        </div>
    </div>
</div>
			

<!-- 				<div> -->
<!-- 					<label for="member_id" -->
<!-- 						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">아이디</label> -->
<!-- 					<div class="flex flex-row"> -->
<%-- 						<input type="text" name="member_id" id="member_id" value="${member.member_id }" --%>
<!-- 							class="mr-5 bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" -->
<!-- 							placeholder="아이디를 입력해 주세요." readonly />  -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div>
					<label for="password"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">비밀번호</label>
					<input type="password" name= "member_passwd" id="member_passwd"
						class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="•••••••••" />
				</div>
				<div>
					<label for="confirm_password"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">비밀번호
						확인</label> <input type="password" name="confirm_password"
						id="confirm_password"
						class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="•••••••••" />
				</div>
				<div>
					<label for="member_name"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">이름</label>
					<input type="text" name="member_name" id="member_name" value="${member.member_name}"
						class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="이름을 입력해 주세요." readonly/>
				</div>
				<div>
					<label for="member_phone"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">휴대전화
						번호 </label> <input type="tel" name="member_phone" id="member_phone" value="${member.member_phone}" 
						class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="변경 할 휴대전화 번호를 입력해 주세요."
						pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" />
				</div>
				<div>
					<label for="member_zipcode"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">우편번호</label>
					<input name="member_zipcode" id="member_zipcode" value="${member.member_zipcode}"
						class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-1/3 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="우편번호를 입력해 주세요." readonly onclick="openDaumPostcode()" />
					<!-- <input type="button" value="우편번호검색" class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto mx-60 my  px-2 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"" onclick="openDaumPostcode()" /> -->

				</div>
				<div>
					<label for="member_address"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">주소
					</label> 
					<input name="member_address" id="member_address" value="${member.member_address}" 
						class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="주소를 입력해 주세요." onclick="openDaumPostcode()"readonly />
				</div>
				<div>
					<label for="member_address_detail"
						class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">상세주소</label>
					<input name="member_address_detail" id="member_address_detail" value="${member.member_address_detail}" 
						class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="상세주소를 입력해 주세요."/>
				</div>
			</div>
			<div class="mb-6">
				<label for="member_email"
					class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">Email
				</label> <input type="email" name="member_email" id="member_email" value="${member.member_email}" 
					class="bg-gray-50 border border-purple-700 text-gray-900 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					placeholder="example@example.com" />
			</div>

			<div class="grid gap-6 mb-6 md:grid-cols-2">
				<button type="submit"
					class="text-white bg-purple-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" >확인</button>
				<button type="reset"
					class="text-white bg-purple-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" onclick="location='main';">취소</button>
			</div>
			<div class="grid gap-6 mb-6 md:grid-cols-1">
				<button type="button" onclick="location='deleteForm';"
					class="text-white bg-purple-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" >회원탈퇴</button>
			</div>
		</form>
	</div>
</body>
</html>