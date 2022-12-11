package com.beans;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/InsertProducer.do")
public class insertProducerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String memberidfront=request.getParameter("memberidfront");
		String memberidback=request.getParameter("memberidback");
		String memberidbackself=request.getParameter("memberidbackself");
		String password=request.getParameter("password");
		String storeid=request.getParameter("storeid");
		String storename=request.getParameter("storename");
		

		RegisterDTO rt=new RegisterDTO();
		rt.setMemberidfront(memberidfront);
		rt.setMemberidback(memberidback);
		rt.setMemberidbackself(memberidbackself);
		rt.setPassword(password);
		rt.setStoreid(storeid);
		rt.setStorename(storename);
		RegisterDAO rd=new RegisterDAO();
		try {
			rd.insertProducer(rt);//*******
		} catch (SQLException e) {
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		session.setAttribute("SEGMENT", "secondSegment.jsp");
		session.setAttribute("PADDING","padding-right:700px");
		session.setAttribute("PADDINGSUB","padding-right:220px");
		session.setAttribute("PADDINGSUB2","padding-right:253px");
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
			else if(product.equals("animal")){
				contentPage="storeCategoryAnimal.jsp";
			}
			else if(product.equals("health")){
				contentPage="storeCategoryHealth.jsp";
			}
			
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory);
		dispatcher.forward(request, response);
	}

}
