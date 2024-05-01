$(document).ready(function(){
	$("form").submit(function(){
		
		if($.trim($("#manager_id").val())==""){
			alert("ID를 입력하세요");
			$("#manager_id").focus();
			return false;
		}
		
		if($.trim($("#manager_passwd").val())==""){
			alert("비밀번호를 입력하세요");
			$("#manager_passwd").focus();
			return false;
		}
		
	});
});