<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>공지사항 삭제</title>
  </head>
  <body>
    <div class="container mx-auto mt-10">
      <h1 class="text-3xl font-bold mb-5">공지사항 삭제</h1>
      <form method="post" action="noticeDelete">
        <input type="hidden" name="notice_id" value="${notice.notice_id}" />
        <input type="hidden" name="page" value="${notice.page}" />
        <div class="max-w-lg bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
          <div class="mb-6">
            <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>
            <input type="password" id="password" name="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="비밀번호를 입력하세요." required />
          </div> 
          <div class="flex justify-center">
            <button type="submit" class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-3">
              삭제하기
            </button>
            <button type="button" onclick="window.history.back()" class="text-gray-700 bg-gray-200 hover:bg-gray-300 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
              취소
            </button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>