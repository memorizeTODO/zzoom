<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<script>
    function check() {
      if ($.trim($("#member_id").val()) == "") {
        alert("아이디를 입력해 주세요.");
        $("#member_id").val("").focus();
        return false;
      }
      if ($.trim($("#member_passwd").val()) == "") {
        alert("비밀번호를 입력해 주세요.");
        $("#member_passwd").val("").focus();
        return false;
      }
    }
	
	function passwd_find() {
		window.open("findPasswdForm", "비밀번호 찾기","width=1250,height=500,scrollbars=yes");
	}
	function id_find() {
		window.open("findid", "아이디찾기","width=1250,height=500,scrollbars=yes");
	}
  </script>
<title>로그인</title>
</head>
<body class="bg-gray-100 h-500 w-450">
<!-- 상단 고정바 -->
<nav class="bg-white fixed w-full z-20 top-0 start-0 border-b border-gray-200">
   
   <!-- 로고 -->
   <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
      <a href="main"
         class="flex items-center space-x-3 rtl:space-x-reverse">
         <img src="/image/logozzoom.png" class="h-10" alt="ZZOM Logo" />
         <span class="self-center text-2xl font-semibold whitespace-nowrap mt-3 mb-3"></span>
      </a>
   
    <!-- 로그인버튼 -->
   <div class="flex flex-row-reverse md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
         <c:if test="${sessionScope.member_id == null}">
      <button type="button" onClick="location='login'"
         class="text-white font-bold bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3">
         로그인
      </button>
         </c:if>
         <c:if test="${sessionScope.member_id != null}">
      <button type="button" onClick="location='member_logout'"
         class="text-white font-bold bg-purple-700 hover:bg-purple-500 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3">
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
  <div class="bg-white shadow-md rounded m-80 p-40 scroll-m-0">
    <h1 class="text-center text-xl font-bold">로그인</h1><br/>
  <form method="post" action="member_login" class="max-w-sm mx-auto" onsubmit="return check()">
    <div class="mb-5">
      <label for="member_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-bold">아이디</label>
      <input type="text" name="member_id" id="member_id"
        class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        placeholder="ID"/>
    </div>
    <div class="mb-5">
      <label for="member_passwd" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-bold">비밀번호</label>
      <input type="password" name="member_passwd" id="member_passwd"
        class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
         placeholder="•••••••••"/>
    </div>
    <div class="flex items-start mb-5">
      <div class="flex items-center h-5">

      </div>

    </div>
    <div class="grid gap-6 mb-6 md:grid-cols-1">
      <button type="submit"
        class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-auto sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">로그인</button>
  	</div>
  	
    <div class="grid gap-6 mb-6 md:grid-cols-3">
      <button type="button" onClick="location='join'"
        class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-auto sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">회원가입</button>
      <button type="button" onClick="id_find();"
        class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-auto sm:w-auto px-3 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">아이디 찾기</button>
      <button type="button" onClick="passwd_find();"
        class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-auto sm:w-auto px-2 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">비밀번호 찾기</button>
       </div>
  </form>
</div>
</body>
</html>