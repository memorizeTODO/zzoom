   

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>회의목록</title>
    <script>
    function update1(meeting_room_num, meeting_id, page){
    	
    	location.href="meetingupdateform?meeting_room_num="+meeting_room_num+"&meeting_id="+meeting_id+"&page="+page;    	
    }
    
    function delete1(meeting_id){
    	
    	location.href="meetingdelete?meeting_id="+meeting_id;    	
    }
    </script>
</head>
<body>
  
  <!-- 상단바 -->
<header> 
<nav class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto">
        <a href="main" class="flex items-center space-x-3 rtl:space-x-reverse">
            <img src="img/zzoom_logo.png" class="h-10" alt="ZZOM Logo" />
            <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white"></span>
        </a>
        <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
           <button type="button"   onClick="location.href='logout' "
            	   class="text-white bg-purple-500 hover:bg-purple-700 focus:ring-2 focus:outline-none font-large rounded-lg text-md px-4 py-2.5 text-center mt-2 mb-2">
                   로그아웃
            </button>
        </div>
 
    </div>
</nav>
</header> 


<div class = "mt-16 ml-44">
<!-- 회의관리 상단바  -->
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-center text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr class="pl-10 ">
             <th scope="col" class="px-8 py-3">
                <span class="w-full flex">
                  번 호
                </span>  
              </th>
              <th scope="col" class="px-6 py-3">
                  회의명
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 ID
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 호스트
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 예약 날짜
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 시작 날짜
              </th>
			  <th scope="col" class="px-6 py-3">
                  회의 비밀번호
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 수정
              </th>
              <th scope="col" class="px-6 py-3">
                  회의 삭제
              </th>
          </tr>
      </thead>
      <tbody>
      
      	<!-- 화면 출력 번호 -->
		<c:set var="num" value="${listcount-(page-1)*10 }"/>
      
      	<c:forEach var="m" items="${meetinglist }">
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600 text-center">
          	 <td class="w-4 py-7">${num} <c:set var="num" value="${num-1}"/> </td>
              <td>${m.meeting_topic }</td>
              <td>${m.meeting_id }</td>
              <td>${m.member_name }</td>
              <td>${m.meeting_registration_date}</td>
              <td>${m.meeting_start_date}</td>
              <td>${m.meeting_passwd}</td>

              <td>
              	<button type="button" onClick="update1('${m.meeting_room_num}','${m.meeting_id}', '${page}')"
					  class="text-white bg-purple-500 hover:bg-purple-700 focus:ring-2 focus:outline-none font-large rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 ">수정
			  	</button>
              </td>
             
             <td>
              	<button type="button" onClick="delete1('${m.meeting_id}')"
					  class="text-white bg-purple-500 hover:bg-purple-700 focus:ring-2 focus:outline-none font-large rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 ">삭제
			  	</button>
              </td>
             
             
             
             

          </tr>
      </c:forEach>    
      </tbody>
  </table>
</div>

<!-- 페이지 처리 -->
<center>
<c:if test="${listcount > 0 }">

<!-- 1page로 이동 -->
<a href="meetinglist?page=1" style="text-decoration:none"> < </a>

<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10 }">
	<a href="meetinglist?page=${startPage-10}">[이전]</a>
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page }">   <!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page }">   <!-- 현재 페이지가 아닌 경우 -->
		<a href="meetinglist?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동 -->
<c:if test="${endPage < pageCount }">
	<a href="meetinglist?page=${startPage+10}">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="meetinglist?page=${pageCount}" style="text-decoration:none"> > </a>

</c:if>
</center>		
		


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


</div>
</body>
</html>
