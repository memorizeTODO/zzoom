<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
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

<script type="text/javascript" src="js/janus.js"></script>
<script type="text/javascript" src="js/meetingroom.js"></script>

<script>
    var roomVariable= {
    nowroom_num : null,
    session_myID : null,
    memberList : null,
    session_myName : null,
    topic : null,
    representative : null ,
    participants_now_num  : null,
    participants_max_num  : null
    };

    $(document).ready(function() {
    
        for(var i = 0; i<6 ; i++){
            $("#template"+i).hide();
        }

	roomVariable.session_myID = '${sessionScope.member_id}';
	roomVariable.nowroom_num = '${nowroom_num}';
	if ((roomVariable.session_myID == 'null' || roomVariable.session_myID == null)&&(roomVariable.nowroom_num == 'null'|| roomVariable.nowroom_num == null) ){
		console.error("session_myID = "+roomVariable.session_myID + ", nowroom_num = "+roomVariable.nowroom_num );
		alert("session error");
		location.href="meeting_reservation";
	}
	
	
	if(isMeetingRoomFull() == -1){ // 해당 회의룸이 꽉찼는지 체크(동기)
		alert("isRoomFull error");
		location.href="meeting_reservation";
	}

	if(isWatchingAnotherRoom() == true){ //다른방에 입장하고있거나 현재 방에 이미 입장한 상태인지 체크(동기)
		location.href="meeting_reservation";
	}

	while(true){
		if(updateMyNowRoomState('join')==true){ //내가 입장했음을 서버쪽에 업데이트(동기)
			console.log("Success");
			break;
		}
		setTimeout(() => console.log("waiting for retry update MyNowRoomState"), 2000);
	
	}
	getMyInfo(false);
	

	setInterval(() => asyncTasks(), 2000); // 방에 있는동안 계속 작동할 비동기 작업들 모음(1초 간격으로 작동)

	// Initialize the library (all console debuggers enabled)
    Janus.init({debug: "all", callback: function() {
		// Use a button to start the demo
		generateJanus();

		
	}});

	$('#exit').one('click',function() {
       
		updateMyNowRoomState('left');
        location.href="/meeting_reservation";
										
	});

	myroom = 50000 + Number(roomVariable.nowroom_num);


   
});
   

    function asyncTasks(){ //반복 수행할 비동기 요청 작업들 
        getMyInfo(true);
        getParticipants(); //참가자 리스트 불러오기/갱신 + 뷰쪽에 UI생성
        updateKeepAlive(); //강제종료, 새로고침으로 인한 방 이탈 체크를 위해 db로 클라이언트의 keepalive를 갱신(일정시간 동안 갱신 안될 시 나간것으로 간주)
        if (getNowRoomInfo() == false){ // 현재 방의 정보 갱신(주제, 현재인원, 최대인원, 대표자(개설자)등 )
            alert("can't find this roomInfo");
            location.href="meeting_reservation";
        }
        changeGridLayout();
        
    }

    function getMyInfo(isAsync){
        var returnVal =false;
        $.ajax({
			            type: "GET",
			            url: "get/myInfo?member_id="+roomVariable.session_myID, // 요청을 처리하는 컨트롤러의 엔드포인트
                        contentType: "application/json",
                        async: isAsync,
                        
			            success: function(res) {
			                console.log("Success: " + res);
			                // 성공적으로 처리된 경우 실행할 코드
			                //location.reload(true);
                            roomVariable.session_myName = res;
                            returnVal = true;
			            },
			            error: function(xhr, status, error) {
			                console.error("status: "+status+ "error :" + xhr.responseText);
                            alert("status: "+status +" error: " + xhr.responseText);
                            location.href="meeting_reservation";
			                // 오류 발생 시 실행할 코드
                            
			            }
		});
        return returnVal;
    }

    

    function updateMyNowRoomState(join_or_left){
        var returnVal = false;
        $.ajax({
			            type: "POST",
			            url: "put/myNowRoomState", // 요청을 처리하는 컨트롤러의 엔드포인트
                        contentType: "application/json",
                        data: JSON.stringify({ room_num : roomVariable.nowroom_num, member_id : roomVariable.session_myID, purpose : join_or_left }),// JSON 데이터를 문자열로 변환하여 전송
                        async: false,
                        
			            success: function(res) {
			                console.log("Success: " + res);
			                // 성공적으로 처리된 경우 실행할 코드
			                //location.reload(true);
                            returnVal = true;
			            },
			            error: function(xhr, status, error) {
			                console.error("status: "+status+ "error :" + xhr.responseText);
                            alert("status: "+status +" error: " + xhr.responseText);

                            location.href="meeting_reservation";
			                // 오류 발생 시 실행할 코드
                            
			            }
		});
        return returnVal;
    }

    function isWatchingAnotherRoom(){
        var returnVal = true;
        $.ajax({
			            type: "GET",
			            url: "get/checkMyNowRoomState?room_num="+roomVariable.nowroom_num, // 요청을 처리하는 컨트롤러의 엔드포인트
                        contentType: "application/json",
                        async: false,
                        data: {},// JSON 데이터를 문자열로 변환하여 전송

                        
			            success: function(res) {
			                
			                // 성공적으로 처리된 경우 실행할 코드
                            if(res["response"] != -1){
                                
                                console.log("Success: 기존 방에 입장한 상태에서 또다른 방이나, 같은방에 중복 참여 하시고 계십니다\n"+res["response"]+"번방 입장상태"); 
                                alert("기존 방에 입장한 상태에서 또다른 방이나, 같은방에 중복 참여 하시고 계십니다. ("+res["response"]+"번방 입장상태)");
                                
                            }else{
                                returnVal = false;
                                console.log("Success: 기존 방에 입장한 상태에서 또다른 방이나, 같은방에 중복 참여 하시지 않으셨습니다\n"+res["response"]);    
                            }
			                
                            
			            },
			            error: function(xhr, status, error) {
			                console.error("Error: " + error);
			                // 오류 발생 시 실행할 코드
                            alert("동일 방 다중 입장/다른 방 입장여부 확인 요청 오류 발생");
                            console.log(res["log"]);
                            
			            }
		});
        return returnVal;
    }

    function getNowRoomInfo(){ // 컨트롤러 수정필요
        returnVal = false;
        $.ajax({
                            type: "GET",
                            url: "get/nowRoomInfo?room_num="+roomVariable.nowroom_num, // 요청을 처리하는 컨트롤러의 엔드포인트
                            data: {}, 
                            async: false,
                            success: function(res) {
                                
                                // 성공적으로 처리된 경우 실행할 코드
                                //location.reload(true);
                                console.log(res);
                                //alert(res);
                                if(res!='null' || res!=null){
                                    roomVariable.topic = res["topic"];
                                    roomVariable.representative = res["representative"]; //개설자겸 대표자
                                    roomVariable.participants_max_num = res["participants_max_num"]; // 현재 수용된 인원 수
                                    roomVariable.participants_now_num = res["participants_now_num"]; // 최대 수용가능 인원 수
                                    

                                    returnVal = true;
                                    console.log("getNowRoomInfo success: topic = "+roomVariable.topic);
                                    $("#topic").html(roomVariable.topic);
                                    $("#drawer-navigation-label").html("Participants "+ roomVariable.participants_now_num +" / "+roomVariable.participants_max_num);
                                }else{
                                    alert("방 정보 조회 불가능");
                                    location.href="meeting_reservation";
                                }
                                
                                
                            },
                            error: function(xhr, status, error) {
                                console.error("status: "+status+ "error :" + xhr.responseText);
                                alert("status: "+status +" error: " + xhr.responseText);
                                
                                // 오류 발생 시 실행할 코드
                                //location.href="meeting_reservation"; //
                            }
        });
        return returnVal;
    }

    function updateKeepAlive(){
        var returnVal = false;
        $.ajax({
			            type: "POST",
			            url: "put/keepAlive", // 요청을 처리하는 컨트롤러의 엔드포인트
                        contentType: "application/json",
                        data: JSON.stringify({ member_id : roomVariable.session_myID }),// JSON 데이터를 문자열로 변환하여 전송

                        
			            success: function(res) {
			                console.log("Success: " + res);
			                // 성공적으로 처리된 경우 실행할 코드
			                
                            returnVal = true;
			            },
			            error: function(xhr, status, error) {
                            console.error("status: "+status+ "error :" + xhr.responseText);
                            alert("status: "+status +" error: " + xhr.responseText);
                            location.href="meeting_reservation";
			                // 오류 발생 시 실행할 코드
                            
			            }
		});
        return returnVal;
    }

    

    

    function getParticipants(){
        if ((roomVariable.session_myID == 'null' || roomVariable.session_myID == null)&&(roomVariable.nowroom_num == 'null'|| roomVariable.nowroom_num == null) ){
            console.error("Error: can't identified your id, failed to load ParticipantList");
            return;
        }
        
            $.ajax({
                            type: "GET",
                            url: "get/memberList?room_num="+roomVariable.nowroom_num, // 요청을 처리하는 컨트롤러의 엔드포인트
                            data: {}, 
                            success: function(data) {
                                
                                // 성공적으로 처리된 경우 실행할 코드
                                //location.reload(true);
                                console.log(typeof(data['memberList']))
                                roomVariable.memberList = data['memberList'];
                                participants_now_num = roomVariable.memberList.length;
                                var content='';
                                $('#participantList').empty();
                                for( var member of roomVariable.memberList){
                                    console.log(member);
                                    console.log("Success: " + member.member_name);
                                    content +='<li>'
                                            +  '<a href="#" class="flex items-center p-2 text-white rounded-lg dark:text-white hover:bg-slate-900 dark:hover:bg-slate-900 group">'
                                            +    '<span class="ms-3">'+member.member_name+'('+member.member_id+')</span>'
                                            +  '</a>'
                                            +'</li>'
                                            
                                }
                                $('#participantList').html(content);
                            },
                            error: function(xhr, status, error) {
                                console.error("Error: " + error);
                                // 오류 발생 시 실행할 코드
                                //location.href="meeting_reservation"; // 
                            }
            });
        
    }

    function isMeetingRoomFull(){
        var isSuccess= false;
        var isFull = -1;
        $.ajax({
                            type: "GET",
                            url: "get/checkMeetingRoomFull?room_num="+roomVariable.nowroom_num, // 요청을 처리하는 컨트롤러의 엔드포인트
                            data: {},
                            async: false, 
                            success: function(data) {
                                //data에는 방이 가득찼는지 아닌지를 표현해주는 데이터가 옴
                                // 성공적으로 처리된 경우 실행할 코드
                                //location.reload(true);
                                console.log(typeof(data))
                                isFull = parseInt(data);
                                isSuccess = true;
                                if ( isFull == -1 ){
                                    alert("방이 가득 찼습니다");
                                    //location.href="meeting_reservation";
                                }else if(isFull == 1){
                                    alert("방에 입장합니다");
                                }
                            },
                            error: function(xhr, status, error) {
                                console.error("Error: " + error);
                                // 오류 발생 시 실행할 코드
                                //location.href="meeting_reservation"; // 
                                alert("응답 오류");
                                location.href="meeting_reservation";
                            }
        });
       
            
        return isFull;
    }

 
