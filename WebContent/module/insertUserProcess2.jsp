<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.beans.RegisterDTO" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean class="com.beans.RegisterDAO" id="regMgr" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<%	
		regMgr.insertMember(regBean);
		session.setAttribute("SEGMENT", "secondSegment.jsp");
		session.setAttribute("img","user.png");
		session.setAttribute("PADDING","padding-right:640px");
		session.setAttribute("PADDINGSUB","padding-right:595px");
		session.setAttribute("PADDINGSUB2","padding-right:635px");
		String fixSector=(String)session.getAttribute("fixSector");
		String fixSectorSub=(String)session.getAttribute("fixSectorSub");
		String product=(String)session.getAttribute("product");
		String fixCategory=(String)session.getAttribute("fixCategory");
		String contentPage=null;
		
		if(fixSectorSub.equals("communityHome")){
			contentPage="community.jsp";
		}
		else if(fixSectorSub.equals("communityFollowing")){
			contentPage="communityFollowing.jsp";
		}
		else if(fixSectorSub.equals("communityPicture")){
			contentPage="communityPicture.jsp";
		}
		else if(fixSectorSub.equals("communityHouseVisit")){
			contentPage="communityHouseVisit.jsp";
		}
		else if(fixSectorSub.equals("communityKnowHow")){
			contentPage="communityKnowHow.jsp";
		}
		else if(fixSectorSub.equals("communityQNA")){
			contentPage="communityQNA.jsp";
		}
		else if(fixSectorSub.equals("storeHome")){
			contentPage="store.jsp";
		}
		else if(fixSectorSub.equals("storeBest")){
			contentPage="storeBest.jsp";
		}
		else if(fixSectorSub.equals("storeTodayDeal")){
			contentPage="storeTodayDeal.jsp";
		}
		else if(fixSectorSub.equals("storeReaper")){
			contentPage="storeReaper.jsp";
		}
		else if(fixSectorSub.equals("storeUsed")){
			contentPage="storeUsed.jsp";
		}
		else if(fixSectorSub.equals("serviceHome")){
			contentPage="produce.jsp";
		}
		else if(fixSectorSub.equals("serviceMove")){
			contentPage="produceMove.jsp";
		}
		else if(fixSectorSub.equals("serviceConst")){
			contentPage="produceConst.jsp";
		}
		else if(fixSectorSub.equals("serviceInstallRepair")){
			contentPage="produceInstallRepair.jsp";
		}
		else if(fixSectorSub.equals("storeCategory")){
			if(product.equals("furniture")){
				contentPage="storeCategoryFurniture.jsp";
			}
			else if(product.equals("fabric")){
				contentPage="storeCategoryFabric.jsp";
			}
			else if(product.equals("digital")){
				contentPage="storeCategoryDigitalDevice.jsp";
			}
			else if(product.equals("light")){
				contentPage="storeCategoryLighting.jsp";
			}
			else if(product.equals("kitchen")){
				contentPage="storeCategoryKitchen.jsp";
			}
			else if(product.equals("acceptance")){
				contentPage="storeCategoryAcceptance.jsp";
			}
			else if(product.equals("life")){
				contentPage="storeCategoryLife.jsp";
			}
			else if(product.equals("live")){
				contentPage="storeCategoryLive.jsp";
			}
			
		}
		response.sendRedirect("../privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory);
	%>
</body>
</html>