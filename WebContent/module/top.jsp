<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String segment=(String)session.getAttribute("SEGMENT");
	if(segment==null){
		segment="firstSegment.jsp";
	}
	
	String padding=(String)session.getAttribute("PADDING");
	if(padding==null){
		padding="padding-right:550px";
	}
	
	String paddingSub=(String)session.getAttribute("PADDINGSUB");
	if(paddingSub==null){
		paddingSub="padding-right:512px";
	}
	
	String paddingSub2=(String)session.getAttribute("PADDINGSUB2");
	if(paddingSub2==null){
		paddingSub2="padding-right:552px";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	a {
		text-decoration: none;
		color:black;
		font-weight: bold;
	}
	.subMenu:hover{
		color:#760c0c;
	}
	
</style>
<title>Private</title>
</head>
<body>
<div id="topbox">
	<br>
	<div style="vertical-align:top;">
		<a href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome"><img alt="Private" height="40" src="img/logo.PNG" style="vertical-align:top;"></a>&nbsp;&nbsp;&nbsp;
		<a id="community" href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome" style="font-size:1.2em;vertical-align:middle;">커뮤니티</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="store" href="privateHome.jsp?CONTENTPAGE=store.jsp&FIXSECTOR=store&FIXSECTORSUB=storeHome" style="font-size:1.2em;vertical-align:middle;">스토어</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="service" href="privateHome.jsp?CONTENTPAGE=produce.jsp&FIXSECTOR=service&FIXSECTORSUB=serviceHome" style="font-size:1.2em;vertical-align:middle;">이사/시공/수리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<jsp:include page="search.jsp"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<jsp:include page='<%="rightAccountOption/" + segment %>' flush="false"/>
	</div>
	<br>
	<hr style="border : solid 1px #760c0c;">
	<nav id="nav" style=<%=padding %>>
	<div id="communityMenu">
  		<a class="subMenu" id="communityHome" href="privateHome.jsp?CONTENTPAGE=community.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHome&SECTOR=community" style="font-size:1.0em;">홈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="communityFollowing" href="privateHome.jsp?CONTENTPAGE=communityFollowing.jsp&FIXSECTOR=community&FIXSECTORSUB=communityFollowing&SECTOR=community" style="font-size:1.0em;">팔로잉</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="communityPicture" href="privateHome.jsp?CONTENTPAGE=communityPicture.jsp&FIXSECTOR=community&FIXSECTORSUB=communityPicture&SECTOR=community" style="font-size:1.0em;">사진</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="communityHouseVisit" href="privateHome.jsp?CONTENTPAGE=communityHouseVisit.jsp&FIXSECTOR=community&FIXSECTORSUB=communityHouseVisit&SECTOR=community" style="font-size:1.0em;">집들이</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="communityKnowHow" href="privateHome.jsp?CONTENTPAGE=communityKnowHow.jsp&FIXSECTOR=community&FIXSECTORSUB=communityKnowHow&SECTOR=community" style="font-size:1.0em;">노하우</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="communityQNA" href="privateHome.jsp?CONTENTPAGE=communityQNA.jsp&FIXSECTOR=community&FIXSECTORSUB=communityQNA&SECTOR=community" style="font-size:1.0em;">질문과 답변</a>&nbsp;&nbsp;&nbsp;&nbsp;
  	</div>
  	<div id="storeMenu" style="padding-left:86px">
  		<a class="subMenu" id="storeHome" href="privateHome.jsp?CONTENTPAGE=store.jsp&FIXSECTOR=store&FIXSECTORSUB=storeHome&SECTOR=store" style="font-size:1.0em;">스토어홈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="storeCategory" href="privateHome.jsp?CONTENTPAGE=storeCategory.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=furniture" style="font-size:1.0em;">카테고리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="storeBest" href="privateHome.jsp?CONTENTPAGE=storeBest.jsp&FIXSECTOR=store&FIXSECTORSUB=storeBest&SECTOR=store" style="font-size:1.0em;">베스트</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="storeTodayDeal" href="privateHome.jsp?CONTENTPAGE=storeTodayDeal.jsp&FIXSECTOR=store&FIXSECTORSUB=storeTodayDeal&SECTOR=store" style="font-size:1.0em;">오늘의딜</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="storeReaper" href="privateHome.jsp?CONTENTPAGE=storeReaper.jsp&FIXSECTOR=store&FIXSECTORSUB=storeReaper&SECTOR=store" style="font-size:1.0em;">리퍼마켓</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="storeUsed" href="privateHome.jsp?CONTENTPAGE=storeUsed.jsp&FIXSECTOR=store&FIXSECTORSUB=storeUsed&SECTOR=store" style="font-size:1.0em;">중고마켓</a>&nbsp;&nbsp;&nbsp;&nbsp;
  	</div>
  	<div id="serviceMenu" style="padding-right:134px">
  		<a class="subMenu" id="serviceHome" href="privateHome.jsp?CONTENTPAGE=produce.jsp&FIXSECTOR=service&FIXSECTORSUB=serviceHome&SECTOR=service" style="font-size:1.0em;">홈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="serviceMove" href="privateHome.jsp?CONTENTPAGE=produceMove.jsp&FIXSECTOR=service&FIXSECTORSUB=serviceMove&SECTOR=service" style="font-size:1.0em;">이사</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="serviceConst" href="privateHome.jsp?CONTENTPAGE=produceConst.jsp&FIXSECTOR=service&FIXSECTORSUB=serviceConst&SECTOR=service" style="font-size:1.0em;">인테리어시공</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a class="subMenu" id="serviceInstallRepair" href="privateHome.jsp?CONTENTPAGE=produceInstallRepair.jsp&FIXSECTOR=service&FIXSECTORSUB=serviceInstallRepair&SECTOR=service" style="font-size:1.0em;">설치수리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	</div>  	
  	</nav>
  	<hr id="hr" style="border : solid 1px #760c0c; ">
  	<div id="storeCategoryMenuImage" style=<%=paddingSub2 %>>
  		<a id="furniture" href="privateHome.jsp?CONTENTPAGE=storeCategoryFurniture.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=furniture&FIXCATEGORY=furniture"><img alt="furniture" width=65" height="60" src="img/furniture.png" style="vertical-align:middle;"></a>&nbsp;
  		<a id="fabric" href="privateHome.jsp?CONTENTPAGE=storeCategoryFabric.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=fabric&FIXCATEGORY=fabric"><img alt="fabric" width="65" height="60" src="img/fabric.png" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;
  		<a id="digital" href="privateHome.jsp?CONTENTPAGE=storeCategoryDigitalDevice.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=digital&FIXCATEGORY=digital"><img alt="digital" width="65" height="60" src="img/digital1.png" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;
  		<a id="light" href="privateHome.jsp?CONTENTPAGE=storeCategoryLighting.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=light&FIXCATEGORY=light"><img alt="light" width="65" height="60" src="img/light.png" style="vertical-align:middle;"></a>&nbsp;&nbsp;
  		<a id="accept" href="privateHome.jsp?CONTENTPAGE=storeCategoryAcceptance.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=acceptance&FIXCATEGORY=acceptance"><img alt="accept" width="65" height="60" src="img/accept.png" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a id="kitchen" href="privateHome.jsp?CONTENTPAGE=storeCategoryKitchen.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=kitchen&FIXCATEGORY=kitchen"><img alt="kitchen" width="65" height="60" src="img/kitchen1.png" style="vertical-align:middle;"></a>	
  	</div>  	
  	<div id="storeCategoryMenu" style=<%=paddingSub %>>
  		<a id="storeCategoryFurniture" href="privateHome.jsp?CONTENTPAGE=storeCategoryFurniture.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=furniture&FIXCATEGORY=furniture" style="font-size:1.0em;">가구</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a id="storeCategoryFabric" href="privateHome.jsp?CONTENTPAGE=storeCategoryFabric.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=fabric&FIXCATEGORY=fabric" style="font-size:1.0em;">패브릭</a>&nbsp;&nbsp;&nbsp;
  		<a id="storeCategoryDigital" href="privateHome.jsp?CONTENTPAGE=storeCategoryDigitalDevice.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=digital&FIXCATEGORY=digital" style="font-size:1.0em;">가전/디지털</a>&nbsp;&nbsp;&nbsp;&nbsp;
  		<a id="storeCategoryLight" href="privateHome.jsp?CONTENTPAGE=storeCategoryLighting.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=light&FIXCATEGORY=light" style="font-size:1.0em;">조명</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a id="storeCategoryAccept" href="privateHome.jsp?CONTENTPAGE=storeCategoryAcceptance.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=acceptance&FIXCATEGORY=acceptance" style="font-size:1.0em;">수납정리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<a id="storeCategoryKitchen" href="privateHome.jsp?CONTENTPAGE=storeCategoryKitchen.jsp&FIXSECTOR=store&FIXSECTORSUB=storeCategory&SECTOR=store&PRODUCT=kitchen&FIXCATEGORY=kitchen" style="font-size:1.0em;">주방용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
  	</div>  	
  	<hr id="line">  	
  	
</div>
  	
  	<script type="text/javascript">
  		let topbox=document.getElementById("topbox");
  		
  		let nav=document.getElementById("nav");
  		
  		let hr=document.getElementById("hr");
  		
  		let community=document.getElementById("community");
  		let communityMenu=document.getElementById("communityMenu");
  		let communityHome=document.getElementById("communityHome");
  		let communityFollowing=document.getElementById("communityFollowing");
  		let communityPicture=document.getElementById("communityPicture");
  		let communityHouseVisit=document.getElementById("communityHouseVisit");
  		let communityKnowHow=document.getElementById("communityKnowHow");
  		let communityQNA=document.getElementById("communityQNA");
  		
  		let store=document.getElementById("store");
  		let storeMenu=document.getElementById("storeMenu");
  		let storeHome=document.getElementById("storeHome");
  		let storeCategory=document.getElementById("storeCategory");
  		let storeBest=document.getElementById("storeBest");
  		let storeTodayDeal=document.getElementById("storeTodayDeal");
  		let storeReaper=document.getElementById("storeReaper");
  		let storeUsed=document.getElementById("storeUsed");
  		
  		let service=document.getElementById("service");
  		let serviceMenu=document.getElementById("serviceMenu");
  		let serviceHome=document.getElementById("serviceHome");
  		let serviceMove=document.getElementById("serviceMove");
  		let serviceConst=document.getElementById("serviceConst");
  		let serviceInstallRepair=document.getElementById("serviceInstallRepair");  		
  		
  		let storeCategoryMenuImage=document.getElementById("storeCategoryMenuImage");
  		let furniture=document.getElementById("furniture");
  		let fabric=document.getElementById("fabric");
  		let digital=document.getElementById("digital");
  		let light=document.getElementById("light");
  		let accept=document.getElementById("accept");
  		let kitchen=document.getElementById("kitchen");
  		
  		
  		let storeCategoryMenu=document.getElementById("storeCategoryMenu");
  		let storeCategoryFurniture=document.getElementById("storeCategoryFurniture");
  		let storeCategoryFabric=document.getElementById("storeCategoryFabric");
  		let storeCategoryDigital=document.getElementById("storeCategoryDigital");
  		let storeCategoryLight=document.getElementById("storeCategoryLight");
  		let storeCategoryAccept=document.getElementById("storeCategoryAccept");
  		let storeCategoryKitchen=document.getElementById("storeCategoryKitchen");
  		let line=document.getElementById("line");
  		
  		let sector='${sector}';
  		  		
  		let fixSector='${fixSector}';
  		  		
  		let fixSectorSub='${fixSectorSub}';
  		
  		let fixCategory='${fixCategory}';
  		
  		let menuBar='${menuBar}';
  		
  		
  		
  		if(menuBar=="exist"){
  		if(fixSector=="community"){
  			community.style.color="#760c0c";
  	  		communityMenu.style.display="block";
  	  		storeMenu.style.display="none";
  	  		serviceMenu.style.display="none";
  	  		storeCategoryMenuImage.style.display="none";
  	  		storeCategoryMenu.style.display="none";
  	  		line.style.visibility="hidden";
  			
  			if(fixSectorSub=="communityHome"){
				communityHome.style.color="#C62828";
			}
  		
			if(fixSectorSub=="communityFollowing"){
				communityFollowing.style.color="#C62828";
			}
		
			if(fixSectorSub=="communityPicture"){
				communityPicture.style.color="#C62828";
			}
		
			if(fixSectorSub=="communityHouseVisit"){
				communityHouseVisit.style.color="#C62828";
			}
		
			if(fixSectorSub=="communityKnowHow"){
				communityKnowHow.style.color="#C62828";
			}
		
			if(fixSectorSub=="communityQNA"){
				communityQNA.style.color="#C62828";
			}
						
			sector="community";
  		}
  		
  		if(fixSector=="store"){
  			store.style.color="#760c0c";
  	  		communityMenu.style.display="none";
  	  		storeMenu.style.display="block";
  	  		storeCategoryMenuImage.style.display="none";
  	  		serviceMenu.style.display="none";
  	  		storeCategoryMenu.style.display="none";
  	  		line.style.visibility="hidden";
  	  	
  			if(fixSectorSub=="storeHome"){
				storeHome.style.color="#C62828";
			}
  		
			if(fixSectorSub=="storeCategory"){
				storeCategory.style.color="#C62828";
				if(fixCategory=="furniture"){
					storeCategoryFurniture.style.color="#C62828";
				}
				if(fixCategory=="fabric"){
					storeCategoryFabric.style.color="#C62828";
				}
				if(fixCategory=="digital"){
					storeCategoryDigital.style.color="#C62828";
				}
				if(fixCategory=="light"){
					storeCategoryLight.style.color="#C62828";
				}
				if(fixCategory=="acceptance"){
					storeCategoryAccept.style.color="#C62828";
				}
				if(fixCategory=="kitchen"){
					storeCategoryKitchen.style.color="#C62828";
				}
			}
		
			if(fixSectorSub=="storeBest"){
				storeBest.style.color="#C62828";
			}
		
			if(fixSectorSub=="storeTodayDeal"){
				storeTodayDeal.style.color="#C62828";
			}
		
			if(fixSectorSub=="storeReaper"){
				storeReaper.style.color="#C62828";
			}
		
			if(fixSectorSub=="storeUsed"){
				storeUsed.style.color="#C62828";
			}
			
			sector="store";
  		}
  		
  		if(fixSector=="service"){
  			service.style.color="#760c0c";
  	  		communityMenu.style.display="none";
  	  		storeMenu.style.display="none";
  	  		serviceMenu.style.display="block";
  	  		storeCategoryMenuImage.style.display="none";
  	  		storeCategoryMenu.style.display="none";
  	  		line.style.visibility="hidden";
  	  		
  			if(fixSectorSub=="serviceHome"){
				serviceHome.style.color="#C62828";
			}
  		
			if(fixSectorSub=="serviceMove"){
				serviceMove.style.color="#C62828";
			}
		
			if(fixSectorSub=="serviceConst"){
				serviceConst.style.color="#C62828";
			}
		
			if(fixSectorSub=="serviceInstallRepair"){
				serviceInstallRepair.style.color="#C62828";
			}
			
			sector="service";	
  		}
  		community.addEventListener("mouseover",function(){
  			if(fixSector=="store"){
  				if(sector=="service"){
  					service.style.color="black";
  					serviceMenu.style.display="none";
  				}
  				else if(sector=="store"){
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  					line.style.visibility="hidden";
  				}
  			}  			
  			else if(fixSector=="service"){
  				if(sector=="service"){
  					serviceMenu.style.display="none";
  				}
  				else if(sector=="store"){
  					store.style.color="black";
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  					line.style.visibility="hidden";
  				}
  			}
  			else if(fixSector=="community"){
  				if(sector=="service"){
  					service.style.color="black";
  					serviceMenu.style.display="none";
  				}
  				else if(sector=="store"){
  					store.style.color="black";
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  					line.style.visibility="hidden";
  				}
  			}
  			community.style.color="#760c0c";
  			communityMenu.style.display="block";
  			sector="community";
  		})
  		
  		store.addEventListener("mouseover",function(){
  			if(fixSector=="community"){
  				if(sector=="service"){
  					service.style.color="black";
  					serviceMenu.style.display="none";
  				}
  				else if(sector=="community"){
  					communityMenu.style.display="none";
  				}
  			}  			
  			else if(fixSector=="service"){
  				if(sector=="service"){
  					serviceMenu.style.display="none";
  				}
  				else if(sector=="community"){
  					community.style.color="black";
  					communityMenu.style.display="none";
  				}
  			}
  			else if(fixSector=="store"){
  				if(sector=="community"){
  					community.style.color="black";
  					communityMenu.style.display="none";
  				}
  				else if(sector=="service"){
  					service.style.color="black";
  					serviceMenu.style.display="none";
  				}
  			}
  			store.style.color="#760c0c";
  			storeMenu.style.display="block";
  			storeCategoryMenuImage.style.display="none";
  			storeCategoryMenu.style.display="none";
  			line.style.visibility="hidden";
  			sector="store";
  		})
  		
  		service.addEventListener("mouseover",function(){
  			if(fixSector=="community"){
  				if(sector=="store"){
  					store.style.color="black";
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  					line.style.visibility="hidden";
  				}
  				else if(sector=="community"){
  					communityMenu.style.display="none";
  				}
  			}  			
  			else if(fixSector=="store"){
  				if(sector=="store"){
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  					line.style.visibility="hidden";
  				}
  				else if(sector=="community"){
  					community.style.color="black";
  					communityMenu.style.display="none";
  				}
  			}
  			else if(fixSector=="service"){
  				if(sector=="store"){
  					store.style.color="black";
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  					line.style.visibility="hidden";
  				}
  				else if(sector=="community"){
  					community.style.color="black";
  					communityMenu.style.display="none";
  				}
  			}
  			service.style.color="#760c0c";
  			serviceMenu.style.display="block";
  			sector="service";
  		})
  		
  		storeCategory.addEventListener("mouseover",function(){
  			storeCategoryMenuImage.style.display="block";
  			storeCategoryMenu.style.display="block";
  			line.style.visibility="visible";
  		}) 
  		
  		storeHome.addEventListener("mouseover",function(){
  			storeCategoryMenuImage.style.display="none";
  			storeCategoryMenu.style.display="none";
  			line.style.visibility="hidden";
  		}) 
  		
  		storeBest.addEventListener("mouseover",function(){
  			storeCategoryMenuImage.style.display="none";
  			storeCategoryMenu.style.display="none";
  			line.style.visibility="hidden";
  		}) 
  		
  		storeTodayDeal.addEventListener("mouseover",function(){
  			storeCategoryMenuImage.style.display="none";
  			storeCategoryMenu.style.display="none";
  			line.style.visibility="hidden";
  		}) 
  		
  		storeReaper.addEventListener("mouseover",function(){
  			storeCategoryMenuImage.style.display="none";
  			storeCategoryMenu.style.display="none";
  			line.style.visibility="hidden";
  		}) 
  		
  		storeUsed.addEventListener("mouseover",function(){
  			storeCategoryMenuImage.style.display="none";
  			storeCategoryMenu.style.display="none";
  			line.style.visibility="hidden";
  		})
  		
  		topbox.addEventListener("mouseleave",function(){
  			if(fixSector=="community"){
  				store.style.color="black";
  				storeMenu.style.display="none";
  				service.style.color="black";
  				serviceMenu.style.display="none";
  				storeCategoryMenuImage.style.display="none";
  				storeCategoryMenu.style.display="none";
  				line.style.visibility="hidden";
  				community.style.color="#760c0c";
  				communityMenu.style.display="block";
  				sector="community";
  				if(fixSectorSub=="communityHome"){
  					communityHome.style.color="#C62828";
  				}
  				else if(fixSectorSub=="communityFollowing"){
  					communityFollowing.style.color="#C62828";
  				}
  				else if(fixSectorSub=="communityPicture"){
  					communityPicture.style.color="#C62828";
  				}
  				else if(fixSectorSub=="communityHouseVisit"){
  					communityHouseVisit.style.color="#C62828";
  				}
  				else if(fixSectorSub=="communityKnowHow"){
  					communityKnowHow.style.color="#C62828";
  				}
  				else if(fixSectorSub=="communityQNA"){
  					communityQNA.style.color="#C62828";
  				}
  				
  			}
  			else if(fixSector=="store"){
  				community.style.color="black";
  				communityMenu.style.display="none";
  				service.style.color="black";
  				serviceMenu.style.display="none";
  				storeCategoryMenuImage.style.display="none";
  				storeCategoryMenu.style.display="none";
  				line.style.visibility="hidden";
  				store.style.color="#760c0c";
  				storeMenu.style.display="block";
  				sector="store";
  				if(fixSectorSub=="storeHome"){
  					storeHome.style.color="#C62828";
  				}
  				else if(fixSectorSub=="storeCategory"){
  					storeCategory.style.color="#C62828";
  				}
  				else if(fixSectorSub=="storeBest"){
  					storeBest.style.color="#C62828";
  				}
  				else if(fixSectorSub=="storeTodayDeal"){
  					storeTodayDeal.style.color="#C62828";
  				}
  				else if(fixSectorSub=="storeReaper"){
  					storeReaper.style.color="#C62828";
  				}
  				else if(fixSectorSub=="storeUsed"){
  					storeUsed.style.color="#C62828";
  				}
  				
  			}
  			else if(fixSector=="service"){
  				community.style.color="black";
  				communityMenu.style.display="none";
  				store.style.color="black";
  				storeMenu.style.display="none";
  				storeCategoryMenuImage.style.display="none";
  				storeCategoryMenu.style.display="none";
  				line.style.visibility="hidden";
  				service.style.color="#760c0c";
  				serviceMenu.style.display="block";
  				sector="service";
  				if(fixSectorSub=="serviceHome"){
  					serviceHome.style.color="#C62828";
  				}
  				else if(fixSectorSub=="serviceMove"){
  					serviceMove.style.color="#C62828";
  				}
  				else if(fixSectorSub=="serviceConst"){
  					serviceConst.style.color="#C62828";
  				}
  				else if(fixSectorSub=="serviceInstallRepair"){
  					serviceInstallRepair.style.color="#C62828";
  				}
  				
  				
  			}
  		})
  		
  		furniture.addEventListener("mouseover",function(){
  	  		if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="#760c0c";
  	  		}
			})
			
		furniture.addEventListener("mouseleave",function(){
			if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="black";
			}
		})
			
		fabric.addEventListener("mouseover",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="#760c0c";
			}
			})
			
		fabric.addEventListener("mouseleave",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="black";
			}
		})
		digital.addEventListener("mouseover",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="#760c0c";
			}
			})
			
		digital.addEventListener("mouseleave",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="black";
			}
		})
		light.addEventListener("mouseover",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="#760c0c";
			}
			})
			
		light.addEventListener("mouseleave",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="black";
			}
		})
		accept.addEventListener("mouseover",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="#760c0c";
				}
			})
			
		accept.addEventListener("mouseleave",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="black";
			}
		})
		kitchen.addEventListener("mouseover",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="#760c0c";
			}
			})
			
		kitchen.addEventListener("mouseleave",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="black";
			}
		})
		
		storeCategoryFurniture.addEventListener("mouseover",function(){
  	  		if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="#760c0c";
  	  		}
			})
			
		storeCategoryFurniture.addEventListener("mouseleave",function(){
			if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="black";
			}
		})
			
		storeCategoryFabric.addEventListener("mouseover",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="#760c0c";
			}
			})
			
		storeCategoryFabric.addEventListener("mouseleave",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="black";
			}
		})
		storeCategoryDigital.addEventListener("mouseover",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="#760c0c";
			}
			})
			
		storeCategoryDigital.addEventListener("mouseleave",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="black";
			}
		})
		storeCategoryLight.addEventListener("mouseover",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="#760c0c";
			}
			})
			
		storeCategoryLight.addEventListener("mouseleave",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="black";
			}
		})
		storeCategoryAccept.addEventListener("mouseover",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="#760c0c";
				}
			})
			
		storeCategoryAccept.addEventListener("mouseleave",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="black";
			}
		})
		storeCategoryKitchen.addEventListener("mouseover",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="#760c0c";
			}
			})
			
		storeCategoryKitechen.addEventListener("mouseleave",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="black";
			}
		})
  		}
  		else if(menuBar=="none"){
  			community.style.color="black";
  			store.style.color="black";
  			service.style.color="black";
  			communityMenu.style.display="none";
  			storeMenu.style.display="none";
  			serviceMenu.style.display="none";
  			hr.style.visibility="hidden";
  			storeCategoryMenuImage.style.display="none";
  			storeCategoryMenu.style.display="none";
  			line.style.visibility="hidden";
  			
  			community.addEventListener("mouseover",function(){
  				if(sector=="store"){
  					store.style.color="black";
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  				}
  				else if(sector=="service"){
  					service.style.color="black";
  					serviceMenu.style.display="none";
  				}
  				else if(sector=="community"){
  					community.style.color="#760c0c";
  					communityMenu.style.display="none";
  				}
  				community.style.color="#760c0c";
				communityMenu.style.display="block";
				hr.style.visibility="visible";
				line.style.visibility="hidden";
				sector="community";  				
  			})
  			
  			store.addEventListener("mouseover",function(){
  				if(sector=="community"){
  					community.style.color="black";
  					communityMenu.style.display="none";
  				}
  				else if(sector=="service"){
  					service.style.color="black";
  					serviceMenu.style.display="none";
  				}
  				else if(sector=="store"){
  					store.style.color="#760c0c";
  					storeMenu.style.display="block";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  				}
  				store.style.color="#760c0c";
				storeMenu.style.display="block";
				hr.style.visibility="visible";
				line.style.visibility="hidden";
				storeCategoryMenu.style.display="none";
  				sector="store";
  			})
  			
  			service.addEventListener("mouseover",function(){
  				if(sector=="store"){
  					store.style.color="black";
  					storeMenu.style.display="none";
  					storeCategoryMenuImage.style.display="none";
  					storeCategoryMenu.style.display="none";
  				}
  				else if(sector=="community"){
  					community.style.color="black";
  					communityMenu.style.display="none";
  				}
  				else if(sector=="service"){
  					service.style.color="#760c0c";
  					serviceMenu.style.display="none";
  				}
  				service.style.color="#760c0c";
				serviceMenu.style.display="block";
				hr.style.visibility="visible";
				line.style.visibility="hidden";
  				sector="service";
  			})
  			
  			storeCategory.addEventListener("mouseover",function(){
  				storeCategoryMenuImage.style.display="block";
  				storeCategoryMenu.style.display="block";
  				line.style.visibility="visible";
  			})
  			
  			storeHome.addEventListener("mouseover",function(){
  				storeCategoryMenuImage.style.display="none";
  	  			storeCategoryMenu.style.display="none";
  	  			line.style.visibility="hidden";
  	  		}) 
  	  		
  	  		storeBest.addEventListener("mouseover",function(){
  	  			storeCategoryMenuImage.style.display="none";
  	  			storeCategoryMenu.style.display="none";
  	  			line.style.visibility="hidden";
  	  		}) 
  	  		
  	  		storeTodayDeal.addEventListener("mouseover",function(){
  	  			storeCategoryMenuImage.style.display="none";
  	  			storeCategoryMenu.style.display="none";
  	  			line.style.visibility="hidden";
  	  		}) 
  	  		
  	  		storeReaper.addEventListener("mouseover",function(){
  	  			storeCategoryMenuImage.style.display="none";
  	  			storeCategoryMenu.style.display="none";
  	  			line.style.visibility="hidden";
  	  		}) 
  	  		
  	  		storeUsed.addEventListener("mouseover",function(){
  	  			storeCategoryMenuImage.style.display="none";
  	  			storeCategoryMenu.style.display="none";
  	  			line.style.visibility="hidden";
  	  		})
  	  		
  	  		topbox.addEventListener("mouseleave",function(){
  	  			community.style.color="black";
  	  			store.style.color="black";
  	  			service.style.color="black";
  	  			
  	  			communityMenu.style.display="none";
  				storeMenu.style.display="none";
  				serviceMenu.style.display="none";
  	  			hr.style.visibility="hidden";
  	  			
  	  			storeCategoryMenuImage.style.display="none";
  	  			storeCategoryMenu.style.display="none";
  	  			line.style.visibility="hidden";
  	  			
  	  		})
  	  		
  	  	furniture.addEventListener("mouseover",function(){
  	  		if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="#760c0c";
  	  		}
			})
			
		furniture.addEventListener("mouseleave",function(){
			if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="black";
			}
		})
			
		fabric.addEventListener("mouseover",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="#760c0c";
			}
			})
			
		fabric.addEventListener("mouseleave",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="black";
			}
		})
		digital.addEventListener("mouseover",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="#760c0c";
			}
			})
			
		digital.addEventListener("mouseleave",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="black";
			}
		})
		light.addEventListener("mouseover",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="#760c0c";
			}
			})
			
		light.addEventListener("mouseleave",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="black";
			}
		})
		accept.addEventListener("mouseover",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="#760c0c";
				}
			})
			
		accept.addEventListener("mouseleave",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="black";
			}
		})
		kitchen.addEventListener("mouseover",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="#760c0c";
			}
			})
			
		kitchen.addEventListener("mouseleave",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="black";
			}
		})
		
				storeCategoryFurniture.addEventListener("mouseover",function(){
  	  		if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="#760c0c";
  	  		}
			})
			
		storeCategoryFurniture.addEventListener("mouseleave",function(){
			if(fixCategory!="furniture"){
				storeCategoryFurniture.style.color="black";
			}
		})
			
		storeCategoryFabric.addEventListener("mouseover",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="#760c0c";
			}
			})
			
		storeCategoryFabric.addEventListener("mouseleave",function(){
			if(fixCategory!="fabric"){
				storeCategoryFabric.style.color="black";
			}
		})
		storeCategoryDigital.addEventListener("mouseover",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="#760c0c";
			}
			})
			
		storeCategoryDigital.addEventListener("mouseleave",function(){
			if(fixCategory!="digital"){
				storeCategoryDigital.style.color="black";
			}
		})
		storeCategoryLight.addEventListener("mouseover",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="#760c0c";
			}
			})
			
		storeCategoryLight.addEventListener("mouseleave",function(){
			if(fixCategory!="light"){
				storeCategoryLight.style.color="black";
			}
		})
		storeCategoryAccept.addEventListener("mouseover",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="#760c0c";
				}
			})
			
		storeCategoryAccept.addEventListener("mouseleave",function(){
			if(fixCategory!="acceptance"){
				storeCategoryAccept.style.color="black";
			}
		})
		storeCategoryKitchen.addEventListener("mouseover",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="#760c0c";
			}
			})
			
		storeCategoryKitechen.addEventListener("mouseleave",function(){
			if(fixCategory!="kitchen"){
				storeCategoryKitchen.style.color="black";
			}
		})
  	  		
  	  	
  		}
  		
  		
  		
  	</script>
</body>
</html>