<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
 <style>
      .box{
         width: 1920px;
         height: 250px;
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
   </style>

</head>
<body>
	<%	
	
		String fixSector=(String)session.getAttribute("fixSector");
		String fixSectorSub=(String)session.getAttribute("fixSectorSub");
		String fixCategory=(String)session.getAttribute("fixCategory");
		String contentPage=null;
		String menubar=null;
		String footeris=null;
		String loginCheck=(String)session.getAttribute("loginChecked");
		if(loginCheck==null){
			loginCheck="no";
		}
		if(loginCheck=="ok"){
			contentPage="uploadQ.jsp";
			menubar="exist";
			footeris="display:block";
		}
		else if(loginCheck=="no"){
			contentPage="login.jsp";
			menubar="none";
			footeris="display:none";
		}
		
	%>
    <div class="box">
         <h2 id="t1">질문과 답변</h2>
         <p id="t2">Private 인테리어 고수들과 전문가들에게 조언을 받아보세요.</p>
      <input id="searchArea" type="search" placeholder="궁금한 것을 검색해보세요">
   </div>
   <div class="box2" style="width: 1920px;">
    <select id="sort">
         <option value="sortvalue" selected disabled>정렬</option>
         <option value="new">최신순</option>
         <option value="hot">인기순</option>
         <option value="new qna">최근 답변순</option>
    </select>
       	<a href="privateHome.jsp?CONTENTPAGE=<%=contentPage%>&MENUBAR=<%=menubar%>&FOOTERIS=<%=footeris%>&FIXSECTOR=<%=fixSector%>&FIXSECTORSUB=<%=fixSectorSub %>&FIXCATEGORY=<%=fixCategory %>" style="color: white;"><span><button id="btn1">질문하기</button></span></a>
   </div>
</body>
<script>	
</script>
</html>