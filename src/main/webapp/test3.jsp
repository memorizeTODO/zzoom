<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="">
    </head>
    <body>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />   
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>    
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	

        <nav class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 start-0 border-black-200 " ></nav>            
                <div class="px-5 w-full flex flex-wrap items-center justify-between mx-auto  border-b-2">
                    <a href="https://www.naver.com/" class="flex items-center space-x-3 rtl:space-x-reverse">
                        <img src="img\logozzoom.png" class="h-10" alt="ZZOM Logo" />
                        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white"></span>
                    </a>
                    <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
                        <button type="button" class="text-white bg-purple-700 hover:bg-purple-400 
                                                    focus:ring-10 focus:outline-none
                                                     font-large rounded-lg text-md px-6 py-3 text-center mb-3">로그인</button>
                    </div>   
                    <div id="navbar-sticky" class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1 justify-end">
                        <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 
                                   rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white">
                        <li>
                            <a href="#" aria-current="page"
                            
                            class="block py-3 px-4 bg-gray-900 text-gray-900 rounded md:bg-transparent md:text-purple-700 md:p-0">회의시작</a>
                        </li> 
                        <li>
                            <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 
                                                md:hover:bg-transparent md:hover:text-purple-700 md:p-0">공지사항</a>
                        </li>      
                        <li>
                            <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 
                                            md:hover:bg-transparent md:hover:text-purple-700 md:p-0">문의사항</a>
                        </li>
                        </ul>
                    </div>
                </div>
            </nav>    
        <!-- 하단 페이지 -->

        <div class= "mx-10">   
            <div class="mt-5 mb-20 px-20 py-20 bg-purple-600 rounded">
                <form class="flex items-center  justify-center border-gray-300" id="insertForm">   
                    <div class="relative w-full">
                        <div class="absolute inset-y-0 start-0 flex ps-3 pointer-events-none"></div>
                        <input type="text" id="meeting_id"  name="meeting_id"
                               class="bg-gray-50 border border-gray-300 text-gray-900 text-4xl rounded-lg 
                               			focus:ring-blue-500 focus:border-blue-500 w-full ps-10 p-2.5 text-center" 
                               placeholder="방 입장 코드를 입력해주세요" required />                                                                            
                    </div>
                    <button type="button" onclick="openModal()" 
                            class="p-2.5 ms-2 text-sm font-medium 
                                   text-white bg-blue-700 rounded-lg border border-blue-700 
                                   hover:bg-blue-800 focus:ring-4 focus:outline-none 
                                   focus:ring-blue-300">
                        <svg class="w-16 h-12" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                        </svg>
           
                    </button>
                </form>      

                


                <!-- Modal toggle -->
            <button data-modal-target="passwdModal" data-modal-toggle="passwdModal" type="hidden" id ="passwd-modal"></button>
            <button data-modal-target="updateModal" data-modal-toggle="updateModal" type="hidden" id ="update-modal"></button>
            <button data-modal-target="deletePasswdModal" data-modal-toggle="deletePasswdModal" type="hidden" id ="deletePasswd-modal"></button>
                       
                	 
            </div>
            <div class="relative flex flex-row-reverse pr-56">
                        <button type="button" data-modal-target="crud-modal" data-modal-toggle="crud-modal"
                        class="text-white bg-purple-600 hover:bg-purple-400 
                               focus:ring-10 focus:outline-none
                               font-large rounded-lg text-md text-2xl 
                               font-extrabold px-8 py-3 text-center mb-3 mr-20">회의 등록</button>
            </div>
            <div class="flex pl-52 flex-cols">
	            <div class="bg-gray-50 w-10/12 h-auto py-10 px-20 overflow-y-scroll relative place-self-center rounded-lg 	 " >
	                   <div id="meetingList">
					 </div>   
	            </div>              
            </div> 
        </div>
            <!-- Main modal --> 
        <div id="passwdModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <div class="relative p-4 w-full max-w-md max-h-full">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                        <!-- Modal header -->
                        <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                                비밀번호 입력
                            </h3>
                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="passwdModal">
                                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                        </div>
                        <!-- Modal body -->
                            <form class="max-w-sm mx-auto my-5" id = "passwdform">
                                <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
                                <div class="relative">
                                    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">         
                                    </div>
                                    <input type="number" id="enter-passwd" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" name="enter-passwd" class="block w-full p-4 ps-10 text-lg text-gray-900 border border-gray-300 
                                                                                    rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 " 
                                                                                    placeholder="비밀번호 4자리를 입력해주세요" required />

                                </div>
                                <div class="flex justify-end">
                                <button type="button" onclick="search()" class="text-white inline-flex flex justify-self-center bg-blue-700 hover:bg-blue-800 
                                                            focus:ring-4 focus:outline-none focus:ring-blue-300 my-5
                                                            font-medium rounded-lg  text-sm px-5 py-2.5 text-center">            
                                <svg class="me-1 -ms-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
                                입장
                                </button>
                                </div>
                            </form>
                            
                    </div>
                </div>
        </div> 
        
        



