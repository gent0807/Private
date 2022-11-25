<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%> 	
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn=null;   
	Statement stmt=null;
	ArrayList<String> emails= new ArrayList<String>(); 
	ArrayList<String> nicknames= new ArrayList<String>(); 
	ArrayList<String> passwords= new ArrayList<String>(); 
	
	try{
		String jdbcDriver="jdbc:mysql://localhost:3306/privatedb?serverTimezone=UTC&useSSL=false&useUnicode=true&characterEncoding=utf-8";
		String dbUser="root";
		String dbPass="1234";
		conn=DriverManager.getConnection(jdbcDriver, dbUser, dbPass);//DB연결 (DB서버주소 /DB명, 계정, 비번 )
		stmt=conn.createStatement();//쿼리를 실행할 statement 객체 생성
		ResultSet rs=stmt.executeQuery("select * from membertbl;");
		while(rs.next()){
			emails.add(rs.getString("memberid"));	
			nicknames.add(rs.getString("nickname"));
			passwords.add(rs.getString("password"));
		}
		session.setAttribute("emails", emails);
		session.setAttribute("nicknames", nicknames);
	
	
	}catch(Exception e){
	
	}
	finally{
		conn.close();
		stmt.close();
	}
	request.setCharacterEncoding("utf-8");

	String contentPage=request.getParameter("CONTENTPAGE");
	if (contentPage==null){
		contentPage="community.jsp";
	}
	
	String sector=request.getParameter("SECTOR");
	if(sector==null){
		sector="community";
	}
	
	session.setAttribute("sector",sector);
	
	String fixSector=request.getParameter("FIXSECTOR");
	if(fixSector==null){
		fixSector="community";
	}
	
	session.setAttribute("fixSector",fixSector);
	
	String fixSectorSub=request.getParameter("FIXSECTORSUB");
	if(fixSectorSub==null){
		fixSectorSub="communityHome";
	}
	
	session.setAttribute("fixSectorSub",fixSectorSub);
	
	String product=request.getParameter("PRODUCT");
	if(product==null){
		product="furniture";
	}
	
	session.setAttribute("product",product);
	
	String fixCategory=request.getParameter("FIXCATEGORY");
	
	session.setAttribute("fixCategory", fixCategory);
	
	String menuBar=request.getParameter("MENUBAR");
	if(menuBar==null){
		menuBar="exist";
	}
	
	session.setAttribute("menuBar", menuBar);
	
	String footeris=request.getParameter("FOOTERIS");
	if(footeris==null){
		footeris="display:block";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	body{
		text-align:center;
	}
</style>
<title>Private</title>
<link rel="shortcut icon" href="img/daram.ico">
</head>
<body>
  		<header>
  			<jsp:include page="module/top.jsp" flush="false"/>
  		</header>
		<main>	
			<section>
				<jsp:include page='<%= "module/" + contentPage %>' flush="false"/>
			</section>		
		</main>
		<footer style=<%=footeris %>>
			<div style="background:#E6E6FA; padding-right:465px; height:250px;">
				동양미래대학교 컴퓨터소프트웨어공학과 20211033 신윤섭 20190778 안상현
			</div>		
		</footer>
</body>
</html>