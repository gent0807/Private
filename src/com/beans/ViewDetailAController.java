package com.beans;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ViewDetailA.do")
public class ViewDetailAController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ViewDetailAController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		WriteDAO wd=new WriteDAO();
		String idx=request.getParameter("idx");
		WriteDTO wt=wd.selectAView(idx);
		
		wt.setContent(wt.getContent().replaceAll("\r\n", "<br/>"));
		
		request.setAttribute("wt", wt);
		request.getRequestDispatcher("privateHome.jsp?CONTENTPAGE=detailAnnounce.jsp&FIXSECTOR=community&FIXSECTORSUB=communityQNA").forward(request, response);
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
