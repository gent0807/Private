<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport"  %>
<%@ page import="javax.mail.Message"  %>
<%@ page import="javax.mail.Address"  %>
<%@ page import="javax.mail.internet.InternetAddress"  %>
<%@ page import="javax.mail.internet.MimeMessage"  %>
<%@ page import="java.util.Properties"%>
<%@ page import="com.beans.SHA256" %>
<%@ page import="com.beans.Gmail" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.beans.RegisterDTO" %>
<%@ page import="com.beans.RegisterDAO" %>
<%	
	request.setCharacterEncoding("utf-8");
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
		content="비밀번호는 "+rd.findUserPassword(to)+"입니다.";
		contentPage="longin.jsp";
	}
	else if(findmode.equals("expert")){
		subject = "전문가 계정 비밀번호 찾기를 위한 인증메일입니다.";
		content="전문가 계정 비밀번호는 "+rd.findExpertPassword(to)+"입니다.";
		contentPage="expertLongin.jsp";
	}
	else if(findmode.equals("producer")){
		subject = "판매자 계정 비밀번호 찾기를 위한 인증메일입니다.";
		content="판매자 계정 비밀번호는 "+rd.findProducerPassword(to)+"입니다.";
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
		Address fromAddr=new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr=new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('해당 이메일로 비밀번호가 전송되었습니다. 확인 후 로그인 하십시오.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}catch(Exception e){
		e.printStackTrace();
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
   
</body>
</html>