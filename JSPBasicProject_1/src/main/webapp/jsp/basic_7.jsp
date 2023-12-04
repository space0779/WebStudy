<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb"%>
<%-- 139page
     = 지시자 
       page : jsp파일에 대한 정보
       => JSP시작점
       => 1. contentType = 실행시 변결될 파일 형식
             => 자바로 변경 : response.setContentType()
             => html => text/html;charset=UTF-8
                                   ============
                                   Charset=ISO-8859-1 => default
                xml => text/xml;charset=UTF-8
                json => text/plain;charset=UTF-8
                => 브라우저에 알려준다 
                => page안에서 1번만 사용이 가능
          2. import => 외부 라이브러리 첨부
                       java.lang, java.http.servlet
                       ============================ 생략이 가능
             => 사용형식 => 2
                <%@ page import="java.util.*, java.io.*"%>
                <%@ page import="java.util.*"%>
                <%@ page import="java.io.*"%>
          3. buffer => html을 저장하는 메모리 공간
                    => 8kb
                    => html이 출력을 할때 용량 부족시에는 증가
                       buffer="16kb" => 출력 스트림
          4. errorPage => 에러가 난 경우 호출되는 파일 
           
      
       taglib : 태그로 자바 기본 문법을 제공 => jstl/el
       include : JSP안에 다른 JSP를 첨부해서 사용할때
       <%@ 지시자명 속성="값" 속성="값">
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>