<!-- Main modal -->
<div id="crud-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-md max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-lg font-semibold text-gray-900">
                    회의 등록
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="crud-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <form class="p-4 md:p-5">
                <div class="grid gap-4 mb-4 grid-cols-2">
                    <div class="col-span-2">
                        <label for="meetingTopic" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">회의 이름</label>
                        <input type="text" maxlength="10" name="meetingTopic" id="meetingTopic" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="회의 이름/토픽" required="">
                    </div>
                    <div class="col-span-2">
                        <label for="meetingPasswd" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">회의 비밀번호</label>
                        <input type="number" name="meetingPasswd" id="meetingPasswd" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="비밀번호" required="">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="meetingMemberNum" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">회의 최대 인원수</label>
                        <input type="number" name="meetingMemberNum" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" id="meetingMemberNum"  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
                        																		  focus:ring-primary-600 focus:border-primary-600 
                        																		  block w-full p-2.5" placeholder="인원수" required="">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="meetingStartDate" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">회의 시작일</label>
                        <input type="datetime-local" name="meetingStartDate" id="meetingStartDate" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
                        																		  focus:ring-primary-600 focus:border-primary-600 
                        																		  block w-full p-2.5" placeholder="인원수" required="">
                    </div>
 
                </div>
                <div class="flex justify-end">
	                <button type="button" onclick="saveMeeting()" class="text-white inline-flex items-center bg-blue-700 
	                							hover:bg-blue-800 focus:ring-4 focus:outline-none
	                							focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
	                    <svg class="me-1 -ms-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
	                    회의등록
	                </button>
	            </div>    
            </form>
        </div>
    </div>
</div> 
        
<div id="deletePasswdModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <div class="relative p-4 w-full max-w-md max-h-full">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                        <!-- Modal header -->
                        <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                                비밀번호 입력
                            </h3>
                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="deletePasswdModal">
                                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                        </div>
                        <!-- Modal body -->
                            <form class="max-w-sm mx-auto my-5" id = "deletePasswdform">
                                <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
                                <div class="relative">
                                    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">         
                                    </div>
                                    <input type="number" id="deletePasswd" name="deletePasswd" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" class="block w-full p-4 ps-10 text-lg text-gray-900 border border-gray-300 
                                                                                    rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 " 
                                                                                    placeholder="비밀번호를 입력해주세요" required />

                                </div>
                                <div class="flex justify-end">
                                <button type="button" onclick="deleteMeeting()" class="text-white inline-flex flex justify-self-center bg-blue-700 hover:bg-blue-800 
                                                            focus:ring-4 focus:outline-none focus:ring-blue-300 my-5
                                                            font-medium rounded-lg  text-sm px-5 py-2.5 text-center">            
                                <svg class="me-1 -ms-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
                                삭제
                                </button>
                                </div>
                            </form>
                            
                    </div>
                </div>
        </div> 

