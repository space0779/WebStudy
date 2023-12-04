<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   EmpDAO dao=EmpDAO.newInstance(); 
   List<EmpVO> list=dao.empListData();
   request.setAttribute("list",list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원목록</h1>
  <table border=1 width=800>
   <tr>
     <th>사번</th>
     <th>이름</th>
     <th>직위</th>
     <th>입사일</th>
     <th>급여</th>
   </tr>
   <c:forEach var="vo" items="${list }">
     <tr>
       <td>${vo.empno}</td>
       <td>${vo.ename}</td>
       <td>${vo.job}</td>
       <td>${vo.hiredate}</td>
       <td>${vo.sal}</td>
     </tr>
   </c:forEach>
</body>
</html>