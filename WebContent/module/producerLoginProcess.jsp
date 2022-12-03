<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("SEGMENT", "producerSegment.jsp");
	session.setAttribute("PADDING","padding-right:700px");
	session.setAttribute("PADDINGSUB","padding-right:220px");
	session.setAttribute("PADDINGSUB2","padding-right:253px");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<%response.sendRedirect("../privateHome.jsp?CONTENTPAGE=community.jsp");%>
</body>
</html>