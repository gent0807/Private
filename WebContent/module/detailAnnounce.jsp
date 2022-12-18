<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <style>
 .box1{
  width: 670px;
  height: auto;
}
.box2{
 
  width: 670px;
  height: auto;
}
.box3{
  
  width: 670px;
  height: 46px;
}

.box3>img{
  width: 40px;
}

.box4{
  text-align:left;

  margin-top: 40px;
  width: 670px;
  height: auto;
}
.box4>img{
  max-width: 670px;
  height: auto;
}

.box5{
  text-align:left;
  margin-top: 70px;
  width: 670px;
  height: auto;
  font-weight: bold;
  
}

.box6{
  
  margin-top: 5px;
  width: 670px;
  height: auto;
  font-weight: bold;
  letter-spacing: -1px;
  font-size: 18px;
}

.box7{
 
  margin-top: 20px;
  width: 670px;
  height: auto;
  font-weight: bold;
  letter-spacing: -1px;
  font-size: 18px;
}
.box8{
  
  margin-top: 20px;
  width: 670px;
  height: auto;
  
}

#profile1{
  width: 35px;
  height: auto;
}
#profile2{
  width: 35px;
  height: auto;
}

  #span1{
  position: absolute;
  padding: 3px;
  font-size: 14px;
  font-weight: bold;
  opacity: 0.8;
}

  #span2{
  padding-left: 3px;
  opacity: 0.8;
  color: gray;
}

#span3{
  margin-left: 5px;
  padding: 3px;
  font-size: 18px;
  font-weight: bold;
  opacity: 0.8;
}

  #btn1{
    position: absolute;
    margin-left: 400px;
    width: 80px;
    height: 35px;
    border: none;
    border-radius: 7px;
    background-color: #900020;
    color: white;
    font-weight: bold;
  }
  #btn1:hover{
    background-color: #520012;
  }

#text1{
 
}
#text2{
  letter-spacing: -1px;
}

h1{
  letter-spacing: -2px;
}
#coment{
  border-radius: 7px;
  width: 602px;
  height: 40px;
}

#coment::placeholder{
  font-weight: bold;
  font-size: 14px;
}

#ask{
text-align: left;
 
  font-size: 15px;
  font-weight: 300;
}

</style>
<title>Document</title>
</head>
<body>
 <div style="display: flex; justify-content : center; text-align:left;">
  <div class="box1">
  	<h3>공지사항</h3>
  </div>
 </div>
 <div style="display: flex; justify-content : center;text-align:left;">
  <div class="box2">
     <h1>${wt.title}</h1>
  </div>
 </div>
 <div style="display: flex; justify-content : center;text-align:left;">
  <div class="box3">
    <img src="img/manager.png">&nbsp
    <span id="span1">${wt.nick}</span>
    <span id="span2">${wt.postdate}</span>
    <button type="button" id="btn1">+&nbsp팔로우</button>
  </div>
  </div>
  <div style="display: flex; justify-content : center;text-align:left;">
  <div class="box4">
  <c:if test="${wt.sfile!=null}">
    <img src="<%=request.getContextPath() %>/uploads/${wt.sfile}"><br><br><br>
  </c:if>
    <a id="text2">${wt.content}</a>
  </div>
  </div>
  <c:if test="${loginid=='tldbstjq95@naver.com'}">
  <div style="display: flex; justify-content : center; text-align:left;">
  	<div class="box5">
    	<span >수정</span>   |   <span onclick="location.href='DeleteQ.do?idx=${wt.idx}'">삭제</span>
  	</div>
  </div>
  </c:if>
  <div style="display: flex; justify-content : center; text-align:left;">
  <div class="box5">
  	조회수:${wt.visitcount}
  </div>
  </div>
  <br>
  <div style="display: flex; justify-content : center; text-align:left;">
  <div class="box6">
     댓글&nbsp0
  </div>
  </div>
  <div style="display: flex; justify-content : center; text-align:left;">
  <div class="box7">
    <img src="img/profile10.png" id="profile1">&nbsp
    <span><input id="coment" placeholder="댓글을 남겨보세요"></span>
  </div>
  </div>
  <div style="display: flex; justify-content : center; text-align:left;">
  <div class="box8">
    <img src="img/profile7.png" id="profile2">&nbsp 
    <span id="span3">또또문구팔씨름장인<br><p id="ask">왜 아무도 없을때 구우셨어요;
      주접떨지 말고 다음부터는 엄마한테 구워달라하세요.</p>
    </span>
  </div>
  </div>
</body>
</html>