<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	   165page
	   내장 객체 => _jspService() => 선언되어있는 객체들
	   => 9개 제공
	      ***1. request
	        => HttpServletRequest
	        => 톰캣에 의해 정보를 묶어서 전송 (개발자)
	           =================
	           1. 서버 정보
	              = 서버의 이름 : getServerInfo()
	              = 사용 프로토콜 : getProtocol()
	              = 전송 방식 : getMethod() : GET/POST
	              = URL / URI / ContextPath (******)
	                ================
	                getRequestURL()
	                getRequestURI()
	                getContextPath()
	                ================ MVC
	           http://localhost /JSPBasicProject_2/jsp/basic_3.jsp    
	           ---------------- ----------------------------------
	               서버 정보            사용자 요청 정보
	           ------------------------------------------------URL
	                            -------------------------------URI
	                            ---------------------- ContextPath
	           2. 브라우저 정보
	              => getRemoteAddr() : 클라이언트의 IP
	              => getPort() : 클라이언트의 port
	           3. 요청 정보
	              => 단일값 : String getParameter()
	              => 다중값 (체크박스) : String[] getParameterValues()
	              => 디코딩 : 한글 변환 => setCharacterEncoding()
	           4. 추가 정보 (실제 1차에서 프로젝트)
	              => setAttribute()
	              => getAttribute()
	      ***2. response
	      ***3. session
	      ***4. out
	      ***5. application
	      ***6. pageContext
	      7. page => this Object page=this
	      8. exception => try~catch
	      9. config => web.xml
	      
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