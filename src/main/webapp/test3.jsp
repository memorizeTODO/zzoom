<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
</head>
<body>









    <h2>search Meeting</h2>
    <form id="insertForm">
    <label for="meeting_id">meeting_id:</label>
    <input type="text" id="meeting_id" name="meeting_id"><br>
    <button type="button" onclick="search()">Save</button>
	</form>
    
    
    <input type="text" id="display_room_num" name="display_room_num">
    
    
    <script>
       
	
	 var today = new Date();

    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;

    console.log(dateString);
	
    function joinMeeting() {
    	
  

           

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
            var meeting_id = document.getElementById("meeting_id").value
            const res = await fetch(`http://localhost:80/get/meetingroom?code=${"${meeting_id}"}`);
			const resJson = await res.json();
			var room_num = resJson.meeting_room_num;
			var meeting_ID = resJson.meeting_id;
			meeting_room_num = 50000+Number(room_num);
			document.getElementById("display_room_num").value = meeting_room_num;
			 
			 var jsonData = {
			            meeting_id: ${"meeting_ID"},
			            meeting_room_num: ${"meeting_room_num"},
			        };

			        // AJAX를 사용하여 서버에 JSON 데이터 전송
			        $.ajax({
			            type: "POST",
			            url: "http://localhost:80/joinMeetingRoom", // 요청을 처리하는 컨트롤러의 엔드포인트
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
        
		async function listsearch() {
            
            const res = await fetch('http://localhost:80/get/meetinglist?memberID=test');
			const resJson2 = await res.json();
			
            
			console.log(resJson2);
        }
    </script>
</body>
</html>