function changeGridLayout(){

    var cnt = 0;
    for(var i = 0; i<6 ; i++){
        if($("#template"+i).is(':visible') == true){
            cnt++;
        }
    }

    console.log("cnt: "+cnt);

    var listParticipantsNum= cnt; 
        
    var $root=$(":root");
    var cssVariables = getComputedStyle($root[0]);
    var $gridContainer=$("#meetingroom-main-container");

    //--meetingroom-grid-container-h : calc(var(--vh) * 1vh - var(--bottom-bar-h));
    //--meetingroom-grid-container-w : calc(var(--vw) * 1vw);
    
    vw=cssVariables.getPropertyValue("--vw").trim();
    vh=cssVariables.getPropertyValue("--vh").trim();
    bottomBarH=cssVariables.getPropertyValue("--bottom-bar-h");

    //var meetingroomGridContainerW = "calc(" + vw + " * " + '1vw' + ")";
    //var meetingroomGridContainerH = "calc(" + vh + " * " + '1vw' + " - " + bottomBarH +")";


    var meetingroomGridContainerW = cssVariables.getPropertyValue("--meetingroom-grid-container-w").trim();
    var meetingroomGridContainerH = cssVariables.getPropertyValue("--meetingroom-grid-container-h").trim();
    var gridGapX = cssVariables.getPropertyValue("--grid-gap-x").trim();
    var gridGapY = cssVariables.getPropertyValue("--grid-gap-y").trim();
    var nameBoxY =cssVariables.getPropertyValue("--name-box-y").trim()

    if(listParticipantsNum==0){
        var gridColumnsSize = 0;
        var gridRowsSize = 0;
    }
    else if(listParticipantsNum==1){
        var gridColumnsSize = 1;
        var gridRowsSize = 1;

        
        
    }else if(listParticipantsNum==2){
        var gridColumnsSize = 2;
        var gridRowsSize = 1;
        

    }else if(listParticipantsNum<=4){
        var gridColumnsSize = 2;
        var gridRowsSize = 2;

       
    }else{
        var gridColumnsSize = 3;
        var gridRowsSize = 2;


    }

    

    var gridTemplateWidth = "calc(" + meetingroomGridContainerW + " / " + gridColumnsSize + " - " + gridGapX + ")";
    var gridTemplateHeight = "calc(" + meetingroomGridContainerH + " / " + gridRowsSize + " - " + gridGapY + ")";

    $gridContainer.css("grid-template-columns", "repeat(" + gridColumnsSize + ", " + gridTemplateWidth + ")");
    $gridContainer.css("grid-template-rows", "repeat(" + gridRowsSize + ", " + gridTemplateHeight + ")");

    $(".video-layout1").css("max-width", gridTemplateWidth);
    $(".video-layout1").css("max-height",gridTemplateHeight);
    
    $(".video-box").css("max-width", gridTemplateWidth);
    $(".video-box").css("max-height", "calc("+gridTemplateHeight+" - "+nameBoxY+")");
    
    $(".video-layout-inner").css("height", "calc("+gridTemplateHeight+" - "+nameBoxY+")");
    $(".video-layout-inner").css("max-height", "calc("+gridTemplateHeight+" - "+nameBoxY+")");


    var $parent = $("#meetingroom-main-container");

    // 바로 아래 자식 요소들을 불러옵니다.
    var $children = $parent.children();

// 자식 요소들을 콘솔에 출력합니다.
    console.log($children);



}
    

   /*  window.addEventListener("beforeunload", function (e) {
    // 여기에 원하는 코드를 작성합니다.
    while(true){
            if(updateMyNowRoomState('left')==true){
                console.log("Success");
                break;
            }
            setTimeout(() => console.log("waiting for retry update MyNowRoomState"), 3000);
        
    }

    // 이벤트를 취소하려면 preventDefault()를 호출하고 returnValue 프로퍼티를 설정해야 합니다.
    // 하지만 이렇게 하면 사용자에게 페이지를 떠나는 것에 대한 확인 메시지가 표시됩니다.
    e.preventDefault();
    e.returnValue = '';
    }); */
    //export {roomVariable };
