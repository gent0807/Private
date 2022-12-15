package com.beans;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ExpertLogin.do")
public class ExpertLoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String i=request.getParameter("expertid");
		String p=request.getParameter("password");
		String expertCheck=null;
		
		RegisterDTO rt=new RegisterDTO();
		rt.setMemberid(i);
		rt.setPassword(p);
		
		RegisterDAO rd=new RegisterDAO();
		try {
			expertCheck=rd.expertCheck(rt);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		String contentPage=null;
		String fixSector=(String)session.getAttribute("fixSector");
		String fixSectorSub=(String)session.getAttribute("fixSectorSub");
		String product=(String)session.getAttribute("product");
		String fixCategory=(String)session.getAttribute("fixCategory");
		if(expertCheck.equals("ALLOK")){
			session.setAttribute("userModeId", rt.getMemberid());
			session.setAttribute("SEGMENT", "expertSegment.jsp");//
			session.setAttribute("PADDING","padding-right:640px");
			session.setAttribute("PADDINGSUB","padding-right:220px");
			session.setAttribute("PADDINGSUB2","padding-right:253px");
			
			
			
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
				else if(product.equals("animal")){
					contentPage="storeCategoryAnimal.jsp";
				}
				else if(product.equals("health")){
					contentPage="storeCategoryHealth.jsp";
				}
				
				
			}
			session.setAttribute("idCheckVisibleE", "visibility:hidden");
			session.setAttribute("passwordCheckVisibleE", "visibility:hidden");
			session.setAttribute("expertLoginCheck","ok");
			session.setAttribute("producerLoginCheck","no");
			session.setAttribute("expertLoginid",rt.getMemberid());
			if(contentPage.equals("communityQNA.jsp")) {
				response.sendRedirect("WList.do?FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory);
			}
			else {
				response.sendRedirect("privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory+"&PRODUCT="+product);
			}
		
		}
		else if(expertCheck.equals("IDOK")){
			session.setAttribute("idCheckVisibleE", "visibility:hidden");
			session.setAttribute("passwordCheckVisibleE", "visibility:visible");
			session.setAttribute("expertLoginCheck","no");
			contentPage="expertLogin.jsp";
			response.sendRedirect("privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory+"&PRODUCT="+product+"&FOOTERIS='display:none'");
		
			
		}
		else if(expertCheck.equals("NOTOK")){
			session.setAttribute("idCheckVisibleE", "visibility:visible");
			session.setAttribute("passwordCheckVisibleE", "visibility:hidden");	
			session.setAttribute("expertLoginCheck","no");
			contentPage="expertLogin.jsp";
			response.sendRedirect("privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory+"&PRODUCT="+product+"&FOOTERIS='display:none'");
		
		}
		
	}
}

