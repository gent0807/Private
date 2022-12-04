<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.setAttribute("SEGMENT", "firstSegment.jsp");
	session.setAttribute("PADDING","padding-right:550px");
	session.setAttribute("PADDINGSUB","padding-right:115px");
	session.setAttribute("PADDINGSUB2","padding-right:148px");
	session.setAttribute("idCheckVisible", "visibility:hidden");
	session.setAttribute("passwordCheckVisible", "visibility:hidden");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<%
		response.sendRedirect("../privateHome.jsp?CONTENTPAGE=community.jsp&SECTOR=community&FIXSECTOR=community&FIXSECTORSUB=communityHome&PRODUCT=furniture&MENUBAR=exist");
	%>
</body>
</html>