</script>


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
        --grid-rows-size: 1;
        --grid-columns-size: 1;
        --grid-gap-x:0.25rem;
        --grid-gap-y:0.25rem;
        --grid-template-width : calc(var(--meetingroom-grid-container-w) / var(--grid-columns-size) - var(--grid-gap-x) ) ;
        --grid-template-height :  calc(var(--meetingroom-grid-container-h) / var(--grid-rows-size) - var(--grid-gap-y)) ;
        
        
        --name-box-y: 1.25rem;
    }
    body {
        margin: 0;
        padding: 0;
    }

    
    .drawer-open {
        /* 스크롤바를 숨깁니다. */
        scrollbar-width: none; /* 파이어폭스 */
        -ms-overflow-style: none;  /* IE와 엣지 */
    }

    .drawer-open::-webkit-scrollbar {
        display: none; /* 크롬, 사파리, 오페라 */
    }

    .name-box{
        width: 100%;
        height: var(--name-box-y);
        display:flex;
        place-self: center;
        place-content: center;
    }
    .main{
        background: #2E2E2E;
    }

    @media (min-width: 481px) {
        .meetingroom-container {
            width: var(--meetingroom-grid-container-w);
            height: var(--meetingroom-grid-container-h);
            background: transparent;
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
        width: auto;
        height: auto;
        width: 100%;
        height: 100%;

        max-width: var(--grid-template-width);
        max-height: var(--grid-template-height);
        
        }

        .video-box{
        display: flex;
        place-items: center;
        place-content:center;
        
        width: auto;
        height: auto;

        max-width: var(--grid-template-width);
        max-height: calc(var(--grid-template-height) - var(--name-box-y));
        background: black;

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
        object-fit: contain;
        width: auto;
        height: calc(var(--grid-template-height) - var(--name-box-y));

        max-height: calc(var(--grid-template-height) - var(--name-box-y));
        
        
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



<title>Meeting Room</title>


</head>


<body>
    
    <!-- <div class="container" id="videojoin"><br/>
        <button id = "start" style="border: 1px solid black;">야누스 객체 초기화</button><br/>
        <input type="text" id = "roomname" value="" placeholder="방번호를 입력해 주세요 ex: 1234"/><br/>
        <input type="text" id = "username" value="" placeholder="성함을 입력해 주세요 ex: jsw"/><br/>
        <button id = "register" style="border: 1px solid black;" onclick="">대화방 참여</button>
    </div> -->
    <div class="main" id="meetingroom">
        <div >
            <div class="meetingroom-container gap-1" id = "meetingroom-main-container" >

                <div class="video-layout1" id = "template0">
                    <div class = "name-box" id = "myname-box"></div>
                    <div class= "video-box rounded-lg" id = "videolocal"></div>
                </div>
                <div class="video-layout1" id = "template1"> 
                    <div class = "name-box" id = "remote1"></div>
                    <div class = "video-box rounded-lg" id = "videoremote1"></div>
                </div>
                <div class="video-layout1" id = "template2">
                    <div class = "name-box" id = "remote2"></div>
                    <div class = "video-box rounded-lg" id = "videoremote2"></div>
                </div>
                <div class="video-layout1" id = "template3">
                    <div class = "name-box" id = "remote3"></div>
                    <div class = "video-box rounded-lg" id = "videoremote3"></div>
                </div>
                <div class="video-layout1" id = "template4">
                    <div class = "name-box" id = "remote4"></div>
                    <div class = "video-box rounded-lg" id = "videoremote4"></div>
                </div>
                <div class="video-layout1" id = "template5">
                    <div class = "name-box" id = "remote5"></div>
                    <div class = "video-box rounded-lg" id = "videoremote5"></div>
                </div>

                
            </div>
        </div>

        <div class="alert-flex-layout" id="alert-flex">
        </div>

        <div class="fixed bottom-0 left-0 z-50 bottom-bar-layout dark:bg-gray-700 dark:border-gray-600 "> <!--하단 네비게이터 바-->
            
            <div class="flex flex-row h-auto w-auto mx-auto flex-nowrap font-medium" id="user_ui_options"><!--플렉스 컨테이너-->
                <div class="flex flex-row" style="width:20%" >
                    <button class="btn btn-warning btn-xs" id="exit" style="margin : 0; padding: 0px; margin-left: 0.5rem">
                        <img class="bottom-bar-button-icon-layout" src="/img/exit-room.png"/>
                    </button>
                </div>
                <div class="flex flex-row" style="width:30%" >
                    <button class="btn btn-warning btn-xs" id="video-publish-btn" style="margin-right: 0.5rem; padding:0px;" >
                        <img class="bottom-bar-button-icon-layout" src="/img/now-cam-off.png"/>
                    </button>
                    <button class="btn btn-warning btn-xs" id="mute" type="button" style="margin-right: 0rem; padding: 0px;">
                        <img class="bottom-bar-button-icon-layout" src="/img/now-mute.png"/>
                    </button>
                </div>
                <div class="flex flex-row" style="width:50%" >
                    <div class="text-center" id="topic-button">
                        <button data-popover-target="topic-popover-box" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" type="button">
                        TOPIC
                        </button>
                     </div>
                </div>


                <div class="flex flex-row">
                    <button class="btn btn-warning btn-xs" data-drawer-target="drawer" data-drawer-toggle="drawer" data-drawer-placement="right" aria-controls="drawer" style="margin-right: 0.5rem">
                        <img class="bottom-bar-button-icon-layout" src="/img/more.png"/>
                    </button>
                </div>

                
            </div>
        </div>
    </div>
    
    <div data-popover id="topic-popover-box" role="tooltip" class="absolute z-10 invisible inline-block w-64 text-sm text-gray-500 transition-opacity duration-300 bg-white border border-gray-200 rounded-lg shadow-sm opacity-0 dark:text-gray-400 dark:border-gray-600 dark:bg-gray-800">
        <div class="px-3 py-2 bg-gray-100 border-b border-gray-200 rounded-t-lg dark:border-gray-600 dark:bg-gray-700">
            <h3 class="text-center font-semibold text-gray-900 dark:text-white" id="topic-head">회의 주제</h3>
        </div>
        <div class="px-3 py-2">
            <h4 class="text-center" id="topic"></h4>
        </div>
        <div data-popper-arrow></div>
    </div>

    <!-- side drawer component -->
    <div id="drawer" class="rounded-l-lg fixed side-bar-layout z-40 p-4 overflow-y-auto transition-transform translate-x-full dark:bg-gray-800 drawer-open" tabindex="-1" aria-labelledby="drawer-navigation-label" style="background:#424242;">
        <h5 id="drawer-navigation-label" class="text-base font-semibold text-white uppercase dark:text-gray-400">Participants</h5>
        <button type="button" data-drawer-hide="drawer" aria-controls="drawer" class="text-white bg-transparent rounded-lg text-sm p-1.5 absolute top-2.5 end-2.5 inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" >
            <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
            <span class="sr-only">Participants</span>
        </button>
        <div class="py-4 overflow-y-auto">
            <ul class="space-y-2 font-medium" id="participantList">
            </ul>
        </div>
    </div>

   


    

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>