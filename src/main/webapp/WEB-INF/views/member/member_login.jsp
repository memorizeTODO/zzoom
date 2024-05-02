<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  
  <script src="http://code.jquery.com/jquery-latest.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet"/>
  <script>
  /*비번찾기 공지창*/
  function passwd_find(){
 	 window.open("findPasswdForm","비번찾기","width=450,height=500");
 	 //자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
 	 //메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
  }
 function id_find(){
	 window.open("findid","아이디찾기", "width=450, height=500");
 }
  </script>
<title>Login Page</title>
</head>
<body>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const modalToggleButtons = document.querySelectorAll('[data-modal-toggle]');
    const modalHideButtons = document.querySelectorAll('[data-modal-hide]');
    const modalContainers = document.querySelectorAll('[data-modal-target]');

    modalToggleButtons.forEach(button => {
        button.addEventListener('click', function () {
            const targetModal = document.getElementById(this.dataset.modalTarget);
            if (targetModal) {
                targetModal.classList.toggle('hidden');
                targetModal.setAttribute('aria-hidden', targetModal.classList.contains('hidden'));
            }
        });
    });

    modalHideButtons.forEach(button => {
        button.addEventListener('click', function () {
            const targetModal = document.getElementById(this.dataset.modalHide);
            if (targetModal) {
                targetModal.classList.add('hidden');
                targetModal.setAttribute('aria-hidden', true);
            }
        });
    });
});
</script>
 <div id="login_wrap">
  <h2 class="login_title">로그인</h2>
  <form method="post" action="member_login"	onsubmit="return check()">
   <table id="login_t">
    <tr>
     <th>아이디</th>
     <td>
      <input name="member_id" id="member_id" size="20" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="member_passwd" id="member_passwd" size="20" class="input_box"/>
     </td>
    </tr>
   </table>
<!--     <div id="login_menu"> -->
    <input type="submit" value="로그인" class="input_button" />
    <input type="reset" value="취소" class="input_button"
    		onclick="$('#member_id').focus();" />
    <input type="button" value="회원가입" class="input_button"
    		onclick="location='join'" />
    <input type="button" value="비번찾기" class="input_button"
    		onclick="passwd_find()" />
  <!--   <input type="button" value="아이디찾기" class="input_button"
    		onclick="id_find()" /> -->
    		
  </form>

<!-- Modal toggle -->
<button data-modal-target="authentication-modal" data-modal-toggle="authentication-modal" data-modal-show="authentication-modal" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
  아이디 찾기
</button>

<!-- Main modal -->
<div id="authentication-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-md max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="authentication-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-4 md:p-5">
                <form class="space-y-4" method="post" action="findIdForm">
                    <div>
                        <label for="member_email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이메일</label>
                        <input type="email" name="member_email" id="member_email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="가입 시 입력한 이메일을 입력해 주세요." />
                    </div>
                    <div>
                        <label for="member_password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>
                        <input type="password" name="member_password" id="member_password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"/>
                    </div>
                    <div class="flex justify-between">
                        <div class="flex items-start">
                            <div class="flex items-center h-5">
                                <!-- <input id="remember" type="checkbox" value="" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-600 dark:border-gray-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800" required /> -->
                            </div>
                            <!-- <label for="remember" class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Remember me</label> -->
                        </div>
                       <!--  <a href="" class="text-sm text-blue-700 hover:underline dark:text-blue-500">Lost Password?</a> -->
                    </div>
                    <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">확인</button>
                    <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
                        회원가입이 안되어 있다면 <a href="join" class="text-blue-700 hover:underline dark:text-blue-500">회원가입</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div> 
    		
    
    </div>

</body>
</html>