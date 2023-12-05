<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	  response
	    => HttpServletResponse
	    => 응답 정보
	       = 1. HTML , XML , JSON
	            setContentType() => page지시자에 지정
	       = 2. cookie => 브라우저로 전송
	            ***addCookie()
	       = JSP한파일에서 둘중에 한개만 전송이 가능      
	    => 화면 이동 정보
	       = ***sendRedirect() => 서버에서 이동
	         => return "redirect:파일명"
	         => GET방식
	         => insert => list
	         => update => detail
	         => delete => list
	         => login  => main
	    => 헤더 정보
	       = ***setHeader() => 헤더 설정
	         => 다운로드
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