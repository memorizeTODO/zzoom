<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/6.4.0/adapter.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.4.0/bootbox.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/spin.js/2.3.2/spin.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
<script type="text/javascript" src="/js/janus.js"></script>
<script type="text/javascript" src="/js/meetingroom.js"></script>

<style>
    
    :root{
        --vw : 100;
        --vh : 100;

        --bottom-bar-h : 50px;

        --meetingroom-grid-container-h : calc(var(--vh) * 1vh - var(--bottom-bar-h));
        --meetingroom-grid-container-w : calc(var(--vw) * 1vw);
        /*width가 384px 미만일 때 사용*/
        --meetingroom-flex-container-h : 100%;
        --meetingroom-flex-container-w : 100%;
        --grid-rows-size: 2;
        --grid-columns-size: 2;
        --grid-gap-x:0.25rem;
        --grid-gap-y:0.25rem;
        --grid-template-width : calc(var(--meetingroom-grid-container-w) / var(--grid-columns-size) - var(--grid-gap-x)) ;
        --grid-template-height :  calc(var(--meetingroom-grid-container-h) / var(--grid-rows-size) - var(--grid-gap-y)) ;
        
        
        --name-box-y: 1.25rem;
    }
    body {
        margin: 0;
        padding: 0;
    }

    .name-box{
        width: 100%;
        height: var(--name-box-y);
        display:flex;
        place-self: center;
        place-content: center;
    }

    @media (min-width: 481px) {
        .meetingroom-container {
            width: var(--meetingroom-grid-container-w);
            height: var(--meetingroom-grid-container-h);
            background: #2E2E2E;
            padding: 0;
            margin: 0;
            display: grid;
            grid-template-columns: repeat(var(--grid-columns-size) , var(--grid-template-width) );
            grid-template-rows: repeat(var(--grid-rows-size), var(--grid-template-height) );
            place-self: center;
            place-content: center;
            overflow:hidden;
        }

        .video-layout1 {
        place-self: center;
        grid-column: span 1 / span 1;
        
        display: flex;
        flex-direction: column;
        word-break:break-all;
        place-items: center;
        place-content:center;

        width: var(--grid-template-width);
        height: var(--grid-template-height);
        
        }

        .video-box{
        display: flex;
        place-items: center;
        place-content:center;

        max-width: var(--grid-template-width);
        max-height: calc(var(--grid-template-height) - var(--name-box-y));
        background: black;

        width: 100%;
        height: 100%;
        
        }
    }
    @media (max-width: 480px) {
        .meetingroom-container {
            display: flex;
            flex-direction: column;
            background: #585858;
            padding: 0;
            margin: 0;
            width: var(--meetingroom-flex-container-w);
            height: var(--meetingroom-flex-container-h);
            place-self: center;
            place-content: center;
            overflow:visible;
        }

        .video-layout1 {
        place-self: center;
        display: flex;
        flex-direction: column;
        word-break:break-all;
        place-items: center;
        place-content:center;
            
        width: var(--meetingroom-flex-container-w);
        height: var(--meetingroom-flex-container-h);
        }

        .video-box{
        display: flex;
        place-items: center;
        place-content:center;
        background: black;
        max-width: var(--meetingroom-flex-container-w);
        max-height: calc(var(--meetingroom-flex-container-h) - var(--name-box-y));

        width: 100%;
        height: 100%;
        
        }
    }

    @media (min-width: 768px) {
        .text-center {
        text-align: center;
        }
    }

    .video-layout-inner{

        display: block;
        object-fit: scale-down;
        width: auto;
        height: 100%;
        
    }
    .bottom-bar-layout{
        width:  100vw;
        height: var(--bottom-bar-h);
        min-height: 2rem;
        background: #151515;
        place-items: center;
        place-content:center;
    }

    .bottom-bar-button-icon-layout{
        height: calc(var(--bottom-bar-h) / 10 * 7 );
        width: auto;
    }
    .bottom-bar-flex-layout{
    	flex-direction: row;
    	align-content: center;
        gap: 10px;
    }

    .alert-flex-layout{
        position : absolute;
        flex-direction: column-reverse;
        width: 50vw;
        height: auto;
        min-width: 300px;
        min-height: 60px;
        bottom: var(--bottom-bar-h);
        right: 0%;

        display: flex;
    }

    .side-bar-layout{
        width: 16rem;
        height: calc(var(--vh) * 1vh - var(--bottom-bar-h));
        right: 0px;
        bottom: 0px;
    }


    .hide{
        display: none !important;
    }

    
    

