<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 1. 한글 => 디코딩을 한다 => 모든 JSP마다 내장객체를 가지고 있다 
   // 2. 화면이 변경되면 request가 초기화된다. ( 화면을 바꾸면 내장객체(메소드)들은 초기화된다 )
         // Ajax를 써서 한 화면에 request를 다 넣어서 초기화되지 않게 사용한다
         // or Session에 저장해놓는 방법. 
   // 3. forward 를 사용하면 request를 유지할 수 있다 (URL 주소는 안바뀌고 화면만 바뀌는)
   try
   {
      request.setCharacterEncoding("UTF-8");
      // 내장 객체.
   }catch(Exception ex){}
   // 2. 전송된 값을 받는다 
   // <input type=text size=15 name="name">
   String name=request.getParameter("name");
   String sex=request.getParameter("sex");
   // radio는 name이 동일해야 그룹이 생성된다 => 한개만 선택이 가능
   String tel1=request.getParameter("tel1");
   String tel2=request.getParameter("tel2");
   String tel=tel1+")"+tel2;
   String content=request.getParameter("content");
   String[] hobby=request.getParameterValues("hobby"); // 여러개 받을 때
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  1. ***사용자의 IP:<%=request.getRemoteAddr() %><br>
  2. 서버 정보:<%=request.getServerName() %><br>
  3. 서버프로토콜:<%=request.getProtocol() %><br>
  4. 전송방식:<%=request.getMethod() %><br>
  5. 포트번호:<%=request.getServerPort() %><br>
  6. ***요청 URL:<%=request.getRequestURL() %><br>
  7. ***요청 URI:<%=request.getRequestURI() %><br>
  8. ***ContextPath:<%=request.getContextPath() %>:루트 폴더<br>
  9. 전송 값<br>
     이름:<%=name %><br>
     성별:<%=sex %><br>
     전화:<%=tel %><br>
     소개:<%=content %><br>
     취미:<%
            try
            {
                out.write("<ul>");
                for(String h:hobby)
                {
                   out.write("<li>"+h+"<li>");
                }
                out.write("</ul>");
            }catch(Exception ex)
            {
               out.write("취미가 없습니다");
               // <%=
            }
         %>
</body>
</html>




