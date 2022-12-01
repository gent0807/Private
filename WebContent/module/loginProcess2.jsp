<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.beans.RegisterDTO" id="regBean2" scope="session"/>
<jsp:setProperty name="regBean2" property="*"/>
<jsp:useBean class="com.beans.RegisterDAO" id="regMgr3" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<%	
		session.setAttribute("userModeId", regBean2.getMemberid());
		String contentPage=null;
		String check=regMgr3.check(regBean2);
		if(check.equals("ALLOK")){
			session.setAttribute("SEGMENT", "secondSegment.jsp");//
			session.setAttribute("PADDING","padding-right:640px");
			session.setAttribute("PADDINGSUB","padding-right:595px");
			session.setAttribute("PADDINGSUB2","padding-right:635px");
			
			String fixSector=(String)session.getAttribute("fixSector");
			String fixSectorSub=(String)session.getAttribute("fixSectorSub");
			String product=(String)session.getAttribute("product");
			String fixCategory=(String)session.getAttribute("fixCategory");
			
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
				session.setAttribute("idCheckVisible", "visibility:hidden");
				session.setAttribute("passwordCheckVisible", "visibility:hidden");
				session.setAttribute("loginCheck","ok");
				session.setAttribute("loginid",regBean2.getMemberid());
				
			}
			if(regBean2.getMemberid().equals("tldbstjq95@naver.com")){
				session.setAttribute("img","manager.png");
			}
			else{
				session.setAttribute("img","user.png");
			}
			response.sendRedirect("../privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory);
		
		}
		else if(check.equals("IDOK")){
			session.setAttribute("idCheckVisible", "visibility:hidden");
			session.setAttribute("passwordCheckVisible", "visibility:visible");	
			contentPage="login.jsp";
			response.sendRedirect("../privateHome.jsp?CONTENTPAGE="+contentPage+"&FOOTERIS='display:none'");
		
			
		}
		else if(check.equals("NOTOK")){
			session.setAttribute("idCheckVisible", "visibility:visible");
			session.setAttribute("passwordCheckVisible", "visibility:hidden");	
			contentPage="login.jsp";
			response.sendRedirect("../privateHome.jsp?CONTENTPAGE="+contentPage+"&FOOTERIS='display:none'");
		
		}
		
	%>
</body>
</html>