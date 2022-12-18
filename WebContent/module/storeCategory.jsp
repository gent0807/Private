<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Private</title>
<style>
  .box1{
    margin-top: 40px;
    margin-bottom: 35px;
    text-align: center;
  }
  .box2{
    margin-top: 35px;
    width: 846px;
    height: 250px;
    position: relative;
    margin: 0 auto;
    overflow: hidden;
}
.box2 input[type=radio]{
    display: none;
}

.box2 input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #760c0c;
}
.box2 input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #760c0c;
}
.box2 input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #760c0c;
}
.box2 input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #760c0c;
}
.box2 input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.box2 input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.box2 input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.box2 input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;
}
.bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 20px;
    height: 20px;
    cursor: pointer;
}
ul.imgs{
    padding: 0;
    margin: 0;
    list-style: none;    
}
ul.imgs li{
    position: absolute;
    left: 640px;
    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */

    padding: 0;
    margin: 0;
}
.box2-2{
  margin: auto;
  width: 846px;
    height: 35px;
    position: relative;
}
.box3{
  margin: auto;
  width: 846px;
    height: 137px;
    position: relative;
}
.box4{
  margin: auto;
  width: 846px;
    height: 72px;
    position: relative;
}
.box5{
  margin: auto;
  width: 846px;
    height: 288px;
    position: relative;
}
.box6{
  margin: auto;
  width: 846px;
    height: 72px;
    position: relative;
}
.box7{
  margin: auto;
  width: 846px;
    height: 288px;
    position: relative;
}

.box8{
            bottom: 50px; 
            height: 100%;
            margin-bottom: -70px;
            margin-top: -50px;
            padding-bottom: 70px;
}
.sub_menu{  
            width: 200px;
            z-index: 10;
            background: white;
            height: auto;
            margin-left: 200px;
            margin-top: -1100px;
            margin-bottom: 850px;
}
.big_menu>a{
  font-size: 20px;
  font-weight: bold;
}
.small_menu>a{
  color: black;
  font-size: 18px;
  font-weight: bold;
  text-decoration-line: none;
  text-align: left;
}
.small_menu>a:hover{
  color: red;
}
#text1{
  margin-left: -810px;
  font-weight: bold;
  font-size: 20px;
}
</style>
</head>
<body>
    <div class="box1">
       <a id="text1">가구</a>
    </div>
      <div class="box2">
        <input type="radio" name="slide" id="slide1" checked>
        <input type="radio" name="slide" id="slide2">
        <input type="radio" name="slide" id="slide3">
        <input type="radio" name="slide" id="slide4">
        <ul id="imgholder" class="imgs">
            <li><img src="img/post4.jpg"></li>
            <li><img src="img/post2.jpg"></li>
            <li><img src="img/post3.jpg"></li>
            <li><img src="img/post1.jpg"></li>
        </ul>
        <div class="bullets">
          <label for="slide1">&nbsp;</label>
          <label for="slide2">&nbsp;</label>
          <label for="slide3">&nbsp;</label>
          <label for="slide4">&nbsp;</label>
      </div>
  </div>
  <div class="box2-2"></div>
  <div class="box3">
    <img src="img/post5.jpg">
  </div>
  <div class="box4">
    <img src="img/post6.jpg">
  </div>
    <div class="box5">
      <img src="img/post7.jpg">
    </div>
    <div class="box6">
      <img src="img/post8.jpg">
    </div>
    <div class="box7">
      <img src="img/post9.jpg">
    </div>
    <div class="box8">
      <div class="sub_menu">
        <ul class="big_menu">
            <a>카테고리</a>
            <ul class="small_menu"><br>
              <a href="#">가구</a><br>
              <a href="#">생필품</a><br>
              <a href="#">생활용품</a><br>
              <a href="#">애완용품</a><br>
              <a href="#">운동</a><br>
              <a href="#">주방</a><br>
              <a href="#">조명</a><br>
              <a href="#">인형</a><br>
              <a href="#">쿠션</a><br>
            </ul>
        </ul>
    </div>
    </div>
    <div class="box9">
    </div>
</body>
</html>