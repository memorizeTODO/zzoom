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
		window.open("findPasswdForm", "비번찾기");
	}
	function id_find() {
		window.open("findid", "아이디찾기");
	}
  </script>
<title>로그인</title>
</head>
<body class="bg-gray-100 h-500 w-450">
  <div class="bg-white shadow-md rounded m-80 p-40 scroll-m-0">
    <h1 class="text-center text-xl font-bold">로그인</h1><br/>
  <form method="post" action="member_login2" class="max-w-sm mx-auto" onsubmit="return check()">
    <div class="mb-5">
      <label for="member_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-bold">아이디</label>
      <input type="text" name="member_id" id="member_id"
        class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        placeholder="아이디"/>
    </div>
    <div class="mb-5">
      <label for="member_passwd" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-bold">비밀번호</label>
      <input type="password" name="member_passwd" id="member_passwd"
        class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
         placeholder="•••••••••"/>
    </div>
    <div class="mb-5">
      <label for="member_passwd" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white font-bold">방 번호</label>
      <input type="text" name="room_num" id="room_num"
        class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
         placeholder="50001 ~ 59999"/>
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