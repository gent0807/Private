<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test</title>
  <style>

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
    .slider{
    width: 1920px;
    height: 500px;
    position: relative;
    margin: 0 auto;
    overflow: hidden;
}
.slider input[type=radio]{
    display: none;

    
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


.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #760c0c;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #760c0c;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #760c0c;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #760c0c;
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.5s;
    z-index:1;
}

#more{
  margin-top: 30px;
  margin-left: 400px;
}

#img1{
  width:90px; 
  height:90px;
}

#img2{
  width:90px; 
  height:90px;
}

#img3{
  width:90px; 
  height:90px;
}

#img4{
  width:90px; 
  height:90px;
}

#more2{
  margin-left: 411px;
  font-size: 17px;
  font-weight: 600;
}

#more3{
  margin-left: 371px;
}

#icon1:hover{
  opacity: 0.7;
}
#icon2:hover{
  opacity: 0.7;
}
#icon3:hover{
  opacity: 0.7;
}
#icon4:hover{
  opacity: 0.7;
}
#icon5:hover{
  opacity: 0.7;
}
#icon6:hover{
  opacity: 0.7;
}
#icon7:hover{
  opacity: 0.7;
}
#icon8:hover{
  opacity: 0.7;
}
#iconlist{
  margin-left: -80px;
}
#iconlist > li {
        display: inline-block;
        position: relative;
        top: 10px;
        left: 1px;
      }
      #iconlist > li > a {
        display:block; position:relative; padding-bottom:19px;
        margin-top: 20px;
        margin-right: 20px;
        margin-bottom: 20px;
        margin-left: 20px;
        font-weight: bold;
      }
      #iconlist > li > a > img {
        width:80px; height:80px;
        margin-left: 10px;
      }
      #iconlist > li > a > span {
        position:absolute; 
        bottom:0; 
        left:60%; 
        color:#666; 
        line-height:1.462em; 
        white-space:nowrap; 
        transform:translate(-50%, 0)
      }
      #icon1{
        margin-left: -200px;
      }
      .box1{
        margin-bottom: 15px;
      }
      .box1>img{
        height: auto;
        border-radius: 8px;
      }
      h3{
      margin-left: -1020px;
      }
  </style>
</head>
<body>
  <div class="slider">
    <input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <input type="radio" name="slide" id="slide3">
    <input type="radio" name="slide" id="slide4">
    <ul id="imgholder" class="imgs">
        <li><img src="img/back.jpg"></li>
        <li><img src="img/back1.jpg"></li>
        <li><img src="img/back2.jpg"></li>
        <li><img src="img/back3.jpg"></li>
    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
    </div>
</div>
<ul id="iconlist" style="width: 1920px">
  <li><a href="#"><img src="img/st1.png" id="icon1"><span>기획전</span></a></li>
  <li><a href="#"><img src="img/st2.png" id="icon2"><span>리퍼마켓</span></a></li>
  <li><a href="#"><img src="img/st3.png" id="icon3"><span>베스트</span></a></li>
  <li><a href="#"><img src="img/st4.png" id="icon4"><span>빠른배송</span></a></li>
  <li><a href="#"><img src="img/st5.png" id="icon5"><span>오!세일</span></a></li>
  <li><a href="#"><img src="img/st6.png" id="icon6"><span>오!쇼룸</span></a></li>
  <li><a href="#"><img src="img/st7.png" id="icon7"><span>오굿즈</span></a></li>
  <li><a href="#"><img src="img/st8.png" id="icon8"><span>오늘의딜</span></a></li>
  <li><a href="#"><img src="img/st9.png" id="icon9"><span>크리스마스</span></a></li>
  <li><a href="#"><img src="img/st10.png" id="icon10"><span>하루특가</span></a></li>
  </ul>
<br>
<h3>오늘의딜</h3>
<div class="box1">
  <img src="img/store1.jpg">
</div>
<div class="box2">
  <img src="img/store2.jpg">
</div>
</body>
</html>