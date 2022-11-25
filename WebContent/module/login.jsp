<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idCheckVisible=(String)session.getAttribute("idCheckVisible");
	if(idCheckVisible==null){
		idCheckVisible="visibility:hidden";
	}
	String passwordCheckVisible=(String)session.getAttribute("passwordCheckVisible");
	if(passwordCheckVisible==null){
		passwordCheckVisible="visibility:hidden";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Private</title>   
</head>
<body>
	<div>
		<a href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome"><img alt="Private" width="130" height="130" src="img/daram.png"></a>
		<br>
		<form>
				<p>SNS 계정으로 간편하게 로그인</p>
				<img src="img/naver.png" height="45" width="45" style="vertical-align:middle;">&nbsp;
				<img src="img/kakao.png" height="45" width="45" style="vertical-align:middle;">&nbsp;
				<img src="img/google.png" height="45" width="45" style="vertical-align:middle;">
		</form>
		<br>
		<hr style="width: 18%">
		<br>
		<br>
		<form action="module/loginProcess.jsp" method="post">
			Email : <input type="text" name="memberid"><br>
			<p style=<%=idCheckVisible %>>존재하지 않는 아이디입니다.</p>
			password : <input type="password" name="password"><br>
			<p style=<%=passwordCheckVisible %>>비밀번호가 일치하지 않습니다.</p>	
			<input type="submit" value="로그인">
		</form>
		<div>
			<br>
			<br>
			아직 회원이 아니신가요? <a href="privateHome.jsp?CONTENTPAGE=createAccount.jsp" style="text-decoration:underline;">회원가입</a>
			<br>
			<br>
			비밀번호를 잊어버리셨나요? <a href="privateHome.jsp?CONTENTPAGE=findUserPassword.jsp&FOOTERIS=display:none" style="text-decoration:underline">비밀번호 찾기</a>
		</div>
	</div>
	<script>
		
		
	</script>
</body>
</html>