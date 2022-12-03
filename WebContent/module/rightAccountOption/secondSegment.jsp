<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String img=(String)session.getAttribute("img");
	if(img==null){
		img="user.png";
	}
	
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
	#user{
		background-repeat: no-repeat; 
		background-size: contain;
		border: none; 
		width:38px; 
		height:38px; 
		outline:none;
		vertical-align:middle;
		appearance:none;
	}
	
	#user:hover{
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
		color:white;
		
	}
	#writing:hover{
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
<body style="font-size:1.0em;">
	<a href="privateHome.jsp?CONTENTPAGE=bucket.jsp&MENUBAR=none" ><img alt="장바구니" src="img/cart.png" height="28" width="28" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="privateHome.jsp?CONTENTPAGE=scrapbook.jsp&MENUBAR=none"><img alt="스크랩북" src="img/scrapbook.png" height="36" width="36" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<div style="display:inline-block; position:relative; text-align:center; width:50px;">
		<button id="user" style="background-image: url(img/<%= img%>);" type="button"></button>
		<div id="userMode" style="display:none; position:absolute; z-index:999; width:230px; left:-85px;">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=myPage.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-top:5px; padding-bottom:5px; font-size:17px;">마이페이지</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=myShopping.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="padding-top:5px; padding-bottom:5px; font-size:17px;">나의 쇼핑</li></a>
				<hr>
				<a id="te" href="privateHome.jsp?CONTENTPAGE=transExpert.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>&FOOTERIS=display:none"><li style="padding-top:5px; padding-bottom:5px; font-size:17px;">전문가 신청하기</li></a>
				<hr id="teline">
				<a id="el" href="privateHome.jsp?CONTENTPAGE=expertLogin.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>&FOOTERIS=display:none"><li style="padding-top:5px; padding-bottom:5px; font-size:17px;">전문가 로그인</li></a>
				<hr id="elline">
				<a id="tp" href="privateHome.jsp?CONTENTPAGE=transProducer.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>&FOOTERIS=display:none"><li style="padding-top:5px; padding-bottom:5px; font-size:17px;">판매자 입점 신청하기</li></a>
				<hr id="tpline">
				<a id="pl" href="privateHome.jsp?CONTENTPAGE=producerLogin.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>&FOOTERIS=display:none"><li style="padding-top:5px; padding-bottom:5px; font-size:17px;">판매자 로그인</li></a>
				<hr id="plline">
				<a href="module/logoutProcess.jsp"><li style="margin-bottom:8px; padding-top:5px; padding-bottom:5px; font-size:17px;">로그아웃</li></a>
			</ul>
		</div>
		<div id="managerMode" style="display:none; position:absolute; z-index:999; width:230px; left:-85px;">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=managerPage.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">관리자 페이지</li></a>
				<hr>
				<a href="module/logoutProcess.jsp"><li style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;font-size:17px;">로그아웃</li></a>
			</ul>
		</div>
	</div>
	&nbsp;
	<div style="display:inline-block; position:relative; text-align:center;  width:87px;">
		<button id="writing" type="button">글쓰기▽</button>
		<div id="userWriting" style="display:none; position:absolute; z-index:999; width:250px; left:-78px; ">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=writeProductReview.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-left:12px;"><img src="img/writingIcon1-1.png" style="vertical-align:middle;">상품 리뷰 쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=writeProduceReview.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-left:12px;"><img src="img/writingIcon2-1.png" style="vertical-align:middle;">이사/시공 리뷰 쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadPicture.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon3.png" style="vertical-align:middle;">사진/동영상 올리기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadHouseVisit.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px"><img src="img/writingIcon4-1.png" style="vertical-align:middle;">집들이 글쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadKnowHow.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-top:8px; padding-left:12px;"><img src="img/writingIcon5-1.png" style="vertical-align:middle;">노하우 글쓰기</li></a>
				<hr>
				<a href="privateHome.jsp?CONTENTPAGE=uploadQ.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-bottom:8px; padding-left:12px;"><img src="img/writingIcon6-1.png" style="vertical-align:middle;">인테리어 질문하기</li></a>
			</ul>
		</div>
		<div id="managerWriting" style="display:none; position:absolute; z-index:999; width:250px; left:-85px;">
			<ul>
				<a href="privateHome.jsp?CONTENTPAGE=uploadAnnounce.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>"><li style="margin-bottom:8px; margin-top:8px; padding-left:12px;"><img src="img/announce1.jpg" style="vertical-align:middle; width:35px; height:34px;">&nbsp;게시판 공지 쓰기</li></a>
			</ul>
		</div>
	</div>	
	<script>
		let img='${img}';
		let expertIsin='${expertIsin}';
		let producerIsin='${producerIsin}';

		let mode=null;
		let btn1=document.getElementById("user");
		let btn2=document.getElementById("writing");
		let userModeList=document.getElementById("userMode");
		let managerModeList=document.getElementById("managerMode");
		let userWritingList=document.getElementById("userWriting");
		let managerWritingList=document.getElementById("managerWriting");
		let te=document.getElementById("te");
		let teline=document.getElementById("teline");
		let el=document.getElementById("el");
		let elline=document.getElementById("elline");
		let tp=document.getElementById("tp");
		let tpline=document.getElementById("tpline");
		let pl=document.getElementById("pl");
		let plline=document.getElementById("plline");
		
		let list1=document.getElementById("list1");
		let input1=document.getElementById("input1");
		
		
		if (img=="user.png"){
			mode="user";
		}
		else if(img=="manager.png"){
			mode="manager";
		}
		
	if(expertIsin=="YES"){
		te.style.display="none";
		teline.style.display="none";
		el.style.display="block";
		elline.style.display="block";
	}else if(expertIsin=="NO"){
		te.style.display="block";
		teline.style.display="block";
		el.style.display="none";
		elline.style.display="none";
	}
	
	if(producerIsin=="YES"){
		tp.style.display="none";
		tpline.style.display="none";
		pl.style.display="block";
		plline.style.display="block";
	}else if(producerIsin=="NO"){
		tp.style.display="block";
		tpline.style.display="block";
		pl.style.display="none";
		plline.style.display="none";
	}
	


		$(function () {
	        $("#user").on("click", function() {
	        	if(mode=="user"){	        		
	        		$("#userMode").slideToggle("fast");
	        	}
	        	else if(mode=="manager"){
	        		$("#managerMode").slideToggle("fast");
	        	}
	        	
	             
	        })
	    });
		
	    $(function () {
	        $("#writing").on("click", function() {
	        	if(mode=="user"){	        		
	        		$("#userWriting").slideToggle("fast");
	        	}
	        	else if(mode=="manager"){
	        		$("#managerWriting").slideToggle("fast");
	        	}
	        	
	             
	        })
	    });
	    
	   
	    
	    btn1.addEventListener("blur",function(){
	    	setTimeout(function(){
	    		userModeList.style.display="none";
		    	managerModeList.style.display="none";
	    	},0.2*1000);
	    });
		
		btn2.addEventListener("blur",function(){
			setTimeout(function(){
	    		userWritingList.style.display="none";
	    		managerWritingList.style.display="none";
			},0.2*1000);
	    });
	</script>
</body>
</html>