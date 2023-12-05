<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"
    errorPage="error.jsp"
%>
<%
   // (사용자 요청을 받아서 요청처리 결과를 받는다...)
   // 사용자 요청 => 페이지 => Object page=this (page는 이미 내장객체 이름으로 쓰였다)
   String strPage=request.getParameter("page");
   if(strPage==null) // 처음 실행할 때 페이지 지정없으니 1page 출력해라(dafault)
      strPage="1"; 
   // 현재페이지 지정 
   int curpage=Integer.parseInt(strPage);
   // 오라클로부터 데이터 읽기
   BoardDAO dao=BoardDAO.newInstance();
   List<BoardVO> list=dao.boardListData(curpage);
   // 총페이지
   int count=dao.boardRowCount();
   int totalpage=(int)(Math.ceil(count/10.0));
   
   // count 변경 => 2page 넘어가서도 글번호 올바르게 출력하는 코딩 (페이지)
   count=count-((curpage*10)-10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/table.css">
<style type="text/css">
   img#main{
      margin-top: 50px;
   }
   a{
      color: black;
      text-decoration: none;
   }
   a:hover{
      color: green;
      text-decoration: underline;
   }
</style>
</head>
<body>
  <center>
    <img id="main" src="https://i0.wp.com/aikidonews.co.kr/wp-content/uploads/2017/03/QA-e1488530256249.jpg?resize=500%2C269" width="500" height="100">
    <table class="table_content" width=800>
      <tr>
        <td>
          <a href="insert.jsp">새글</a>
        </td>
      </tr>
    </table>
    <table class="table_content" width=800>
      <tr>
        <th width=10%>번호</th>
        <th width=45%>제목</th>
        <th width=15%>이름</th>
        <th width=20%>작성일</th>
        <th width=10%>조회수</th>
      </tr>
      <%
          for(BoardVO vo:list)
          {
      %>
         <tr>
           <td widtd=10% class="text-center"><%=count-- %></td>
           <td widtd=45%>
             <%
                if(vo.getGroup_tab()>0)
                {
                   for(int i=0;i<vo.getGroup_tab();i++)
                   {
                      out.write("&nbsp;&nbsp;");
                   }
             %>
                   <img src="re_icon.png">
             <%
                }
             %>
             <a href="detail.jsp?no=<%=vo.getNo() %>"><%=vo.getSubject() %></a>
             <%
                SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd");
                String today=sdf.format(new Date());
                if(today.equals(vo.getDbday()))
                {
             %>
                   <sup style="color:red">new</sup>
             <%
                }
             %>
           </td>
           <td widtd=15% class="text-center"><%=vo.getName() %></td>
           <td widtd=20% class="text-center"><%=vo.getDbday() %></td>
           <td widtd=10% class="text-center"><%=vo.getHit() %></td>
         </tr>
      <%
          }
      %>
      <tr>
        <td colspan="5" class="text-center">
          <a href="#">이전</a>&nbsp;
          <%=curpage %> page/ <%=totalpage %> pages&nbsp;
          <a href="#">다음</a>
        </td>
      </tr>
    </table>
  </center>
</body>
</html>