</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />



<title>Insert title here</title>
</head>


<body>
    
    <div class="container" id="videojoin"><br/>
        <button id = "start" style="border: 1px solid black;">야누스 객체 초기화</button><br/>
        <input type="text" id = "roomname" value="" placeholder="방번호를 입력해 주세요 ex: 1234"/><br/>
        <input type="text" id = "username" value="" placeholder="성함을 입력해 주세요 ex: jsw"/><br/>
        <button id = "register" style="border: 1px solid black;" onclick="">대화방 참여</button>
    </div>
    <div class="main hide" id="meetingroom">
        <div >
            <div class="meetingroom-container gap-1" >

                <div class="video-layout1">
                    <div class = "name-box" id = "myname-box"></div>
                    <div class= "video-box rounded-lg" id = "videolocal"></div>
                </div>
                <div class="video-layout1">
                    <div class = "name-box" id = "remote1"></div>
                    <div class = "video-box rounded-lg" id = "videoremote1"></div>
                </div>
                <div class="video-layout1">
                    <div class = "name-box" id = "remote2"></div>
                    <div class = "video-box rounded-lg" id = "videoremote2"></div>
                </div>
                <div class="video-layout1">
                    <div class = "name-box" id = "remote3"></div>
                    <div class = "video-box rounded-lg" id = "videoremote3"></div>
                </div>
                
            </div>
        </div>

        <div class="alert-flex-layout" id="alert-flex">
        </div>

        <div class="fixed bottom-0 left-0 z-50 bottom-bar-layout dark:bg-gray-700 dark:border-gray-600"> <!--하단 네비게이터 바-->
            
            <div class="flex flex-row h-auto w-auto mx-auto flex-nowrap font-medium" id="user_ui_options"><!--플렉스 컨테이너-->
                <div class="flex flex-row" style="width:20%" >
                    <button class="btn btn-warning btn-xs" id="exit" style="margin : 0; padding: 0px; margin-left: 0.5rem">
                        <img class="bottom-bar-button-icon-layout" src="/image/exit-room.png"/>
                    </button>
                </div>
                <div class="flex flex-row" style="width:80%" >
                    <button class="btn btn-warning btn-xs" id="video-publish-btn" style="margin-right: 0.5rem; padding:0px;" >
                        <img class="bottom-bar-button-icon-layout" src="/image/now-cam-off.png"/>
                    </button>
                    <button class="btn btn-warning btn-xs" id="mute" type="button" style="margin-right: 0rem; padding: 0px;">
                        <img class="bottom-bar-button-icon-layout" src="/image/now-mute.png"/>
                    </button>
                </div>
                <div class="flex flex-row">
                    <button class="btn btn-warning btn-xs" data-drawer-target="drawer-navigation" data-drawer-toggle="drawer-navigation" data-drawer-placement="right" aria-controls="drawer-navigation" style="margin-right: 0.5rem">
                        <img class="bottom-bar-button-icon-layout" src="/image/more.png"/>
                    </button>
                </div>
                
                
            </div>
        </div>
    </div> 
    
    <!-- drawer component -->
    <div id="drawer-navigation" class="fixed side-bar-layout z-40 p-4 overflow-y-auto transition-transform translate-x-full bg-white dark:bg-gray-800" tabindex="-1" aria-labelledby="drawer-navigation-label">
        <h5 id="drawer-navigation-label" class="text-base font-semibold text-gray-500 uppercase dark:text-gray-400">Menu</h5>
        <button type="button" data-drawer-hide="drawer-navigation" aria-controls="drawer-navigation" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 absolute top-2.5 end-2.5 inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" >
            <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
            <span class="sr-only">Close menu</span>
        </button>
        <div class="py-4 overflow-y-auto">
            <ul class="space-y-2 font-medium">
                <li>
                    <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 21">
                        <path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z"/>
                        <path d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z"/>
                    </svg>
                    <span class="ms-3">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 18">
                        <path d="M6.143 0H1.857A1.857 1.857 0 0 0 0 1.857v4.286C0 7.169.831 8 1.857 8h4.286A1.857 1.857 0 0 0 8 6.143V1.857A1.857 1.857 0 0 0 6.143 0Zm10 0h-4.286A1.857 1.857 0 0 0 10 1.857v4.286C10 7.169 10.831 8 11.857 8h4.286A1.857 1.857 0 0 0 18 6.143V1.857A1.857 1.857 0 0 0 16.143 0Zm-10 10H1.857A1.857 1.857 0 0 0 0 11.857v4.286C0 17.169.831 18 1.857 18h4.286A1.857 1.857 0 0 0 8 16.143v-4.286A1.857 1.857 0 0 0 6.143 10Zm10 0h-4.286A1.857 1.857 0 0 0 10 11.857v4.286c0 1.026.831 1.857 1.857 1.857h4.286A1.857 1.857 0 0 0 18 16.143v-4.286A1.857 1.857 0 0 0 16.143 10Z"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Kanban</span>
                    <span class="inline-flex items-center justify-center px-2 ms-3 text-sm font-medium text-gray-800 bg-gray-100 rounded-full dark:bg-gray-700 dark:text-gray-300">Pro</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="m17.418 3.623-.018-.008a6.713 6.713 0 0 0-2.4-.569V2h1a1 1 0 1 0 0-2h-2a1 1 0 0 0-1 1v2H9.89A6.977 6.977 0 0 1 12 8v5h-2V8A5 5 0 1 0 0 8v6a1 1 0 0 0 1 1h8v4a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-4h6a1 1 0 0 0 1-1V8a5 5 0 0 0-2.582-4.377ZM6 12H4a1 1 0 0 1 0-2h2a1 1 0 0 1 0 2Z"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Inbox</span>
                    <span class="inline-flex items-center justify-center w-3 h-3 p-3 ms-3 text-sm font-medium text-blue-800 bg-blue-100 rounded-full dark:bg-blue-900 dark:text-blue-300">3</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 18">
                        <path d="M14 2a3.963 3.963 0 0 0-1.4.267 6.439 6.439 0 0 1-1.331 6.638A4 4 0 1 0 14 2Zm1 9h-1.264A6.957 6.957 0 0 1 15 15v2a2.97 2.97 0 0 1-.184 1H19a1 1 0 0 0 1-1v-1a5.006 5.006 0 0 0-5-5ZM6.5 9a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9ZM8 10H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5Z"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Users</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 20">
                        <path d="M17 5.923A1 1 0 0 0 16 5h-3V4a4 4 0 1 0-8 0v1H2a1 1 0 0 0-1 .923L.086 17.846A2 2 0 0 0 2.08 20h13.84a2 2 0 0 0 1.994-2.153L17 5.923ZM7 9a1 1 0 0 1-2 0V7h2v2Zm0-5a2 2 0 1 1 4 0v1H7V4Zm6 5a1 1 0 1 1-2 0V7h2v2Z"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Products</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 16">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 8h11m0 0L8 4m4 4-4 4m4-11h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-3"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Sign In</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M5 5V.13a2.96 2.96 0 0 0-1.293.749L.879 3.707A2.96 2.96 0 0 0 .13 5H5Z"/>
                        <path d="M6.737 11.061a2.961 2.961 0 0 1 .81-1.515l6.117-6.116A4.839 4.839 0 0 1 16 2.141V2a1.97 1.97 0 0 0-1.933-2H7v5a2 2 0 0 1-2 2H0v11a1.969 1.969 0 0 0 1.933 2h12.134A1.97 1.97 0 0 0 16 18v-3.093l-1.546 1.546c-.413.413-.94.695-1.513.81l-3.4.679a2.947 2.947 0 0 1-1.85-.227 2.96 2.96 0 0 1-1.635-3.257l.681-3.397Z"/>
                        <path d="M8.961 16a.93.93 0 0 0 .189-.019l3.4-.679a.961.961 0 0 0 .49-.263l6.118-6.117a2.884 2.884 0 0 0-4.079-4.078l-6.117 6.117a.96.96 0 0 0-.263.491l-.679 3.4A.961.961 0 0 0 8.961 16Zm7.477-9.8a.958.958 0 0 1 .68-.281.961.961 0 0 1 .682 1.644l-.315.315-1.36-1.36.313-.318Zm-5.911 5.911 4.236-4.236 1.359 1.359-4.236 4.237-1.7.339.341-1.699Z"/>
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Sign Up</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>