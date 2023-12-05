<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  div.container{
    width: 800px;
    height: 700px;
    border: 2px solid red;
  }
  div.header{
    width: 800px;
    height: 150px;
    border: 2px solid green;
  }
  div.aside{
    width: 200px;
    height: 400px;
    border: 2px solid blue;
    float: left;
  }
  div.section{
    width: 590px;
    height: 400px;
    border: 2px solid magenta;
    float: left;
  }
  div.footer{
    width: 800px;
    height: 150px;
    border: 2px solid black;
    clear: both;
  }
</style>
</head>
<body>
  <div class="container">
    <div class="header">
      <%@ include file="header.jsp" %>
    </div>
    <div class="aside"> 
      <%@ include file="aside.jsp" %>
    </div>
    <div class="section">
      <%@ include file="section.jsp" %>
    </div>
    <div class="footer">
      <%@ include file="footer.jsp" %>
    </div>
  </div>
</body>
</html>