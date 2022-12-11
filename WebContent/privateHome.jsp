<%@page import="com.beans.RegisterDTO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%> 	
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.beans.RegisterDTO" id="firstBowl" scope="session"/>
<jsp:useBean class="com.beans.RegisterDAO" id="firstConnect" scope="session"/>
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
<%	
	ArrayList<String> emails= new ArrayList<String>(); 
	ArrayList<String> expertEmails= new ArrayList<String>(); 
	ArrayList<String> producerEmails= new ArrayList<String>();
	ArrayList<String> producerStoreId= new ArrayList<String>();
	ArrayList<String> producerStoreName= new ArrayList<String>();
	
	ArrayList<String> reExpertEmails= new ArrayList<String>();
	ArrayList<String> reProducerEmails= new ArrayList<String>();
	ArrayList<String> reProducerStoreId= new ArrayList<String>();
	ArrayList<String> reProducerStoreName= new ArrayList<String>();
	ArrayList<String> nicknames= new ArrayList<String>(); 
	ArrayList<String> passwords= new ArrayList<String>(); 
	
	ArrayList<RegisterDTO> mList=new ArrayList<RegisterDTO>(); 
	ArrayList<RegisterDTO> eList=new ArrayList<RegisterDTO>(); 
	ArrayList<RegisterDTO> pList=new ArrayList<RegisterDTO>(); 
	ArrayList<RegisterDTO> reList=new ArrayList<RegisterDTO>(); 
	ArrayList<RegisterDTO> peList=new ArrayList<RegisterDTO>(); 
	
	mList=firstConnect.selectMemberList();
	eList=firstConnect.selectExpertList();
	pList=firstConnect.selectProducerList();
	reList=firstConnect.selectRExpertList();
	peList=firstConnect.selectRProducerList();
	
	for(int i=0; i<mList.size(); i++){
		emails.add(mList.get(i).getMemberid());
		nicknames.add(mList.get(i).getNickname());
	}
	
	for(int i=0; i<eList.size(); i++){
		expertEmails.add(eList.get(i).getMemberid());
	}
	
	for(int i=0; i<pList.size(); i++){
		producerEmails.add(pList.get(i).getMemberid());
		producerStoreId.add(pList.get(i).getStoreid());
		producerStoreName.add(pList.get(i).getStorename());
	}
	
	for(int i=0; i<reList.size(); i++){
		reExpertEmails.add(reList.get(i).getMemberid());
	}
	

	for(int i=0; i<peList.size(); i++){
		reProducerEmails.add(peList.get(i).getMemberid());
		reProducerStoreId.add(peList.get(i).getStoreid());
		reProducerStoreName.add(peList.get(i).getStorename());
	}
	
	session.setAttribute("emails", emails);
	
	session.setAttribute("reExpertEmails", reExpertEmails);
	session.setAttribute("reProducerEmails", reProducerEmails);
	session.setAttribute("reProducerStoreId", reProducerStoreId);
	session.setAttribute("reProducerStoreName",reProducerStoreName);
	
	
	session.setAttribute("expertEmails", expertEmails);
	session.setAttribute("producerEmails", producerEmails);
	session.setAttribute("producerStoreId", producerStoreId);
	session.setAttribute("producerStoreName",producerStoreName);
	
	session.setAttribute("nicknames", nicknames);
	
	
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
  		<header>
  			<jsp:include page="module/top.jsp" flush="false"/>
  		</header>
		<main>	
			<section>
				<jsp:include page='<%= "module/" + contentPage %>' flush="false"/>
			</section>		
		</main>
		<br>
		<br>
		<footer style=<%=footeris %>>
			<div style="background:#E6E6FA; padding-right:465px; height:250px;">
				<p>Copyright © 2022 Shin-Yoonseop, Ahn-Shanghyun All rights reserved.</p>
			</div>		
		</footer>
</body>
</html>