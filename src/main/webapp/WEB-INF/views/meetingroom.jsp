<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        --bottom-bar-h : 30px;

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
        object-fit: scale-down;
        min-height: 2rem;
        background: #151515;
    }

    .bottom-bar-button-layout{
        height: var(--bottom-bar-h);
        width: auto;
    }

    .hide{
        display: none !important;
        
    }

    .alert-flex-layout{
        position : absolute;
        flex-direction: column-reverse;
        width: 200px;
        max-width: 200px;
        top: 0%;
        left: 0%;
        display: flex;
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
    <div class="main hide" id="videos">
        <div >
            <div class="meetingroom-container gap-1" >

                <div class="video-layout1">
                    <div class = "name-box" id = "myname-box"></div>
                    <div class= "video-box" id = "videolocal"></div>
                </div>
                <div class="video-layout1">
                    <div class = "name-box" id = "remote1"></div>
                    <div class = "video-box" id = "videoremote1"></div>
                </div>
                <div class="video-layout1">
                    <div class = "name-box" id = "remote2"></div>
                    <div class = "video-box" id = "videoremote2"></div>
                </div>
                <div class="video-layout1">
                    <div class = "name-box" id = "remote3"></div>
                    <div class = "video-box" id = "videoremote3"></div>
                </div>
                
            </div>
        </div>

        <div class="alert-flex-layout" id="alert-flex">
        <div>

        <div class="fixed bottom-0 left-0 z-50 bottom-bar-layout dark:bg-gray-700 dark:border-gray-600"> <!--하단 네비게이터 바-->
            <div class="grid h-full max-w-lg grid-cols-4 mx-auto font-medium" id="user_ui_options"><!--그리드 컨테이너-->
            </div>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>