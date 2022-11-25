<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Private</title>   
<style>
	#emailFront{
		outline:none;
	}
	#nickSector{
		outline:none;
	}
	
	#pass1{
		outline:none;
	}
	#pass2{
		outline:none;
	}
</style>
</head>
<body>
	<div>
		
		<a href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome"><img alt="Private" width="130" height="130" src="img/daram.png"></a>
		<br>
		<form>
			<p>SNS 계정으로 간편하게 회원가입</p>
			<img src="img/naver.png" height="45" width="45" style="vertical-align:middle;">&nbsp;
			<img src="img/kakao.png" height="45" width="45" style="vertical-align:middle;">&nbsp;
			<img src="img/google.png" height="45" width="45" style="vertical-align:middle;">
		</form>
		<br>
		<hr style="width: 18%;">
		<form id="form" action="module/insertUserProcess.jsp" method="post">
			<h1>이메일</h1>
			<input id="emailFront" type="text" name="memberIdFront">&nbsp;@
			<select id ="emailBack2" style="width:190px; height:21px; font-size:14px;" name="memberIdBack">
				<option value="notproper" selected disabled>선택해주세요</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="outlook.com">outlook.com</option>
				<option value="self">직접 입력</option>
			</select>
			<input id="emailBack1" type="text" name="memberIdBackSelf" placeholder="직접입력" style="width:0px; heigtht:0px; visibility:hidden;"><br>
			<p id="p1" style="display:block"></p>
			<p id="p2" style="display:none"></p>
			<p id="p3" style="display:none"></p>
			<input id="authority" type="button" value="이메일 인증하기" disabled>
			<h1>비밀번호</h1>
			<input id="pass1" type="password">
			<h1>비밀번호 확인</h1>
			<input id="pass2" type="password" name="password">
			<p id="p4" style="display:none"></p>
			<h1>닉네임</h1>
			<input id="nickSector" type="text" name="nickname">
			<p id="p5" style="display:none"></p>
			<br>
			<br>
			<input id="sign" type="button" value="회원가입하기">
		</form>
		<div>
			<br>
			이미 아이디가 있으신가요? <a href="privateHome.jsp?CONTENTPAGE=login.jsp" style="text-decoration:underline;">로그인</a>
			
		</div>
		<script type="text/javascript">
			let emailFront=document.getElementById("emailFront");
			let emailBack2=document.getElementById("emailBack2");
			let emailBack1=document.getElementById("emailBack1");
			let authority=document.getElementById("authority");
			let emailPossible=false;
			
			let p1=document.getElementById("p1");
			let p2=document.getElementById("p2");
			let p3=document.getElementById("p3");
			let p4=document.getElementById("p4");
			let p5=document.getElementById("p5");
			
			let emails='${emails}';
			let result=emails.slice(1,emails.length-1);
			let resultArr=result.split(", ");
			
			let nicknames='${nicknames}';
			let nick=nicknames.slice(1,nicknames.length-1);
			let nickArr=nick.split(", ");			
			let nickSector=document.getElementById("nickSector");
			let nickPossible=false;
			
			let pass1=document.getElementById("pass1");
			let pass2=document.getElementById("pass2");
			let passPossible=false;
			
			let sign=document.getElementById("sign");
			let form=document.getElementById("form")
			
			let value="notproper";
			
			emailBack2.addEventListener("change", function(){
				
				value=emailBack2.options[emailBack2.selectedIndex].value;
				
				if(value=="self"){
					emailBack1.style.width="180px";
					emailBack1.style.height="16px";
					emailBack1.style.visibility="visible";
					emailBack2.style.display="none";
					emailFront.style.border="1px solid red";
					emailBack1.style.border="1px solid red";
					p1.style.display="block";
					p2.style.display="none";
					p1.innerHTML="올바르지 않은 형식입니다.";	
					authority.disabled=true;
				}
				else{
					if(emailFront.value==""){
						p1.style.display="block";
						p2.style.display="none";
						p1.innerHTML="올바르지 않은 형식입니다.";
						emailFront.style.border="1px solid red";
						emailBack2.style.border="1px solid red";
						authority.disabled=true;
					}
					else{
						p1.innerHTML="";
						p1.style.display="none";
						p2.style.display="block";
						if(emailFront.value.includes('@')==true){
							p1.style.display="block";
							p2.style.display="none";
							p1.innerHTML="올바르지 않은 형식입니다.";
							emailFront.style.border="1px solid red";
							emailBack2.style.border="1px solid red";
							authority.disabled=true;
						}
						else{
						str=emailFront.value+"@"+value;
						p3.innerHTML=str;
						for(var i=0;i<resultArr.length;i++){
							if(str==resultArr[i]){
								p2.innerHTML="이미 가입된 이메일입니다.";
								emailFront.style.border="1px solid red";
								emailBack2.style.border="1px solid red";
								authority.disabled=true;
								break;
							}
							else{
								p2.innerHTML="사용 가능한 아이디입니다.";
								emailFront.style.border="1px solid green";
								emailBack2.style.border="1px solid green";
								authority.disabled=false;
							}
						}
						}
					}
					
					
				}
				
				
			
			})
			
			emailFront.addEventListener("keyup",function(){
				
				if(value=="notproper"){
					p1.style.display="block";
					p2.style.display="none";
					p1.innerHTML="올바르지 않은 형식입니다.";
					emailFront.style.border="1px solid red";
					emailBack2.style.border="1px solid red";
					authority.disabled=true;
					
				}
				else if((value=="self")&&(emailBack1.value=="")||(emailFront.value=="")){
					p1.style.display="block";
					p2.style.display="none";
					p1.innerHTML="올바르지 않은 형식입니다.";	
					emailFront.style.border="1px solid red";
					emailBack1.style.border="1px solid red";
					authority.disabled=true;					
				}
				else{
					if(emailFront.value.includes('@')==true){
						p1.style.display="block";
						p2.style.display="none";
						p1.innerHTML="올바르지 않은 형식입니다.";
						emailFront.style.border="1px solid red";
						emailBack2.style.border="1px solid red";
						authority.disabled=true;
					}
					else{
					p1.innerHTML="";
					p1.style.display="none";
					p2.style.display="block";
					if(value=="self"){
						str=emailFront.value+"@"+emailBack1.value;
						p3.innerHTML=str;
						for(var i=0;i<resultArr.length;i++){
							if(str==resultArr[i]){
								p2.innerHTML="이미 가입된 이메일입니다.";
								emailFront.style.border="1px solid red";
								emailBack1.style.border="1px solid red";
								authority.disabled=true;
								break;
							}
							else{
								p2.innerHTML="사용 가능한 아이디입니다.";
								emailFront.style.border="1px solid green";
								emailBack1.style.border="1px solid green";
								authority.disabled=false;
							}
						}
					}
					else{
						str=emailFront.value+"@"+value;
						p3.innerHTML=str;
						for(var i=0;i<resultArr.length;i++){
							if(str==resultArr[i]){
								p2.innerHTML="이미 가입된 이메일입니다.";
								emailFront.style.border="1px solid red";
								emailBack2.style.border="1px solid red";
								authority.disabled=true;
								break;
							}
							else{
								p2.innerHTML="사용 가능한 아이디입니다.";
								emailFront.style.border="1px solid green";
								emailBack2.style.border="1px solid green";
								authority.disabled=false;
							}
						}
					}
					}
				}
				
				
			})
			
			emailBack1.addEventListener("keyup",function(){
				if(emailFront.value==""){
					p1.style.display="block";
					p2.style.display="none";
					p1.innerHTML="올바르지 않은 형식입니다.";
					emailFront.style.border="1px solid red";
					emailBack1.style.border="1px solid red";
					authority.disabled=true;
				}
				else{
					if(emailFront.value.includes('@')==true){
						p1.style.display="block";
						p2.style.display="none";
						p1.innerHTML="올바르지 않은 형식입니다.";
						emailFront.style.border="1px solid red";
						emailBack2.style.border="1px solid red";
						authority.disabled=true;
					}
					else{
					p1.innerHTML="";
					p1.style.display="none";
					p2.style.display="block";
					str=emailFront.value+"@"+emailBack1.value;
					p3.innerHTML=str;
					for(var i=0;i<resultArr.length;i++){
						if(str==resultArr[i]){
							p2.innerHTML="이미 가입된 이메일입니다.";
							emailFront.style.border="1px solid red";
							emailBack1.style.border="1px solid red";
							authority.disabled=true;
							break;
						}
						else{
							p2.innerHTML="사용 가능한 아이디입니다.";
							emailFront.style.border="1px solid green";
							emailBack1.style.border="1px solid green";
							authority.disabled=false;
						}
					}
					}
				}
			})
			
			nickSector.addEventListener("keyup",function(){
				
				if(nickSector.value==""){
					nickSector.style.border="1px solid black";
					p5.style.display="none";
					p5.innerHTML="";
					nickPossible=false;
				}
				else{
				for(var i=0; i<nickArr.length;i++){
					if(nickSector.value==nickArr[i]){
						nickSector.style.border="1px solid red";
						p5.style.display="block";
						p5.innerHTML="이미 사용 중인 닉네임입니다.";
						nickPossible=false;
						break;
					}
					else{
						nickSector.style.border="1px solid green";
						p5.style.display="block";
						p5.innerHTML="사용 가능한 닉네임입니다.";
						nickPossible=true;
					}
				}	
				}
			})
			
			authority.addEventListener("click",function(){
				emailPossible=true;
			})
			
			pass2.addEventListener("keyup",function(){
				if(pass1.value==pass2.value){
					pass1.style.border="1px solid green";
					pass2.style.border="1px solid green";
					p4.style.display="block";
					p4.innerHTML="일치합니다.";
					passPossible=true;
				}
				else{
					pass1.style.border="1px solid red";
					pass2.style.border="1px solid red";
					p4.style.display="block";
					p4.innerHTML="일치하지않습니다.";
					passPossible=false;
				}
			})
			
			sign.addEventListener("click",function(){
				if((emailPossible==true)&&(nickPossible==true)&&(passPossible==true)){
					form.submit();
				}
				else{
					alert("아직 승인되지 않은 정보가 있습니다. 입력정보를 확인하세요!");
				}
			})			
			
		</script>
		
	</div>
</body>
</html>