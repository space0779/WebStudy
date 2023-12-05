<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
        int a=10;
        public void display(){}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	   for(int i=0;i<3;i++)
	   {
	%>
	      <h1><%=i %></h1>
	<%
	   }
	%>
</body>
</html>