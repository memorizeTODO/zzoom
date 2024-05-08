<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>관리자 로그인폼</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
  
   <!-- 상단바 -->
<nav class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
  <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
      <a href="mainpage" class="flex items-center space-x-3 rtl:space-x-reverse">
          <img src="img\zzoom_logo.png" class="h-10" alt="ZZOM Logo" />
          <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white"></span>
      </a>
  
      <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1 justify-end"" id="navbar-sticky">
          <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
      
          </ul>
      </div>
  </div>
</nav>
<br><br><br>

<form class="max-w-sm mx-auto"  method="post"  action="adminlogin">
  <div class="mb-5">
    <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이디</label>
    <input type="text" name="manager_id" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="아이디" required />
  </div>
  <div class="mb-5">
    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>
    <input type="password" id="password" name="manager_passwd" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="비밀번호" required />
  </div>
  <div class="flex items-start mb-5">
  </div>
		<button type="submit"
				class="text-white bg-purple-500 hover:bg-purple-700 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-3 mb-3">
				로그인
		</button>
	</form>


</body>
</html>
