package com.beans;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.jndi.cosnaming.IiopUrl.Address;

@WebServlet("/SendEmail.do")
public class SendEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String findmode=(String)session.getAttribute("findmode");
		String host= "http://localhost:8000/Private4/";
		String from="theloopholesnk@gmail.com";
		String to= request.getParameter("email");
		String subject=null;
		String content=null;
		String contentPage=null;
		RegisterDAO rd=new RegisterDAO();
		if(findmode.equals("user")){
			subject = "비밀번호 찾기를 위한 인증메일입니다.";
			try {
				content="안녕하세요! Private입니다. 고객님께서 요청하신 비밀번호를 보내드립니다. 고객님의 계정 비밀번호는 "+rd.findUserPassword(to)+"입니다. 보안을 위해 비밀번호 변경을 권장드립니다.";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			contentPage="longin.jsp";
		}
		else if(findmode.equals("expert")){
			subject = "전문가 계정 비밀번호 찾기를 위한 인증메일입니다.";
			try {
				content="안녕하세요! Private입니다. 고객님께서 요청하신 비밀번호를 보내드립니다. 고객님의 전문가 계정 비밀번호는 "+rd.findExpertPassword(to)+"입니다. 보안을 위해 비밀번호 변경을 권장드립니다.";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			contentPage="expertLongin.jsp";
		}
		else if(findmode.equals("producer")){
			subject = "판매자 계정 비밀번호 찾기를 위한 인증메일입니다.";
			try {
				content="안녕하세요! Private입니다. 고객님께서 요청하신 비밀번호를 보내드립니다. 고객님의 판매자 계정 비밀번호는 "+rd.findProducerPassword(to)+"입니다. 보안을 위해 비밀번호 변경을 권장드립니다.";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			contentPage="producerLongin.jsp";
		}
		
		Properties p= new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port","465");
		p.put("mail.smtp.starttls.enable", true);
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth=new Gmail();
			Session ses=Session.getInstance(p,auth);
			ses.setDebug(true);
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			InternetAddress fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			InternetAddress toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('We sent a password to your email account. Please check and login');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}catch(Exception e){
			e.printStackTrace();
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('Occured error.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		
		
		
	}
	
	

}
