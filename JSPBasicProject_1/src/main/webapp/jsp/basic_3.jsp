<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      public class basic_3_jsp
      {
         ============================
         => 메소드 선언, 멤버변수 <%! %>
         ======================
         public void _jspService()
         {
            =======================
            <%
            %>
            **<html> => 자동으로 out.write
            =======================
         }     
      
      }
--%>
<%!
    // 전역변수 (멤버변수), 메소드 선언 => 거의 사용 빈도가 없다
    // => 자바스크립트 VueJs => data:{}, React => state:{}
    String name="홍길동";
    public String getName()
    {
    	return name;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1><%= getName() %></h1>
</body>
</html>