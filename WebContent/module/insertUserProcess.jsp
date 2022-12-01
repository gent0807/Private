<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	
	request.setCharacterEncoding("utf-8");
	
	String memberIdFront=request.getParameter("memberIdFront");
	String memberIdBack=request.getParameter("memberIdBack");
	String memberIdBackSelf=request.getParameter("memberIdBackSelf");
	String password=request.getParameter("password");
	String nickname=request.getParameter("nickname");
	String memberId=null;
	
	if(memberIdBack.equals("self")){
		memberId=memberIdFront+"@"+memberIdBackSelf;
	}
	else{
		memberId=memberIdFront+"@"+memberIdBack;
	}

	Class.forName("com.mysql.cj.jdbc.Driver");//java.lang의 Class 클래스의 forName 메소드: 드라이버 메모리에 로딩, 커넥팅 로딩

	Connection conn=null;
	PreparedStatement pstmt=null;

	try{
		session.setAttribute("SEGMENT", "secondSegment.jsp");
		String jdbcDriver="jdbc:mysql://localhost:3306/privatedb?serverTimezone=UTC&useSSL=false&useUnicode=true&characterEncoding=utf-8";
		String dbUser="root";
		String dbPass="loopholesub0807$&!";
		conn=DriverManager.getConnection( jdbcDriver, dbUser, dbPass);//DB연결 (DB서버주소 /DB명, 계정, 비번 )
		pstmt=conn.prepareStatement("insert into membertbl values(?, ?, ?);");//쿼리를 실행할 statement 객체 생성
		pstmt.setString(1, memberId);
		pstmt.setString(2, password);
		pstmt.setString(3, nickname);
		pstmt.executeUpdate();
		session.setAttribute("img","user.png");
	
	}catch(Exception e){
	
	}finally{
		conn.close();
		pstmt.close();
	}

	String fixSector=(String)session.getAttribute("fixSector");
	String fixSectorSub=(String)session.getAttribute("fixSectorSub");
	String product=(String)session.getAttribute("product");
	String fixCategory=(String)session.getAttribute("fixCategory");
	String contentPage=null;
	
	if(fixSectorSub.equals("communityHome")){
		contentPage="community.jsp";
	}
	else if(fixSectorSub.equals("communityFollowing")){
		contentPage="communityFollowing.jsp";
	}
	else if(fixSectorSub.equals("communityPicture")){
		contentPage="communityPicture.jsp";
	}
	else if(fixSectorSub.equals("communityHouseVisit")){
		contentPage="communityHouseVisit.jsp";
	}
	else if(fixSectorSub.equals("communityKnowHow")){
		contentPage="communityKnowHow.jsp";
	}
	else if(fixSectorSub.equals("communityQNA")){
		contentPage="communityQNA.jsp";
	}
	else if(fixSectorSub.equals("storeHome")){
		contentPage="store.jsp";
	}
	else if(fixSectorSub.equals("storeBest")){
		contentPage="storeBest.jsp";
	}
	else if(fixSectorSub.equals("storeTodayDeal")){
		contentPage="storeTodayDeal.jsp";
	}
	else if(fixSectorSub.equals("storeReaper")){
		contentPage="storeReaper.jsp";
	}
	else if(fixSectorSub.equals("storeUsed")){
		contentPage="storeUsed.jsp";
	}
	else if(fixSectorSub.equals("serviceHome")){
		contentPage="produce.jsp";
	}
	else if(fixSectorSub.equals("serviceMove")){
		contentPage="produceMove.jsp";
	}
	else if(fixSectorSub.equals("serviceConst")){
		contentPage="produceConst.jsp";
	}
	else if(fixSectorSub.equals("serviceInstallRepair")){
		contentPage="produceInstallRepair.jsp";
	}
	else if(fixSectorSub.equals("storeCategory")){
		if(product.equals("furniture")){
			contentPage="storeCategoryFurniture.jsp";
		}
		else if(product.equals("fabric")){
			contentPage="storeCategoryFabric.jsp";
		}
		else if(product.equals("digital")){
			contentPage="storeCategoryDigitalDevice.jsp";
		}
		else if(product.equals("light")){
			contentPage="storeCategoryLighting.jsp";
		}
		else if(product.equals("kitchen")){
			contentPage="storeCategoryKitchen.jsp";
		}
		else if(product.equals("acceptance")){
			contentPage="storeCategoryAcceptance.jsp";
		}
		
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<%response.sendRedirect("../privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory);%>
</body>
</html>