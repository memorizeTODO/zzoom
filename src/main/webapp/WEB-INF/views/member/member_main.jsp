<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<title>main page</title>
</head>
<body>
<!-- 상단 고정바 -->
<nav class="bg-white fixed w-full z-20 top-0 start-0 border-b border-gray-200">
   
   <!-- 로고 -->
   <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
      <a href="/main"
         class="flex items-center space-x-3 rtl:space-x-reverse ml-2">
      <img src="img\logozzoom.png" class="h-10" alt="C:\Users\qwzx0\git\zzoom\src\main\resources\static\img\logozzoom.png" />
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
<br/><br/><br/><br/>
<div>
<p align="center">메인페이지 import 예정</p>
</div>
</body>
</html>