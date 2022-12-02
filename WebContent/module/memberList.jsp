<%@page import="com.beans.RegisterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body >
	<h1>회원목록 페이지입니다.</h1>
	<table>
	<c:forEach items="${vList}" var="memberList">
		<tr>
			<td>${memberList.memberid}</td>
			<td>${memberList.password}</td>
			<td>${memberList.nickname}</td>
		</tr>
	</c:forEach>
	</table>
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