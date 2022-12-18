<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    img:hover{
      opacity: 0.6;
    }
    .box1{
      margin-top: 50px;
      margin-left: 785px;
    }
    #input1{
      width: 160px;
      height: 35px;
      border-radius: 8px;
      opacity: 0.8;
    }
    #input2{
      width: 160px;
      height: 35px;
      border-radius: 8px;
      opacity: 0.8;
    }
    .box2{
    margin-left: 390px;
  margin-top: 50px;
  width: 1136px;
  height: auto;
}
.box2>img{
  width: 365px;
  height: 258px;
  border-radius: 10px;
}

.box3{
  width: 1136px;
  height: 23px; 
  margin-top: 10px;
  margin-left: 390px;
  margin-bottom: 5px;
}
.box3>a{
  text-align: center;
  font-weight: bold;
  opacity: 0.8;
  font-size: 18px;
}
.box4{
  width: 1136px;
  height: 23px; 
  margin-left: 330px;
  margin-bottom: 20px;
}
.box5{
  margin-top: 30px;
  margin-left: 390px;
  width: 1136px;
  height: auto;
}
.box5>img{
  width: 365px;
  height: 258px;
  border-radius: 10px;
}
.box6{
  width: 1136px;
  height: 23px; 
  margin-top: 10px;
  margin-left: 390px;
}
.box6>a{
  text-align: center;
  font-weight: bold;
  opacity: 0.8;
  font-size: 18px;
}
.box7{
  width: 1136px;
  height: 23px; 
  margin-top: 5px;
  margin-left: 390px;
  margin-bottom: 30px;
}
.box8{
  margin-top: 30px;
  margin-left: 390px;
  width: 1136px;
  height: auto;
}
.box8>img{
  width: 365px;
  height: 258px;
  border-radius: 10px;
}
.box9{
  width: 1136px;
  height: 23px; 
  margin-top: 10px;
  margin-left: 390px;
}
.box9>a{
  text-align: center;
  font-weight: bold;
  opacity: 0.8;
  font-size: 18px;
}
.box10{
  width: 1136px;
  height: 23px; 
  margin-top: 5px;
  margin-left: 390px;
  margin-bottom: 110px;
}
#text1{
  margin-left: -61px;
  margin-right: 192px;
  letter-spacing: -1px;
}
#text2{
  margin-right: 239px;
  letter-spacing: -1px;
}
#text3{
  margin-right: 59px;
  letter-spacing: -1px;
}
#text4{
  margin-left: -90px;
  margin-right: 176px;
  letter-spacing: -1px;
}
#text5{
  margin-right: 117px;
  letter-spacing: -1px;
}
#text6{
  letter-spacing: -1px;
}
#text7{
  margin-left: -65px;
  margin-right: 159px;
  letter-spacing: -1px;
}
#text8{
  margin-right: 139px;
  letter-spacing: -1px;
}
#text9{
  margin-left: 2px;
  margin-right: 22px;
  letter-spacing: -1px;
}
#profile1{
  margin-left: -102px;
  width: 21px;
}
#profile1-1{
  margin-right: 270px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile2{
  width: 21px;
}
#profile2-1{
  margin-right: 280px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile3{
  width: 21px;
}
#profile3-1{
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile4{
  margin-left: 2px;
  width: 21px;
}
#profile4-1{
  margin-right: 250px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile5{
  width: 21px;
}
#profile5-1{
  margin-right: 283px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile6{
  width: 21px;
}
#profile6-1{
  margin-right: 207px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile7{
  margin-left: -60px;
  width: 21px;
}
#profile7-1{
  margin-right: 181px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile8{
  width: 21px;
}
#profile8-1{
  margin-right: 170px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
#profile9{
  width: 21px;
}
#profile9-1{
  margin-right: 92px;
  font-weight: bold;
  color: #f57eb6;
  letter-spacing: -1px;
}
  </style>
  <title>Document</title>
</head>
<body>  
  <h1>중고마켓 인기매물</h1>
  <div class="box1">
    <input id="input1" type="text" placeholder="지역을 입력하세요">
    <input id="input2" type="text" placeholder="동네를 입력하세요">
  </div>
  <div class="box2">
    <img src="img/used1.jpg">&nbsp&nbsp
    <img src="img/used2.jpg">&nbsp&nbsp
    <img src="img/used3.jpg">
  </div>
    <div class="box3">
    <a id="text1">&nbsp유희왕 카드 싸게 팝니다</a>
    <a id="text2">1년 쓴 칫솔 팝니다</a>
    <a id="text3">목욕탕에서 훔쳐온 수건 팝니다</a>
  </div>
    <div class="box4">
    <img src="img/profile1.png" id="profile1"><span id="profile1-1">&nbsp서울 구로구</span>
    <img src="img/profile2.png" id="profile2"><span id="profile2-1">&nbsp인천 연수구</span>
    <img src="img/profile4.png" id="profile3"><span id="profile3-1">&nbsp인천 남동구</span>
  </div>
   <div class="box5">
    <img src="img/used4.jpg">&nbsp&nbsp
    <img src="img/used5.jpg">&nbsp&nbsp
    <img src="img/used6.jpg">
  </div>
  <div class="box6">
    <a id="text4">&nbsp맘스터치에서 훔친 케찹 팜</a>
    <a id="text5">포켓몬 빵 띠부띠부씰x 빵만 팔아요</a>
    <a id="text6">여긴 좀도둑 밖에 없나요? 에반데</a>
  </div>
  <div class="box7">
    <img src="img/profile3.png" id="profile4"><span id="profile4-1">&nbsp사랑시 고백구</span>
    <img src="img/profile5.png" id="profile5"><span id="profile5-1">&nbsp서울시 강남구</span>
    <img src="img/profile6.png" id="profile6"><span id="profile6-1">&nbsp서울시 용산구</span>
  </div>
</body>
</html>