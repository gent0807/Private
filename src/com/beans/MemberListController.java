package com.beans;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/list.do")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisterDAO rd=new RegisterDAO();
		try {
			ArrayList<RegisterDTO> mList= rd.selectMemberList();
			HttpSession session=request.getSession();
			session.setAttribute("vList", mList);
			session.setAttribute("SEGMENT", "secondSegment.jsp");
			session.setAttribute("img","manager.png");
			String fixSector=(String)session.getAttribute("fixSector");
			String fixSectorSub=(String)session.getAttribute("fixSectorSub");
			String product=(String)session.getAttribute("product");
			String fixCategory=(String)session.getAttribute("fixCategory");
			String contentPage="memberList.jsp";
		
			request.getRequestDispatcher("privateHome.jsp?CONTENTPAGE="+contentPage+"&MENUBAR=none&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory).forward(request,response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
