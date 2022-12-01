package com.beans;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login.do")
public class LoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String i=request.getParameter("memberid");
		String p=request.getParameter("password");
		String check=null;
		
		RegisterDTO rt=new RegisterDTO();
		rt.setMemberid(i);
		rt.setPassword(p);
		
		RegisterDAO rd=new RegisterDAO();
		try {
			check=rd.check(rt);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		session.setAttribute("userModeId", rt.getMemberid());
		String contentPage=null;
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
				session.setAttribute("loginid",rt.getMemberid());
				
			}
			if(rt.getMemberid().equals("tldbstjq95@naver.com")){
				session.setAttribute("img","manager.png");
			}
			else{
				session.setAttribute("img","user.png");
			}
			response.sendRedirect("privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory);
		
		}
		else if(check.equals("IDOK")){
			session.setAttribute("idCheckVisible", "visibility:hidden");
			session.setAttribute("passwordCheckVisible", "visibility:visible");	
			contentPage="login.jsp";
			response.sendRedirect("privateHome.jsp?CONTENTPAGE="+contentPage+"&FOOTERIS='display:none'");
		
			
		}
		else if(check.equals("NOTOK")){
			session.setAttribute("idCheckVisible", "visibility:visible");
			session.setAttribute("passwordCheckVisible", "visibility:hidden");	
			contentPage="login.jsp";
			response.sendRedirect("privateHome.jsp?CONTENTPAGE="+contentPage+"&FOOTERIS='display:none'");
		
		}
		
	}

}
