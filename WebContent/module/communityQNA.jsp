<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=(String)session.getAttribute("saveDirectory");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
 <style>
      .box{
       
         background-color: #f7f9fa;
      }
      .textarea{
         margin-top: 25px;
      }
      #t1{
         padding-top: 30px;
      }
      #t2{margin-top: -18px;
         margin-top: 23px;
         font-size: 14px;
      }
     #searchArea {
         margin-top: 17px;
       background-size: contain;
          background-repeat: no-repeat;
          border-radius: 4px;
        padding-left: 50px;
         border: 1px solid #d0d0ce;
        box-sizing: border-box;
        outline: none;
        position:relative;
         width:480px; 
         height:39px; 
         font-size:16px; 
         font-weight: bold; 
         vertical-align: middle;
         opacity: 0.5;
      }

     #searchArea:hover{
    background: #f7f9fa;
    color:black;
    }

      #sort{
         width: 140px;
         height: 40px;
         margin-top: 30px;
         margin-left: -35px;
         font-size: 16px;
         padding: 5px;
         border-radius: 5px;
         opacity: 0.5;
      }
		
      #sort:hover{
       background: #f7f9fa;
       }

      #btn1{
         margin-left: 470px;
         background-color: #900020;
         color: white;
         width: 90px;
         height: 40px;
         border-radius: 5px;
         border-color: white;
         font-size: 15px;
         font-weight: bold;
      }

      #btn1:hover{
    background: #760c0c;
    }
    .box3{
			display: flex; justify-content : center;
			text-align:left;
		}
	.box4{
			width: 830px;
			
	}
	.box4:hover{
			background: #f7f9fa;			
	}
	.box5:hover{
			background: #f7f9fa;
		}
	.box5{
			padding: 25px 0px 0px 0px;
			width: 830px;
		}
	#span1{
			
			font-weight: bold;
			color: black;
		}
	#pic1{
			position:absolute;
			margin-left: 700px;
			margin-top: -52px;
			width: 120px;
			height: 100px;
			border-radius: 20px;
		}
	.spantext{
		font-weight: bold;
	}
   </style>

</head>
<body>
	<%	
		String sector=(String)session.getAttribute("sector");
		String fixSector=(String)session.getAttribute("fixSector");
		String fixSectorSub=(String)session.getAttribute("fixSectorSub");
		String contentPage=null;
		String menubar=null;
		String footeris=null;
		String text=null;
		String loginCheck=(String)session.getAttribute("loginChecked");
		String managerLoginCheck=(String)session.getAttribute("managerLoginChecked");
		String producerLoginCheck=(String)session.getAttribute("producerLoginCheck");
		
		if(loginCheck==null){
			loginCheck="no";
			managerLoginCheck="no";
		}
		
		if(producerLoginCheck==null){
			producerLoginCheck="no";
		}
		if((loginCheck=="ok")&&(managerLoginCheck=="ok")){
			contentPage="uploadAnnounce.jsp";
			menubar="none";
			footeris="display:block";
			text="공지쓰기";
		}
		else if((loginCheck=="ok")&&(managerLoginCheck=="no")){
			contentPage="uploadQ.jsp";
			menubar="none";
			footeris="display:block";
			text="질문하기";
			
		}
		else if(loginCheck=="no"){
			contentPage="login.jsp";
			menubar="none";
			footeris="display:none";
			text="질문하기";
		}
		
	%>
   <div class="box">
         <h2 id="t1">질문과 답변</h2>
         <p id="t2">Private 인테리어 고수들과 전문가들에게 조언을 받아보세요.</p>
      	 <input id="searchArea" type="search" placeholder="궁금한 것을 검색해보세요">
      	 <br>
   </div>
   <div class="box2" >
    <select id="sort">
         <option value="sortvalue" selected disabled>정렬</option>
         <option value="new">최신순</option>
         <option value="hot">인기순</option>
         <option value="new qna">최근 답변순</option>
    </select>
       	<button id="btn1"><a href="privateHome.jsp?CONTENTPAGE=<%=contentPage %>&MENUBAR=<%=menubar%>&FOOTERIS=<%=footeris%>&FIXSECTOR=<%=fixSector%>&FIXSECTORSUB=<%=fixSectorSub%>&SECTOR=<%=sector %>" style="color: white;"><span><%=text%></span></a></button>
   </div>
  	<br>
  	
  	<c:forEach items="${aList}" var="announceList">
  	 <div class="box3">
  	  	<div class="box4" style="cursor:pointer" onclick="location.href='ViewDetailA.do?idx=${announceList.idx}'">
  	  			<img id="notice1" src="img/notice.png" style="width: 25px; height: 25px; vertical-align:middle;">
				<span class="spantext">${announceList.title}</span>
				<hr>
  	  	</div>
  	 </div>
	</c:forEach>	
	
	<c:forEach items="${qList}" var="questionList">
  	 <div class="box3">
  	  	<div class="box5" style="cursor:pointer" onclick="location.href='ViewDetailQ.do?idx=${questionList.idx}'">
  	  			<span id="span1">${questionList.title}</span>
				<div style="width:680px;">${questionList.content}</div>
				<span><img src="<%=request.getContextPath() %>/uploads/${questionList.sfile}" id="pic1"></span><br><br>
				<c:choose>
					<c:when test="${questionList.expertnick==null}">
						<img id="profile1" src="img/profile1.png" style="width: 30px; height: 30px; vertical-align:middle;">
					</c:when>
					<c:when test="${questionList.expertnick!=null}">
						<img id="profile2" src="img/profile2.png" style="width: 30px; height: 30px; vertical-align:middle;">
					</c:when>
				</c:choose>
				
				<c:choose>
					<c:when test="${questionList.expertnick==null}">
						<span class="spantext">${questionList.nick}</p>
					</c:when>
					<c:when test="${questionList.expertnick!=null}">
						<span class="spantext">${questionList.expertnick}</p>
					</c:when>
				</c:choose>
				<p>조회수: ${questionList.visitcount}</p>
				<p>${questionList.postdate}</p>
				<hr>
  	  	</div>
  	 </div>
	</c:forEach>
	
	
	 <script>
	 let button=document.getElementById("btn1");
	 let producerLoginCheck='${producerLoginCheck}';
	 if(producerLoginCheck=="ok"){
		 button.style.visibility="hidden";
	 }
	 
	 
	 
	 </script>
</body>
<script>	
</script>
</html>