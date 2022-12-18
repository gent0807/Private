package com.beans;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ViewDetailQ.do")
public class ViewDetailQController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ViewDetailQController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		WriteDAO wd=new WriteDAO();	
		String expertLoginCheck=(String)session.getAttribute("expertLoginCheck");
		String expertLoginid=(String)session.getAttribute("expertLoginid");
		String loginid=(String)session.getAttribute("loginid");
		String connectNick=null;
		if("ok".equals(expertLoginCheck)) {
			try {
				connectNick=wd.selectExpertNick(expertLoginid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				connectNick=wd.selectUserNick(loginid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		session.setAttribute("connectNick", connectNick);
		
		String idx=request.getParameter("idx");
		try {
			wd.updateVisitCount(idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WriteDTO wt=wd.selectQView(idx);
		wt.setContent(wt.getContent().replaceAll("\r\n", "<br/>"));
		
		request.setAttribute("wt", wt);
		request.getRequestDispatcher("privateHome.jsp?CONTENTPAGE=detailQuestion.jsp&FIXSECTOR=community&FIXSECTORSUB=communityQNA").forward(request, response);;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
