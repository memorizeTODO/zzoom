<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
</head>
<body>









    <h2>Create Meeting</h2>
    <form id="insertForm">
    <input type="hidden" id="meetingID" name="meetingID" value="get/">
    <label for="meetingMemberNum">meetingMemberNum:</label>
    <input type="number" id="meetingMemberNum" name="meetingMemberNum"><br>
    <label for="meetingTopic">meeting Topic:</label>
    <input type="text" id="meetingTopic" name="meetingTopic"><br>
    <label for="meetingPasswd">meeting Passwd:</label>
    <input type="text" id="meetingPasswd" name="meetingPasswd"><br>
    <label for="meetingStartDate">meetingStartDate:</label>
    <input type="date" id="meetingStartDate" name="meetingStartDate"><br>
    <label for="memberName">memberName:</label>
    <input type="text" id="memberName" name="memberName"><br>
    <label for="memberID">memberID:</label>
    <input type="text" id="memberID" name="memberID"><br>


    <button type="button" onclick="updateMeeting()">update</button>
	</form>
    
    <script>
       
	
	var today = new Date();

    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;

    console.log(dateString);
	
    function updateMeeting() {
    	
        var jsonData = {
            meeting_id: document.getElementById("meetingID").value,
            meeting_member_num: document.getElementById("meetingMemberNum").value,
            meeting_topic: document.getElementById("meetingTopic").value,
            meeting_passwd: document.getElementById("meetingPasswd").value,
            meeting_start_date: document.getElementById("meetingStartDate").value,
            member_id: document.getElementById("memberID").value,
            member_name: document.getElementById("memberName").value,
        };

        // AJAX를 사용하여 서버에 JSON 데이터 전송
        $.ajax({
            type: "POST",
            url: "http://localhost:80/update-meeting", // 요청을 처리하는 컨트롤러의 엔드포인트
            contentType: "application/json",
            data: JSON.stringify(jsonData), // JSON 데이터를 문자열로 변환하여 전송
            success: function(response) {
                console.log("Success: " + response);
                // 성공적으로 처리된 경우 실행할 코드
                location.reload(true);
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
                // 오류 발생 시 실행할 코드
            }
        });
    }		
    
		

    
       /* $(document).ready(function(){
            $("#passwordForm").submit(function(event){
                // 폼의 기본 동작을 막습니다.
                event.preventDefault();

                // 입력된 비밀번호를 가져옵니다.
                var password = $("#password").val();

                // AJAX 요청을 생성합니다.
                $.ajax({
                    type: "POST",
                    contentType: "text/plain",
                    url: "http://localhost:80/check-password",
                    data: password,
                    success: function(data){
                        // 서버에서 받은 결과를 처리합니다.
                        if(data === "success") {
                            $("#result").text("비밀번호가 맞습니다.");
                        } else {
                            $("#result").text("비밀번호가 틀렸습니다.");
                        }
                    },
                    error: function(e){
                        console.log("Error:", e);
                    }
                });
            });
        });*/
        
        
        async function search() {
            
            const res = await fetch('http://localhost:80/get/meetingroom?code=bab1211c');
			const resJson = await res.json();
            
			document.getElementById("meetingID").value = resJson.meeting_id;
			document.getElementById("meetingMemberNum").value = resJson.meeting_member_num;
			document.getElementById("meetingTopic").value = resJson.meeting_topic;
			document.getElementById("meetingPasswd").value = resJson.meeting_passwd;
			document.getElementById("meetingStartDate").value = resJson.meeting_start_date;
			document.getElementById("memberName").value = resJson.member_name;
			document.getElementById("memberID").value = resJson.member_id;
			
			console.log(resJson);
        }
        
        search();
        
		async function listsearch() {
            
            const res = await fetch('http://localhost:80/get/meetinglist?memberID=test');
			const resJson2 = await res.json();
			
            
			console.log(resJson2);
        }
        listsearch();
    </script>
</body>
</html>