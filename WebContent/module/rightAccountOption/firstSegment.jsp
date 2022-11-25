<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String fixSector=(String)session.getAttribute("fixSector");
	String fixSectorSub=(String)session.getAttribute("fixSectorSub");
	String product=(String)session.getAttribute("product");
	String fixCategory=(String)session.getAttribute("fixCategory");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	a {
		text-decoration: none;
		color:black;
	}
</style>
<title>Private</title>
</head>
<body>
	<a href="privateHome.jsp?CONTENTPAGE=bucket.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>" style="vertical-align:middle;"><img alt="장바구니" src="img/cart.png" height="28" width="28" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="privateHome.jsp?CONTENTPAGE=createAccount.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory %>&FOOTERIS=display:none" style="font-size:0.9em; ">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="privateHome.jsp?CONTENTPAGE=login.jsp&MENUBAR=none&FIXSECTOR=<%=fixSector %>&FIXSECTORSUB=<%=fixSectorSub %>&PRODUCT=<%=product %>&FIXCATEGORY=<%=fixCategory%>&FOOTERIS=display:none" style="font-size:0.9em; ">로그인</a>
</body>
</html>