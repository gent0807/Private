<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
<style>
</style>	
</head>
<body>
	<p>가입한 이메일 주소를 입력해주세요.</p>
	<form action="" style="text-align:center;">
		<input id="email" type="text" placeholder="이메일" style="height:30px; width:200px; border:1px solid #808080; vertical-align:middle;">
		<input id="check" type="button" value="확인" style="height:34px;  vertical-align:middle;" disabled>
		<p id="anounce" style="visibility:hidden;"></p>
		<input id="catchmsg" type="submit" style="width:250px; height:48px; "value="이메일로 비밀번호 받기" disabled> 
	</form>
</body>
<script>
	let email=document.getElementById("email");
	let check=document.getElementById("check");
	let anounce=document.getElementById("anounce");
	let catchmsg=document.getElementById("catchmsg");
	let auth="no";
	let emails='${emails}';		
	let result=emails.slice(1,emails.length-1);
	let resultArr=result.split(", ");
	
	email.addEventListener("keyup",function(){
		if(email.value==""){
			check.disabled=true;
			email.style.border="1px solid red";
			anounce.innerHTML="필수 입력사항입니다.";
			anounce.style.visibility="visible";
		}
		else if(email.value!=""){
			check.disabled=false;
			email.style.border="1px solid black";
			anounce.style.visibility="hidden";
		}
	});
	
	email.addEventListener("blur",function(){
		if(email.value==""){
			check.disabled=true;
			email.style.border="1px solid red";
			anounce.innerHTML="필수 입력사항입니다.";
			anounce.style.visibility="visible";
		}
		else if(email.value!=""){
			check.disabled=false;
			email.style.border="1px solid black";
			anounce.style.visibility="hidden";
		}
	});
	
	check.addEventListener("click", function(){
		let str=email.value;
		for(var i=0; i<emails.length;i++){
			if(str==resultArr[i]){
				auth="ok";
			}
		}
		if(auth=="ok"){
			email.style.border="1px solid green";
			anounce.style.visibility="hidden";
			catchmsg.disabled=false;
		}
		else if(auth=="no"){
			email.style.border="1px solid red";
			anounce.innerHTML="등록되지 않은 이메일입니다.";
			anounce.style.visibility="visible";
		}
		
	});
</script>
</html>