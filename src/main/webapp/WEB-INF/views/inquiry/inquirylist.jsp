<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Document</title>
</head>
<body>
  
  <!-- 상단바 -->
<nav class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
        <a href="adminmain" class="flex items-center space-x-3 rtl:space-x-reverse">
            <img src="img/zzoom_logo.png" class="h-10" alt="ZZOM Logo" />
            <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white"></span>
        </a>
        <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
            <button type="button"   onClick="location.href='adminlogout' "
            		class="text-white bg-blue-800 hover:bg-blue-300 focus:ring-10 focus:outline-none font-large rounded-lg text-md px-6 py-3 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                로그아웃
            </button>
        </div>
       <!--  <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1 justify-end"" id="navbar-sticky">
            <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                <li>
                    <a href="#" class="block py-3 px-4 text-white bg-purple-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500" aria-current="page">회의시작</a>
                </li>
                <li>
                    <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">공지사항</a>
                </li>
                <li>
                    <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">문의사항</a>
                </li>
            </ul>
        </div> -->
    </div>
</nav>

<!-- 그냥 빈칸줄 -->
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
  <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
      <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        
          <tr>
              <th scope="col" class="p-4">
                  <div class="flex items-center">
                      <input id="checkbox-all-search" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-all-search" class="sr-only">checkbox</label>
                  </div>
              </th>
              <th scope="col" class="px-10 py-3">
                 
              </th>
              <th scope="col" class="px-10 py-3">
                  
              </th>
              <th scope="col" class="px-10 py-3">
                 
              </th>
              <th scope="col" class="px-10 py-3">
                
              </th>
              <th scope="col" class="px-10 py-3">
                 
              </th>
          </tr>
      </thead>
  </table>


<!-- 회의관리 상단바-->
<div class="relative overflow-x-auto shadow-md sm:rounded-lg pl-10">
  <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400 ml-32">
      <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        
          <tr>
              <th scope="col" class="p-4">
                  <div class="flex items-center">
                      <input id="checkbox-all-search" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-all-search" class="sr-only">checkbox</label>
                  </div>
              </th>
              <th scope="col" class="px-6 py-3">
                  문의 번호
              </th>
              <th scope="col" class="px-6 py-3">
                  문의사항 제목
              </th>
              <th scope="col" class="px-6 py-3">
                  작성자
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 호스트
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 비밀번호
              </th>
          </tr>
      </thead>

      <tbody>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-1" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  홍길동
              </th>
              <td class="px-6 py-4">
                  MR.Hong
              </td>
              <td class="px-6 py-4">
                  hong123
              </td>
              <td class="px-6 py-4">
                  Yes
              </td>
              <td class="px-6 py-4">
                  회의 난동
              </td>
              <td class="px-6 py-4">
                  2024-04-19
              </td>
              <td class="px-6 py-4">
                  2024-04-20
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">정지 해제</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">강제 탈퇴</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-2" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-2" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
              
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td cl
              
              ass="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
              
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              <td class="w-4 p-4">
                  <div class="flex items-center">
                      <input id="checkbox-table-search-3" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                      <label for="checkbox-table-search-3" class="sr-only">checkbox</label>
                  </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                  
              </th>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="px-6 py-4">
                  
              </td>
              <td class="flex items-center px-6 py-4">
                  <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                  <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline ms-3">Remove</a>
              </td>
          </tr>
      </tbody>
  </table>
</div>




<!-- 사이드바 -->
<aside id="logo-sidebar" class="fixed top-0 left-0 z-200 w-200 h-screen pt-20 transition-transform -translate-x-full bg-white border-r border-gray-200 sm:translate-x-0 dark:bg-gray-800 dark:border-gray-700" aria-label="Sidebar">
    <div class="h-full px-3 pb-4 overflow-y-auto bg-white dark:bg-gray-800">
        <ul class="space-y-2 font-medium">
            <li>
                <a href="meetinglist" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 21">
                        <path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z"/>
                        <path d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z"/>
                    </svg>
                    	<span class="flex-1 ms-3 whitespace-nowrap">회의관리</span>
                </a>
            </li>
            <li>
                <a href="memberlist" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 18">
                        <path d="M6.143 0H1.857A1.857 1.857 0 0 0 0 1.857v4.286C0 7.169.831 8 1.857 8h4.286A1.857 1.857 0 0 0 8 6.143V1.857A1.857 1.857 0 0 0 6.143 0Zm10 0h-4.286A1.857 1.857 0 0 0 10 1.857v4.286C10 7.169 10.831 8 11.857 8h4.286A1.857 1.857 0 0 0 18 6.143V1.857A1.857 1.857 0 0 0 16.143 0Zm-10 10H1.857A1.857 1.857 0 0 0 0 11.857v4.286C0 17.169.831 18 1.857 18h4.286A1.857 1.857 0 0 0 8 16.143v-4.286A1.857 1.857 0 0 0 6.143 10Zm10 0h-4.286A1.857 1.857 0 0 0 10 11.857v4.286c0 1.026.831 1.857 1.857 1.857h4.286A1.857 1.857 0 0 0 18 16.143v-4.286A1.857 1.857 0 0 0 16.143 10Z"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">회원관리</span>
                </a>
            </li>
            <li>
                <a href="noticelist" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="m17.418 3.623-.018-.008a6.713 6.713 0 0 0-2.4-.569V2h1a1 1 0 1 0 0-2h-2a1 1 0 0 0-1 1v2H9.89A6.977 6.977 0 0 1 12 8v5h-2V8A5 5 0 1 0 0 8v6a1 1 0 0 0 1 1h8v4a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-4h6a1 1 0 0 0 1-1V8a5 5 0 0 0-2.582-4.377ZM6 12H4a1 1 0 0 1 0-2h2a1 1 0 0 1 0 2Z"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">공지사항 관리</span>
                </a>
            </li>
            <li>
              <a href="inquirylist" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                  <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                      <path d="m17.418 3.623-.018-.008a6.713 6.713 0 0 0-2.4-.569V2h1a1 1 0 1 0 0-2h-2a1 1 0 0 0-1 1v2H9.89A6.977 6.977 0 0 1 12 8v5h-2V8A5 5 0 1 0 0 8v6a1 1 0 0 0 1 1h8v4a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-4h6a1 1 0 0 0 1-1V8a5 5 0 0 0-2.582-4.377ZM6 12H4a1 1 0 0 1 0-2h2a1 1 0 0 1 0 2Z"/>
                  </svg>
                  <span class="flex-1 ms-3 whitespace-nowrap">문의사항 관리 </span>                 
              </a>
          </li>
        </ul>
    </div>
</aside>
</body>
</html>
