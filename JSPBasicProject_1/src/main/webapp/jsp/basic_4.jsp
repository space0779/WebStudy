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
</head>
<body>
  <h1>사원목록</h1>
  <table border=1 width=400>
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
        	<tr>
        	  <td><%= vo.getEmpno() %></td>
        	  <td><%= vo.getEname() %></td>
        	  <td><%= vo.getJob() %></td>
        	  <td><%= vo.getHiredate() %></td>
        	  <td><%= vo.getSal() %></td>
        	</tr>
        	
     <%   	
        }
     %>
   
  </table>

</body>
</html>
