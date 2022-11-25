<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idCheckVisibleE=(String)session.getAttribute("idCheckVisibleE");
	if(idCheckVisibleE==null){
		idCheckVisibleE="visibility:hidden";
	}
	String passwordCheckVisibleE=(String)session.getAttribute("passwordCheckVisibleE");
	if(passwordCheckVisibleE==null){
		passwordCheckVisibleE="visibility:hidden";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<div>
		<a href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome"><img alt="Private" width="130" height="130" src="img/daram.png"></a>
		<br>
		<br>		
		<form action="module/expertLoginProcess.jsp" method="post">
			Email : <input type="text" name="expertid" value=<%=session.getAttribute("userModeId") %>><br>
			<p style=<%=idCheckVisibleE %>>존재하지 않는 전문가 아이디입니다.</p>
			password : <input type="password" name="password"><br>
			<p style=<%=passwordCheckVisibleE %>>비밀번호가 일치하지 않습니다.</p>	
			<input type="submit" value="전문가 로그인">
		</form>
		<div>
			<br>
			비밀번호를 잊어버리셨나요? <a href="privateHome.jsp?CONTENTPAGE=findExpertPassword.jsp&FOOTERIS=display:none" style="text-decoration:underline">비밀번호 찾기</a>
		</div>
	</div>
</body>
</html>