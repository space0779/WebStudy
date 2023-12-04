<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.dao.*" %>
<%
   EmpDAO dao=EmpDAO.newInstance(); 
   List<EmpVO> list=dao.empListData();
   
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/table.css">
<style type="text/css">
  .container{
     margin-top: 50px;
     width:100%;
     margin: 0px auto;
  }
  h1{
     text-align: center;
  }
  .row, .table_content{
     width:800px;
     margin: 0px auto; /*가운데 정렬*/
  }
</style>
</head>
<body>
<div class="container">
<div class="row">
  <h1>사원목록</h1>
  <table class="table_content" width=400>
   <tr>
     <th>사번</th>
     <th>이름</th>
     <th>직위</th>
     <th>입사일</th>
     <th>급여</th>
   </tr>
   <%--
      = 자바 / HTML을 구분
      = 모든 소스는 _jspService()에 첨부 => 톰캣이 자동 처리
          톰캣 : WAS
                형상관리 : GIT
   
   --%>
     <%
        for(EmpVO vo:list)
        {
      %>      
           <tr class="dataTr">
             <td class="text-center"><%= vo.getEmpno() %></td>
             <td class="text-center"><%= vo.getEname() %></td>
             <td class="text-center"><%= vo.getJob() %></td>
             <td class="text-center"><%= vo.getHiredate() %></td>
             <td class="text-center"><%= vo.getSal() %></td>
           </tr>
           
     <%      
        }
     %>
   
  </table>
</div>
</div>
</body>
</html>