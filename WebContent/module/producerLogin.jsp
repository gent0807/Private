<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idCheckVisibleP=(String)session.getAttribute("idCheckVisibleP");
	if(idCheckVisibleP==null){
		idCheckVisibleP="visibility:hidden";
	}
	String passwordCheckVisibleP=(String)session.getAttribute("passwordCheckVisibleP");
	if(passwordCheckVisibleP==null){
		passwordCheckVisibleP="visibility:hidden";
	}
	String storeNameCheckVisible=(String)session.getAttribute("storeNameCheckVisible");
	if(storeNameCheckVisible==null){
		storeNameCheckVisible="visibility:hidden";
	} 	
	String storeIdCheckVisible=(String)session.getAttribute("storeIdCheckVisible");
	if(storeIdCheckVisible==null){
		storeIdCheckVisible="visibility:hidden";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
<style>
  .box{
    text-align: center;
    margin: auto;
    margin-top: 60px;
    width: 420px;
    height: 690px;
    border: solid 4px #900020;
    border-radius: 21px;
    background: white;
  }
  #logo{
    margin-top: 25px;
  }
  #login, #pass, #sangho, #saup {
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
		<form action="ProducerLogin.do" method="post">
			<input type="text" id="login" name="producerid" placeholder="판매자 아이디"><br>
			<p style=<%=idCheckVisibleP %>>존재하지 않는 판매자 아이디 입니다.</p>
			<input type="password" id="pass" name="password" placeholder="비밀번호"><br>
			<p style=<%=passwordCheckVisibleP %>>비밀번호가 일치하지 않습니다.</p>
			<input type="text" id="sangho" name="storeName" placeholder="상호명"><br>
			<p style=<%=storeNameCheckVisible %>>등록되지 않은 상호명 입니다.</p>
			<input type="text" id="saup" name="storeId" placeholder="사업자등록번호"><br>
			<p style=<%=storeIdCheckVisible %>>등록되지 않은 사업자등록번호입니다.</p>
			<input type="submit" id="btn" value="판매자 로그인">
		</form>
		<div>
			<br>
			등록된 상호명을 잊어버리셨나요? <a href="privateHome.jsp?CONTENTPAGE=findStoreName.jsp&FOOTERIS=display:none" style="text-decoration:underline">등록 상호명 찾기</a>
			<br>
			<br>
			비밀번호를 잊어버리셨나요? <a href="privateHome.jsp?CONTENTPAGE=findProducerPassword.jsp&FOOTERIS=display:none" style="text-decoration:underline">비밀번호 찾기</a>
		</div>
	</div>
</body>
</html>