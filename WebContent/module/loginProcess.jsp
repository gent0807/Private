
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("utf-8");
	String memberid=request.getParameter("memberid");
	String password=request.getParameter("password");
	
	session.setAttribute("userModeId", memberid);
	
	ArrayList<String> idlist=new ArrayList<String>();
	ArrayList<String> plist=new ArrayList<String>();
	String contentPage=null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");//java.lang의 Class 클래스의 forName 메소드: 드라이버 메모리에 로딩, 커넥팅 로딩

	Connection conn=null;
	Statement stmt=null;

	try{
		String jdbcDriver="jdbc:mysql://localhost:3306/privatedb?serverTimezone=UTC&useSSL=false&useUnicode=true&characterEncoding=utf-8";
		String dbUser="root";
		String dbPass="loopholesub0807$&!";
		conn=DriverManager.getConnection( jdbcDriver, dbUser, dbPass);//DB연결 (DB서버주소 /DB명, 계정, 비번 )
		stmt=conn.createStatement();//쿼리를 실행할 statement 객체 생성
		ResultSet rs=stmt.executeQuery("select * from membertbl;");
		while(rs.next()){
			idlist.add(rs.getString("memberid"));
			plist.add(rs.getString("password"));
		}
		
		for(int i=0; i<idlist.size(); i++){
			if(memberid.equals(idlist.get(i))){
				if(password.equals(plist.get(i))){					
					session.setAttribute("SEGMENT", "secondSegment.jsp");//
					session.setAttribute("PADDING","padding-right:640px");
					session.setAttribute("PADDINGSUB","padding-right:595px");
					session.setAttribute("PADDINGSUB2","padding-right:635px");
					
					String fixSector=(String)session.getAttribute("fixSector");
					String fixSectorSub=(String)session.getAttribute("fixSectorSub");
					String product=(String)session.getAttribute("product");
					String fixCategory=(String)session.getAttribute("fixCategory");
					
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
						else if(product.equals("life")){
							contentPage="storeCategoryLife.jsp";
						}
						else if(product.equals("live")){
							contentPage="storeCategoryLive.jsp";
						}
						session.setAttribute("idCheckVisible", "visibility:hidden");
						session.setAttribute("passwordCheckVisible", "visibility:hidden");
						session.setAttribute("loginCheck","ok");
						session.setAttribute("loginid",memberid);
						
					}
					if(memberid.equals("tldbstjq95@naver.com")){
						session.setAttribute("img","manager.png");
					}
					else{
						session.setAttribute("img","user.png");
					}
					response.sendRedirect("../privateHome.jsp?CONTENTPAGE="+contentPage+"&FIXSECTOR="+fixSector+"&FIXSECTORSUB="+fixSectorSub+"&FIXCATEGORY="+fixCategory);
					break;
				}
				else{
					session.setAttribute("idCheckVisible", "visibility:hidden");
					session.setAttribute("passwordCheckVisible", "visibility:visible");	
					break;
				}
				
			 
			}
			
			session.setAttribute("idCheckVisible", "visibility:visible");
			session.setAttribute("passwordCheckVisible", "visibility:hidden");	
			
		}
		contentPage="login.jsp";
		response.sendRedirect("../privateHome.jsp?CONTENTPAGE="+contentPage+"&FOOTERIS='display:none'");

	}catch(Exception e){	

	}finally{
		conn.close();
		stmt.close();
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