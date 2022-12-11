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
<title>로그인</title>
<style>
    .box {
    text-align: center;
    margin: auto;
    margin-top: 20px;
    width: 420px;
    height: 690px;
    border: solid 4px #900020;
    border-radius: 21px;
    background: white;
    
    }
    p{
        font-weight: bold;
    }
    #in1 {
    text-align: left;
    width: 225px;
    height: 30px;
    border: solid 2px #900020;
    border-radius: 10px;
    padding-left: 10px;
    outline: none;
}
    #in2 {
    text-align: left;
    width: 225px;
    height: 30px;
    border: solid 2px #900020;
    border-radius: 10px;
    padding-left: 10px;
    outline: none;
}
    }
    #logo{
      margin-top: 30px;
    }
     .submit{
    width: 225px;
    height: 50px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 10px;
    border: solid 2px #900020;
    background: white;
    }
    
    .line{
    margin: 8px 0px 0px 85px;
    width: 253px;
    border: solid 2px #900020;
    border-radius: 20px;
    position: absolute;
    }
    
    .loginapi{
    margin:25px 0px 0px 0px; 
    }
    
    .submit:hover{
    background: #900020;
    color:white;
    }
</style>   
</head>
<body>
   <div class="box">
      <div class="loginapi">
            <a href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome"><img alt="Private" id="logo" width="130" height="130" src="img/daram.png"></a>
            <p>SNS 계정으로 간편하게 로그인</p>
            <img src="img/naver.png" height="45" width="45" style="vertical-align:middle;">&nbsp;
            <img src="img/kakao.png" height="45" width="45" style="vertical-align:middle;">&nbsp;
            <img src="img/google.png" height="45" width="45" style="vertical-align:middle;">
      </div>
      <br>
      <hr class="line">
      <br>
      <br>
      <form action="Login.do" method="post">
         <input type="text" id="in1" name="memberid" placeholder="아이디" ><br>
         <p style=<%=idCheckVisible %>>존재하지 않는 아이디입니다.</p>
         <input type="password" id="in2" name="password" placeholder="비밀번호" ><br>
         <p style=<%=passwordCheckVisible %>>비밀번호가 일치하지 않습니다.</p>   
         <button class="submit" >로그인</button>
      </form>
      <div>
         <br>
         <br>
         아직 회원이 아니신가요? <a href="privateHome.jsp?CONTENTPAGE=createAccount.jsp&MENUBAR=none&FOOTERIS=display:none" style="text-decoration:underline;">회원가입</a>
         <br>
         <br>
         비밀번호를 잊어버리셨나요? <a href="privateHome.jsp?CONTENTPAGE=findUserPassword.jsp&MENUBAR=none&FOOTERIS=display:none" style="text-decoration:underline">비밀번호 찾기</a>
      </div>
   </div>
   <script>
      
      
   </script>
</body>
</html>