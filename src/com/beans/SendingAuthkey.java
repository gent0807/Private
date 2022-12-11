package com.beans;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

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

import com.sun.istack.internal.logging.Logger;


@WebServlet("/SendingAuthkey")
public class SendingAuthkey extends HttpServlet {
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String host= "http://localhost:8000/Private4/";
		String from="theloopholesnk@gmail.com";
		String email=request.getParameter("email");
		String subject="회원가입을 위한 인증 메일입니다.";
		String content=null;
		
		Random random=new Random();
		int checkNum=random.nextInt(888888)+111111;
		content=Integer.toString(checkNum);
		
		
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
			InternetAddress toAddr=new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('Occured error.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
		
		
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		result.append("[{\"key\": \""+content+"\"}]");
		result.append("]}");
		response.getWriter().write(result.toString());
	}
	
	
}
