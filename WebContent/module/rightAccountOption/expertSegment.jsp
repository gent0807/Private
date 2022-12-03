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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	#expert{
		background-image: url(img/user.png);
		background-repeat: no-repeat; 
		background-size: contain;
		border: none; 
		width:38px; 
		height:38px; 
		outline:none;
		vertical-align:middle;
		appearance:none;
	}
	
	#expert:hover{
		border: solid 2px;
		border-radius: 50%;
		border-color:#760c0c;
	}
	
	#expertWriting{
		font-size:16px; 
		vertical-align:middle; 
		background-color:#A52A2A; 
		border-radius:7px; 
		border-color:#FFFAFA; 
		height:43px; 
		color:white;
		
	}
	#expertWriting:hover{
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
</head>
<body>
	<a href="privateHome.jsp?CONTENTPAGE=bucket.jsp&MENUBAR=none" ><img alt="장바구니" src="img/cart.png" height="28" width="28" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="privateHome.jsp?CONTENTPAGE=scrapbook.jsp&MENUBAR=none"><img alt="스크랩북" src="img/scrapbook.png" height="36" width="36" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<div style="display:inline-block; position:relative; text-align:center; width:50px;">
		<button id="expert" type="button"></button>
		<div id="expertMode" style="display:none; position:absolute; z-index:999; width:230px; left:-85px;">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=myPage.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">마이페이지</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=myShopping.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="padding-top:5px; padding-bottom:5px;font-size:17px;">나의 쇼핑</li></a>
				<hr>
				<a href="module/logoutProcess.jsp"><li style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">로그아웃</li></a>
			</ul>
		</div>
	</div>
	&nbsp;
	<div style="display:inline-block; position:relative; text-align:center;  width:87px;">
		<button id="expertWriting" type="button">글쓰기▽</button>
		<div id="expertWritingList" style="display:none; position:absolute; z-index:999; width:250px; left:-78px">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=writeProductReview.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon1.png" style="vertical-align:middle;">상품 리뷰 쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=writeProduceReview.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon2.png" style="vertical-align:middle;">이사/시공 리뷰 쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadPicture.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon3.png" style="vertical-align:middle;">&nbsp;사진/동영상 올리기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadHouseVisit.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon4.png" style="vertical-align:middle;">&nbsp;집들이 글쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadKnowHow.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon5.png" style="vertical-align:middle;">&nbsp;노하우 글쓰기</li></a>
			</ul>
		</div>
	</div>
	<script>
	let btn1=document.getElementById("expert");
	let btn2=document.getElementById("expertWriting");
	let expertModeList=document.getElementById("expertMode");
	let expertWritingList=document.getElementById("expertWritingList");
	
	$(function (){
        $("#expert").on("click", function() {
        	$("#expertMode").slideToggle("fast");       	
        });
        $("#expertWriting").on("click", function() {
    		$("#expertWritingList").slideToggle("fast");	
    	});
    });
	   
    btn1.addEventListener("blur",function(){
    	setTimeout(function(){
    		expertModeList.style.display="none";
    	},0.2*1000);
    });
	
	btn2.addEventListener("blur",function(){
		setTimeout(function(){
    		expertWritingList.style.display="none";
		},0.2*1000);
    });
	</script>
</body>
</html>