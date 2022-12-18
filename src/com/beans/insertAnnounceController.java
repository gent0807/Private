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


@WebServlet("/insertAnnounce.do")
public class insertAnnounceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        

		String saveDirectory=request.getServletContext().getRealPath("/uploads");
		
		ServletContext application=getServletContext();
		int maxPostSize=Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr= FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		if(mr==null) {
			JSFunction.alertLocation(response,"첨부 파일이 제한 용량을 초과합니다.","insertA.do");
			return;
		}
		
		HttpSession session=request.getSession();
		String loginid=null;
		String nick=null;
		
		loginid=(String)session.getAttribute("loginid");		
		WriteDAO wd=new WriteDAO();
		try {
			nick=wd.selectUserNick(loginid);
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		WriteDTO wt=new WriteDTO();
		wt.setTitle(mr.getParameter("title"));
		wt.setContent(mr.getParameter("content"));
		wt.setNick(nick);

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
			wa.insertAnnounce(wt);
			response.sendRedirect("WList.do?FIXSECTOR=community&FIXSECTORSUB=communityQNA&SECTOR=commnunity");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
