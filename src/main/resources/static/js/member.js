// 유효성 검사
function check(){
	 if($.trim($("#member_id").val())==""){
		 alert("회원아이디를 입력하세요!");
		 $("#member_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#member_passwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#confirm_password").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#confirm_password").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd").val()) != $.trim($("#confirm_password").val())){
		 alert("비번이 다릅니다!");
		 $("#member_passwd").val("");
		 $("#confirm_password").val("");
		 $("#member_passwd").focus();
		 return false;
	 }
	 if($.trim($("#member_name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#member_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_zipcode").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#member_zipcode").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_address").val())==""){
		 alert("주소를 입력하세요!");
		 $("#member_address").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_address_detail").val())==""){
		 alert("나머지 주소를 입력하세요!");
		 $("#member_address_detail").val("").focus();
		 return false;
	 }
	
	 if($.trim($("#member_phone").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#member_phone").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_email").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#member_email").val("").focus();
		 return false;
	 }
	
 }
 
function post_search(){
	alert("우편번호 검색 버튼을 클릭하세요!");
}

function post_check(){
	window.open("zipcode_find.do","우편번호검색","width=420,height=200,scrollbars=yes");
}

// 아이디 중복 체크
function id_check(){ 
	$("#idcheck").hide();//idcheck span 아이디 영역을 숨긴다.
	var memid=$("#member_id").val();
	//1.입력글자 길이 체크 
	if($.trim($("#member_id").val()).length < 4){
		var newtext='<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#member_id").val("").focus();
		return false;
	};
	if($.trim($("#member_id").val()).length >12){
		var newtext='<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);
		$("#member_id").val("").focus();
		return false;
	};
	//입력아이디 유효성 검사
	if(!(validate_userid(memid))){
		var newtext='<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');		
		$("#idcheck").show();		
		$("#idcheck").append(newtext);
		$("#member_id").val("").focus();
		return false;
	};
	

	//아이디 중복확인
    $.ajax({
        type:"POST",
        url:"/member_idCheck",
        data: {"memid":memid},        
        success: function (data) { 
			
       	//alert("return success="+data);
      	  if(data==1){			//중복 ID
      		var newtext='<font color="red">중복 아이디입니다.</font>';
      			$("#idcheck").text('');
        		$("#idcheck").show();
        		$("#idcheck").append(newtext);
          		$("#member_id").val('').focus();
          		return false;
	     
      	  }else{				//사용 가능한 ID
      		var newtext='<font color="blue">사용가능한 아이디입니다.</font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append(newtext);
      		$("#member_passwd").focus();
      	  }  	    	  
        }
        ,
    	  error:function(e){
    		  alert("data error"+e);
    	  }
      });//$.ajax	
};

// 정규 표현식 검사
function validate_userid(memid){
  var pattern= new RegExp(/^[a-z0-9_]+$/);  //영문 소문자,숫자 ,_가능,정규표현식
  
  return pattern.test(memid);
};
 
/*function domain_list() {
	var num=f.mail_list.selectedIndex;  //selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	
	if ( num == -1 ) {					//num==-1은 해당 리스트목록이 없다
		return true;
	}
	if(f.mail_list.value=="0"){  		// 직접입력
		 f.join_maildomain.value="";
		 f.join_maildomain.readOnly=false;
		 f.join_maildomain.focus();
	}else {								//리스트목록을 선택했을때	 
		f.join_maildomain.value=f.mail_list.options[num].value;
		f.join_maildomain.readOnly=true;
	 }
 }*/

 // 회원정보 수정 경고창 
/*function edit_check(){
	if($.trim($("#signup-password").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#signup-password").val("").focus();
		 return false;
	 }
	 if($.trim($("#signup-confirm-password").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#signup-confirm-password").val("").focus();
		 return false;
	 }
	 if($.trim($("#signup-password").val()) != $.trim($("#signup-confirm-password").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#signup-password").val("");
		 $("#signup-confirm-password").val("");
		 $("#signup-password").focus();
		 return false;
	 }
	 if($.trim($("#signup-name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#signup-name").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_zip").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#join_zip").val("").focus();
		 return false;
	 }	 
	 if($.trim($("#join_addr1").val())==""){
		 alert("주소를 입력하세요!");
		 $("#join_addr1").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_addr2").val())==""){
		 alert("나머지 주소를 입력하세요!");
		 $("#join_addr2").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_tel2").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#join_tel2").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_tel3").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#join_tel3").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_phone2").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#join_phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_phone3").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#join_phone3").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_mailid").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#join_mailid").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_maildomain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#join_maildomain").val("").focus();
		 return false;
	 }	 	 
}*/
 
 












 
 
 
 