<!-- Main modal -->
<div id="updateModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-md max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                    회의 수정
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="updateModal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <form class="p-4 md:p-5">
                <div class="grid gap-4 mb-4 grid-cols-2">
                    <div class="col-span-2">
                        <label for="updateMeetingTopic" class="block mb-2 text-sm font-medium text-gray-900">회의 이름</label>
                        <input type="text" name="updateMeetingTopic" id="updateMeetingTopic" maxlength="10" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="회의 이름/토픽" required="">
                    </div>
                    <div class="col-span-2">
                        <label for="updateMeetingPasswd"  class="block mb-2 text-sm font-medium text-gray-900">회의 비밀번호</label>
                        <input type="number" name="updateMeetingPasswd"  id="updateMeetingPasswd" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" minlength="4" maxlength = "4" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="비밀번호" required="">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="updateMeetingMemberNum" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">회의 최대 인원수</label>
                        <input type="number" name="updateMeetingMemberNum" id="updateMeetingMemberNum" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
                        																		  focus:ring-primary-600 focus:border-primary-600 
                        																		  block w-full p-2.5" placeholder="인원수" required="">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="updateMeetingStartDate"  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">회의 시작일</label>
                        <input type="datetime-local" name="updateMeetingStartDate" id="updateMeetingStartDate" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
                        																		  focus:ring-primary-600 focus:border-primary-600 
                        																		  block w-full p-2.5" placeholder="시작일" required="">
                    </div>
 					<input type="hidden" id="updateMeetingID" name="updateMeetingID">
 					<input type="hidden" id="updateMemberID" name="updateMeetingID">
 					<input type="hidden" id="updateMemberName" name="updateMemberName">
                </div>
                <div class="flex justify-end">
	                <button type="button" onclick="updateMeeting()" class="text-white inline-flex items-center bg-blue-700 
	                							hover:bg-blue-800 focus:ring-4 focus:outline-none
	                							focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
	                    <svg class="me-1 -ms-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
	                    회의 수정
	                </button>
	            </div>    
            </form>
        </div>
    </div>
</div>         
        
        
        
        


    <script>
	 function characterCheck(obj){
	 var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
	 if( regExp.test(obj.value) ){
	 	alert("특수문자는 입력하실수 없습니다.");
	 	obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	 	}
	 }

    
       
    async function openModal(){
    	var meeting_id = document.getElementById("meeting_id").value
        const res = await fetch(`http://localhost:80/get/meetingroom?code=${"${meeting_id}"}`);
		const resJson = await res.json();
		//값 받아오깆
		
		var meeting_ID = resJson.meeting_id;
			
		if(meeting_ID != null ){
			
    	document.getElementById('passwd-modal').click();
		}else{
			alert("방을 찾을 수 없습니다");
		}
    }
	
    async function openUpdateModal(value){
    	
    	const res = await fetch(`http://localhost:80/get/meetingroom?code=${"${value}"}`);
    	const resJson = await res.json();
		document.getElementById("updateMeetingID").value = resJson.meeting_id;
		document.getElementById("updateMemberID").value = resJson.member_id;
		document.getElementById("updateMemberName").value = resJson.member_name;
		document.getElementById("updateMeetingMemberNum").value = resJson.meeting_member_num;
		document.getElementById("updateMeetingTopic").value = resJson.meeting_topic;
		document.getElementById("updateMeetingPasswd").value = resJson.meeting_passwd;
		document.getElementById("updateMeetingStartDate").value = resJson.meeting_start_date;
    	document.getElementById('update-modal').click();
    	}
    
    
