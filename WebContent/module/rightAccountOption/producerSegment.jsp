<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String fixSector=(String)session.getAttribute("fixSector");
	String fixSectorSub=(String)session.getAttribute("fixSectorSub");
	String product=(String)session.getAttribute("product");
	String fixCategory=(String)session.getAttribute("fixCategory");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
<style>
	#producer{
		background-image: url(img/producer.jpg); 
		background-repeat: no-repeat; 
		background-size: contain;
		border: none; 
		width:43px; 
		height:43px; 
		vertical-align:middle;
	}
	
	#producer:hover{
		border: solid 2px;
		border-radius: 50%;
		border-color:#760c0c;
	}
	
	#writing{
		font-size:16px; 
		vertical-align:middle; 
		background-color:#A52A2A; 
		border-radius:7px; 
		border-color:#FFFAFA; 
		height:43px; 
		color:white
	}
	
	#writing:hover{
		background-color:#760c0c; 
	}
	
	#register{
		font-size:16px; 
		vertical-align:middle; 
		background-color:#A52A2A; 
		border-radius:7px; 
		border-color:#FFFAFA; 
		height:43px; 
		color:white
	}
	
	#register:hover{
		background-color:#760c0c; 
	}
	
	ul {
		background:white;
		border:1px solid grey;
		box-shadow: 7px 5px 5px grey;
		list-style-type:none;
		text-align:left;
		padding-left:0px;
		border-radius:5px;
	}
	ul li{
		padding-left:7px;
		padding-right:7px;
	}
	
	ul li:hover{
		background:#E6E6FA;
	}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<a href="privateHome.jsp?CONTENTPAGE=scrapbook.jsp&MENUBAR=none"><img alt="스크랩북" src="img/scrapbook.png" height="36" width="36" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<div style="display:inline-block; position:relative; text-align:center; width:50px;">
		<button id="producer" type="button" ></button>
		<div id="producerMode" style="display:none; position:absolute; z-index:999; width:230px; left:-85px;">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=producerPage.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">판매자 페이지</li></a>
				<hr>
				<a href="module/logoutProcess.jsp"><li style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">로그아웃</li></a>
			</ul>
		</div>
	</div>
	&nbsp;&nbsp;
	<div style="display:inline-block; position:relative; text-align:center; width:87px;">
		<button id="writing" type="button">글쓰기▽</button>
		<div id="producerWriting" style="display:none; position:absolute; z-index:999; width:250px; left:-75px">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=uploadPicture.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon3.png" style="vertical-align:middle;">사진 올리기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadHouseVisit.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li><img src="img/writingIcon4.png" style="vertical-align:middle;">집들이 글쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadKnowHow.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-bottom:8px"><img src="img/writingIcon5.png" style="vertical-align:middle;">노하우 글쓰기</li></a>
			</ul>
		</div>
	</div>
	&nbsp;&nbsp;
	<div style="display:inline-block; position:relative; text-align:center; width:97px;">
		<button id="register" type="button">상품등록▽</button>
		<div id="registerWriting" style="display:none; position:absolute; z-index:999;width:230px; left:-70px;">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=uploadFurniture.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">가구 등록</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadDigital.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">가전 등록</li></a>
			</ul>
		</div>
	</div>
<script>
let btn1=document.getElementById("producer");
let btn2=document.getElementById("writing");
let btn3=document.getElementById("register");

let list1=document.getElementById("producerMode");
let list2=document.getElementById("producerWriting");
let list3=document.getElementById("registerWriting");


$(function () {
    $("#producer").on("click", function() {
    	$("#producerMode").slideToggle("fast");
    });
    $("#writing").on("click", function() {
    	$("#producerWriting").slideToggle("fast");
    });
    $("#register").on("click", function() {
    	$("#registerWriting").slideToggle("fast");
    });
});

btn1.addEventListener("blur",function(){
	setTimeout(function(){
		list1.style.display="none";
		list2.style.display="none";
		list3.style.display="none";
	},0.2*1000);
});

btn2.addEventListener("blur",function(){
	setTimeout(function(){
		list1.style.display="none";
		list2.style.display="none";
		list3.style.display="none";
	},0.2*1000);
});

btn3.addEventListener("blur",function(){
	setTimeout(function(){
		list1.style.display="none";
		list2.style.display="none";
		list3.style.display="none";
	},0.2*1000);
});
</script>
</body>
</html>