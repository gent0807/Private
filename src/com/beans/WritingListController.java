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


@WebServlet("/WList.do")
public class WritingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WriteDAO wt=new WriteDAO();
		try {
			ArrayList<WriteDTO> qList= wt.selectQList();//***
			ArrayList<WriteDTO> aList= wt.selectAList();//***
			String fixSector=request.getParameter("FIXSECTOR");
			String fixSectorSub=request.getParameter("FIXSECTORSUB");
			String sector=request.getParameter("SECTOR");
			String contentPage="communityQNA.jsp";
			HttpSession session=request.getSession();
			session.setAttribute("qList", qList);	
			session.setAttribute("aList", aList);
			System.out.println("fdfsd");
			request.getRequestDispatcher("privateHome.jsp?CONTENTPAGE="+contentPage+"&MENUBAR=exist&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&SECTOR="+sector).forward(request,response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
