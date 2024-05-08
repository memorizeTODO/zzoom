<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
</head>
<body>









    <button type="button" onclick="meetingAlert()">alert</button>
    
    <script>
       
	 	
	 var today = new Date();

    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;

    console.log(dateString);
	
    function saveMeeting() {
    	
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
            member_id: document.getElementById("memberID").value,
            member_name: document.getElementById("memberName").value,
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
                // 성공적으로 처리된 경우 실행할 코드
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
                // 오류 발생 시 실행할 코드
            }
        });
    }		
    

    
     
        
        
        async function search() {
            
            const res = await fetch('http://localhost:80/joinMeetingRoom');
			const resJson = await res.json();
			
            
			alert(resJson.meeting_room_num);
        }
        search();
        
		async function listsearch() {
            const res = await fetch('http://localhost:80/get/meetinglist?memberID=test');
			const meetingList = await res.json();
			
			const keys = Object.keys(meetingList);
			
			const innerHtmlList = keys.map((key)=>{
                const campdataList = campJson[key];
                    const innerHTML = 
			
                    	
                    	
                    	
                    	
                    	;	
                    	return innerHTML;
            });
			const campdataList = document.getElementById("camp-list");
            campdataList.innerHTML = innerHtmlList.join('')
        }
        listsearch();
    </script>
</body>
</html>