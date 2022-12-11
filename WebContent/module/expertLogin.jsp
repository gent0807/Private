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
<style>
  .box {
    text-align: center;
    margin: auto;
    margin-top: 130px;
    width: 420px;
    height: 480px;
    border: solid 4px #900020;
    border-radius: 21px;
    background: white;
    
    }
    #logo{
      margin-top: 25px;
    }
    #login, #pass {
    text-align: left;
    width: 225px;
    height: 30px;
    border: solid 2px #900020;
    border-radius: 10px;
    padding-left: 10px;
    outline: none;
}

    #btn{
    width: 225px;
    height: 50px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 10px;
    border: solid 2px #900020;
    background: white;
    }    

    #btn:hover{
    background: #900020;
    color:white;
    }
  
</style>
</head>
<body>
	<div class="box">
		<a href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome"><img alt="Private" id="logo" width="130" height="130" src="img/daram.png"></a>
		<br>
		<br>		
		<form action="ExpertLogin.do" method="post">
			<input type="text" id="login" name="expertid" value=<%=session.getAttribute("userModeId") %>><br>
			<p style=<%=idCheckVisibleE %>>존재하지 않는 전문가 아이디입니다.</p>
			<input type="password" id="pass" name="password"><br>
			<p style=<%=passwordCheckVisibleE %>>비밀번호가 일치하지 않습니다.</p>	
			<input type="submit" id="btn" value="전문가 로그인">
		</form>
		<div>
			<br>
			비밀번호를 잊어버리셨나요? <a href="privateHome.jsp?CONTENTPAGE=findExpertPassword.jsp&FOOTERIS=display:none" style="text-decoration:underline">비밀번호 찾기</a>
		</div>
	</div>
</body>
</html>