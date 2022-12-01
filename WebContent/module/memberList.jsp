<%@page import="com.beans.RegisterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<h1>회원목록 페이지입니다.</h1>
	<%	
	ArrayList<RegisterDTO> vList=(ArrayList<RegisterDTO>)session.getAttribute("vList");
	for(int j=0; j<vList.size() ; j++){
		RegisterDTO regBean=(RegisterDTO)vList.get(j);
		out.println( regBean.getMemberid()+ ",");
	    out.println( regBean.getPassword()+ ",");
	    out.println( regBean.getNickname()+ "<br>");
	}
%>
</body>
</html>