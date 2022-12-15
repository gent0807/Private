<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
<style>

#logo{
  width: 130px;
  height: 130px;
  padding-top: 13px;
  padding-right:900px;
  
}
#btn1{
  
  width: 120px;
  height: 40px;
  border-radius: 7px;
  border-color: #900020;
  background-color: white;
  color: #900020;
  font-weight: bold;
}

#btn2{
 
  width: 120px;
  height: 40px;
  border-radius: 7px;
  border-color: #900020;
  background-color: #900020;
  color: white;
  font-weight: bold;
}
#btn2:hover{
	background-color:#760c0c; 
}
.box2{
  margin-top: 30px;
  width:550px;
  background-color: white;
  border-style: solid;
  border-radius: 2px;
  border-color: black;

}
#text1{
  padding: 14px 0 0 28px;
  font-weight: bold;
  font-size: 14px;
  opacity: 0.8;
}
#li1{
  margin-left:30px;
  margin-bottom: 10px;
  font-size: 14px;
}
#li2{
  margin-left:30px;
  margin-bottom: 10px;
  font-size: 14px;
}
#li3{
  margin-left:30px;
  margin-bottom: 10px;
  font-size: 14px;
}
#li4{
  margin-left:30px;
  margin-bottom: 10px;
  font-size: 14px;
}
#span2{
  font-weight: bold;
  font-size: 14px;
  color: #900020;
}
.box3{ 
	display: flex; justify-content : center;
}
.fct{
  margin-top: 30px;
  width: 565px;
  height: 80px;
  border: none;
  font-size:25px;
}
.fct::placeholder {
  font-size: 28px;
  font-weight: 500;
  opacity: 0.6;
}
.fct2{
  margin-top: 50px;
  
  width: 565px;
  height: 80px;
  border: none;
}
.fct2::placeholder {
   font-size: 14px;
   font-weight: 600;
   opacity: 0.7   ;
}
#hr1{
   position: relative;
   width: 570px;
}
 
   </style>

</head>
<body>
   <div class="box1">
      <img src="img/daram.png" id="logo">
         <span class="span1">
         <input  id="btn2" type="button" value="작성 완료"></input>
      	 </span>
   </div>
   <hr>
   <div style="display: flex; justify-content : center;">
   <div class="box2">
      <p id="text1">🗒️ 질문과 답변 글 작성 가이드</p><br>
      <div class="box5" style="text-align:left;">
         <li id="li1">참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.</li>
         <li id="li2">욕설이나 비속어가 적힌 게시글은 경고 없이 삭제됩니다.</li>
         <li id="li3">인테리어와 관련 없는 질문은 숨김 및 삭제될 수 있습니다.</li>
         <li id="li4">상품/배송 등 쇼핑 관련 문의는 <span id="span2">고객센터</span>에서 요청해주세요.</li>
      </div>
   </div>
   </div>
   <div class="box3">
      <div class="box4">
         <form id="form" method="post" enctype="multipart/form-data" action="insertQ.do">      
         		<input type="text" class="fct" name="title" placeholder="제목을 입력해주세요." maxlength="50"><hr id="hr1">     		
                <textarea class="fct2" name="content" placeholder="내용을 입력해주세요." maxlength="2048" style="height: 450px;"></textarea>
                <div style="text-align:left">
                	<input  type="file" name="ofile">
                </div>
         </form>
      </div>
   </div>
   <script>
   let upload=document.getElementById("btn2");
   let form=document.getElementById("form");
   
   upload.addEventListener("click",function(){
	  if(form.title.value==""){
		  alert("제목을 입력하세요.");
	  } 
	  if(form.content.value==""){
		  alert("내용을 입력하세요.");
	  }
	  if(form.ofile.value==""){
		  alert("파일을 첨부하세요.");
	  }
	  if((form.title.value!="")&&(form.content.value!="")&&(form.ofile.value!="")){
		  form.submit();
	  }
   })
   </script>
	
</body>
</html>