function updateMeeting() {
    var passwd =document.getElementById("updateMeetingPasswd").value;
	if(passwd.length == 4){
		if(memNum > 1){
		  if(startdate > dateString){ 
        var jsonData2 = {
            meeting_id: document.getElementById("updateMeetingID").value,
            member_id: document.getElementById("updateMemberID").value,
            member_name: document.getElementById("updateMemberName").value,
            member_num: document.getElementById("updateMeetingMemberNum").value,
            meeting_topic: document.getElementById("updateMeetingTopic").value,
            meeting_passwd: document.getElementById("updateMeetingPasswd").value,
            meeting_start_date: document.getElementById("updateMeetingStartDate").value,
        };

        // AJAX를 사용하여 서버에 JSON 데이터 전송
        $.ajax({
            type: "POST",
            url: "http://localhost:80/update-meeting", // 요청을 처리하는 컨트롤러의 엔드포인트
            contentType: "application/json",
            data: JSON.stringify(jsonData2), // JSON 데이터를 문자열로 변환하여 전송
            success: function(response) {
                console.log("Success: " + response);
                location.reload(true);
                // 성공적으로 처리된 경우 실행할 코드
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
                // 오류 발생 시 실행할 코드
            }
        });
		  }else{
		    	 alert("지난 날짜는 선택 할 수 없습니다")
		     }   
		  }else{
			 alert("2명이상의 인원을 설정 해주세요") 
		  }
       }else{
    	 alert("비밀번호 4자리로 설정해주세요.");  
       }
    }
    
     let deleteCode = null;
    
     function openDeleteModal(value){
    	 	deleteCode = value;
    		document.getElementById('deletePasswd-modal').click();
    	}
     
    async function deleteMeeting(){
    	
					const res = await fetch(`http://localhost:80/get/meetingroom?code=${"${deleteCode}"}`);
					const resJson = await res.json();
					var deletePassword = resJson.meeting_passwd
					var inputpasswd = document.getElementById("deletePasswd").value
					
					if(deletePassword == inputpasswd){
						await fetch(`http://localhost:80/delete-meeting?code=${"${deleteCode}"}`);
						location.reload(true);
					}else{
						alert("비밀번호가 일치하지 않습니다");
						console.log(`${deleteCode}`)
					}
				
				}
	 var today = new Date();

    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;

    console.log(dateString);
	
              
		function saveMeeting() {
    	
		var passwd =document.getElementById("meetingPasswd").value;
		var memNum = document.getElementById("meetingMemberNum").value;
		var startdate = document.getElementById("meetingStartDate").value;
	
		if(passwd.length == 4){	
		  if(memNum > 1){
			if(startdate >= dateString){ 
    	function uuidv4() {
    	  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
    	    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    	  );
    	}
    	var uuid = uuidv4();
		var uuidresult = uuid.substring(0, 8); 
        // 사용자가 입력한 데이터를 가져와서 JSON 객체 생성
		        var jsonData = {
		        	meeting_id: ${"uuidresult"},
		            meeting_member_num: document.getElementById("meetingMemberNum").value,
		            meeting_topic: document.getElementById("meetingTopic").value,
		            meeting_passwd: document.getElementById("meetingPasswd").value,
		            meeting_start_date: document.getElementById("meetingStartDate").value,
		            member_id: "test",
		            member_name: "박승희",
		            meeting_registration_date: ${"dateString"},
		            meeting_join: 1,                                 	
		        };
		
		        // AJAX를 사용하여 서버에 JSON 데이터 전송
		        $.ajax({
		            type: "POST",
		            url: "http://localhost:80/create-meeting", // 요청을 처리하는 컨트롤러의 엔드포인트
		            contentType: "application/json",
		            data: JSON.stringify(jsonData), // JSON 데이터를 문자열로 변환하여 전송
		            success: function(response) {
		                console.log("Success: " + response);
		                location.reload(true);
		                // 성공적으로 처리된 경우 실행할 코드
		            },
		            error: function(xhr, status, error) {
		                console.error("Error: " + error);
		                // 오류 발생 시 실행할 코드
		            }
		        });
		        
		     }else{
		    	 alert("지난 날짜는 선택 할 수 없습니다")
		     }   
		  }else{
			 alert("2명이상의 인원을 설정 해주세요") 
		  }
        }else{
       	 	alert("비밀번호 4자리로 설정해주세요.");  
        }
    }
        
        
        
        async function search() {
            var meeting_id = document.getElementById("meeting_id").value
            const res = await fetch(`http://localhost:80/get/meetingroom?code=${"${meeting_id}"}`);
			const resJson = await res.json();
			
			var meeting_ID = resJson.meeting_id;
				
			var room_num = resJson.meeting_room_num;
			var meeting_room_num = 50000+Number(room_num);
			
			var today = new Date()
			
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var hours = ('0' + today.getHours()).slice(-2); 
			var minutes = ('0' + today.getMinutes()).slice(-2);

			var timeString = hours + ':' + minutes;
			var dateString = year + '-' + month  + '-' + day;
			
			
			var startdt = resJson.meeting_start_date;
			var startdatearr = startdt.split("T");
			var startdate = startdatearr[0];
			
		
				 	if(resJson.meeting_join == '1'){
				 			if(resJson.meeting_passwd = document.getElementById("enter-passwd").value){
					 			if(dateString >= resJson.meeting_start_date){		
								 			var jsonData = {
										            meeting_id: ${"meeting_ID"},
										            meeting_room_num: ${"meeting_room_num"},
										        };
				
										        // AJAX를 사용하여 서버에 JSON 데이터 전송
										        $.ajax({
										            type: "GET",
										            url: "http://localhost:80/joinMeetingRoom", // 요청을 처리하는 컨트롤러의 엔드포인트
										            contentType: "application/json",
										            data: JSON.stringify(jsonData), // JSON 데이터를 문자열로 변환하여 전송
										            success: function(response) {
										                console.log("Success: " + response);
										                // 성공적으로 처리된 경우 실행할 코드
										            },
										            error: function(xhr, status, error) {
										                console.error("Error: " + error);
										                // 오류 발생 시 실행할 코드
										            }
										        });		
					 				location.href="/zzoom/test4.jsp";
					 		
				 		      }else{
				 			     alert("입장 가능한 시간이 아닙니다.")
				 		      }
				 			}else{
							 	alert("비밀번호가 맞지 않습니다.");	
					 		}
						}else{
						 	alert("입장 불가능한 방입니다.");					 			
						}
						
	        		}
			
			
			
        
        async function listsearch() {
            const res = await fetch('http://localhost:80/get/meetinglist?memberID=test');
			const meetingList = await res.json();
			console.log(meetingList);
			const keys = Object.keys(meetingList);
			const len = keys.length;
			     
			const innerHtmlList = keys.map((key, idx)=>{
			  const meetingDataList = meetingList[`item${"${idx}"}`];
			console.log(meetingDataList);
                    const innerHTML =` 
                    
           <div class="flex flex-col">			
               <div class="flex flex-row">  	
		                 <div class="shadow shadow-indigo-500/50 p-3 flex flex-col my-5 mb-5 h-auto w-64 z-30 rounded-lg bg-[#ffffff] border-2 border-black-100 mb-5 p-3">
			                  <div class="w-full h-auto">
			                       <span class="text-2xl">미팅 시간</span>
			                          <div class="">  		
			                          	<span class="text-3xl font-bold">2024-05-02</span>
			                          </div>
			                          <div>
			                        	<span class="text-lg">입장코드</span>
			                        </div>
			                         <div class="flex flex-row">
			                            <span class="text-2xl inline-block align-middle font-bold">${"${meetingDataList.meeting_id}"}</span>
			                          </div>
					             </div>
				            </div>	
					   	   <div class="shadow shadow-indigo-500/50 flex flex-rows my-5 h-auto w-full z-30 rounded-lg bg-[#ffffff] border-2 border-black-100 mx-5 mb-5 p-2">
						   	   <div class="mx-2 flex flex-col pb-5 pr-20">
					           <span class="text-xl font-bold mb-3">미팅 토픽/이름</span>
					           <div class="ml-3 flex flex-row text-5xl font-extrabold mb-2">
					           ${"${meetingDataList.meeting_topic}"} </div>
			                </div> 
			              </div>  
					<div class="flex justify-items-end my-5 flex-col">  	
					    <button type="button" onclick="openUpdateModal(this.value)" value="${"${meetingDataList.meeting_id}"}" class="bg-purple-700 hover:bg-[#dddddd]w-32 h-16 rounded-lg text-[#ffff] text-4xl font-extrabold place-self-center p-3 mb-6 focus:outline-none">EDIT</button>
					    <button type="button" onclick="openDeleteModal(this.value)" value="${"${meetingDataList.meeting_id}"}"  class=" bg-red-500 hover:bg-[#fb7185] w-32 h-16 rounded-lg text-[#ffff] text-3xl font-extrabold place-self-center p-3 focus:outline-none">DELETE</button>
				    </div> 
				</div>
         	 </div>       	
                    	
                    	
                    	
                    	`;	
                    	return innerHTML;
            });
			const meetingDataList = document.getElementById("meetingList");
			meetingDataList.innerHTML = innerHtmlList.join('')
        }
       listsearch()
    </script>
</body>
</html>