package com.beans;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;


@WebServlet("/insertQ.do")
public class insertQuestionController extends HttpServlet {
	
  

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String saveDirectory=request.getServletContext().getRealPath("/uploads");
		
		
		ServletContext application=getServletContext();
		int maxPostSize=Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr= FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		if(mr==null) {
			JSFunction.alertLocation(response,"첨부 파일이 제한 용량을 초과합니다.","insertQ.do");
			return;
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("saveDirectory",saveDirectory);
		String nick=null;
		String expertnick=null;
		
		String loginid=(String)session.getAttribute("loginid");
		String expertLoginCheck=(String)session.getAttribute("expertLoginCheck");
		String expertLoginid=null;
		if("ok".equals(expertLoginCheck)) {
			expertLoginid=(String)session.getAttribute("expertLoginid");
		}
		
		if(expertLoginid==null) {
			WriteDAO wa=new WriteDAO();
			try {
				nick=wa.selectUserNick(loginid);
				expertnick=null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		else if(expertLoginid!=null) {
			WriteDAO wa=new WriteDAO();
			try {
				nick=wa.selectUserNick(loginid);
				expertnick=wa.selectExpertNick(expertLoginid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			
		
		WriteDTO wt=new WriteDTO();
		wt.setTitle(mr.getParameter("title"));
		wt.setContent(mr.getParameter("content"));
		wt.setNick(nick);
		wt.setExpertnick(expertnick);
		
		String fileName=mr.getFilesystemName("ofile");
		if(fileName!=null) {
			String now=new SimpleDateFormat("yyyMMdd_HmsS").format(new Date());
			String ext=fileName.substring(fileName.lastIndexOf("."));
			String newFileName=now+ext;
			
			File oldFile=new File(saveDirectory+File.separator+fileName);
			File newFile=new File(saveDirectory+File.separator+newFileName);
			oldFile.renameTo(newFile);
			
			wt.setOfile(fileName);
			wt.setSfile(newFileName);
			
			
		
		}
		
		WriteDAO wa=new WriteDAO();
		try {
			wa.insertQuestion(wt);
			response.sendRedirect("WList.do?FIXSECTOR=community&FIXSECTORSUB=communityQNA&SECTOR=commnunity");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	}
	
	

}
