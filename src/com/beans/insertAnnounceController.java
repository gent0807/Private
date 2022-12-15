package com.beans;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/insertAnnounce.do")
public class insertAnnounceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String loginid=null;
		String nick=null;
		
		WriteDTO wt=new WriteDTO();
		wt.setTitle(title);
		wt.setContent(content);
		
		HttpSession session=request.getSession();
		loginid=(String)session.getAttribute("loginid");		
		WriteDAO wd=new WriteDAO();
		try {
			nick=wd.selectUserNick(loginid);
			wt.setNick(nick);
			wd.insertAnnounce(wt);
			response.sendRedirect("WList.do?FIXSECTOR=community&FIXSECTORSUB=communityQNA&SECTOR=commnunity");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}

}
