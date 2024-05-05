<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <title>회원탈퇴</title>
  <script>
    function check() {
      if ($.trim($("#member_passwd").val()) == "") {
        alert("비밀번호를 입력하세요!");
        $("#member_passwd").val("").focus();
        return false;
      }
    }
  </script>
</head>

<c:if test="${sessionScope.member_id != null}">
<body class="bg-gray-100 h-500 w-450">
  <div class="bg-white shadow-md rounded m-80 p-40 scroll-m-0">
    <h1 class="text-center text-xl font-bold">회원탈퇴</h1><br/>
  <form method="post" action="delete" class="max-w-sm mx-auto" onsubmit="return check()">
    
      <input type="hidden" name="member_id" id="member_id" value="${member_id}"
        class="bg-gray-50 border border-purple-400 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        />
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
    <div class="grid gap-6 mb-6 md:grid-cols-2">
      <button type="submit"
        class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-auto sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">확인</button>
      <button type="reset" 
        class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-auto sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" onClick="location='main';">취소</button>
    </div>
  </form>
</div>
</c:if>
<c:if test="${sessionScope.member_id == null}">
<body class="bg-gray-100 h-500 w-450">
  <div class="bg-white shadow-md rounded m-80 p-40 scroll-m-0">
    <h1 class="text-center text-xl font-bold">회원탈퇴 완료</h1><br/>
    <p class="text-center">그동안 이용해 주셔서 감사합니다</p>
    <div class="flex items-start mb-5">
      <div class="flex items-center h-5">
      </div>
    </div>
    <div class="grid gap-6 mb-6 md:grid-cols-1">
    <input type="button" value="닫기" class="text-white bg-purple-400 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-auto sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
    onclick="location.href='login'" />
    </div>
</div>
</c:if>
</body>
</html>