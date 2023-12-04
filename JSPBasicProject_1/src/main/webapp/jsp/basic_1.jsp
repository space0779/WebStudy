<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
   JSP
   1. HTML + Java = 구분하는데 주력
   2. 동작 방식
   3. 지시자
      = page
      = taglib
      = include
   4. 자바 코딩
      = 스크립트릿 <% %> : 일반 자바 (메소드 호출 , 제어문 , 지역변수)
      = 선언문 <%! %> : 선언문 : 멤버변수
      = 출력문 (표현식) : 화면 출력 => out.write()
   5. 내장 객체 : 9개 => 미리 객체를 생성한 후에 사용
       ***= request : 사용자의 요청 정보를 저장하고 있다
       ***= response : 서버 응답 / 화면 변경
       ***= session
       = out => <% %> , ${}
       ***= application
       = config => web.xml
       = exception => try~catch
       = page => this
       ***= pageContext   
   6. JSP 액션 태그 / 빈즈   
      <jsp:~~>
   7. 표현식 => EL ${} **********
   8. JSTL
      => 자바 문법을 태그형으로 생성  **********
      => <c:forEach> <c:if> <c:choose>
      => <fmt:formetDate> <fmt:formatNumber>
   9. MVC
      ====================================
      Model
      View : JSP
      Controller : 서블릿 (스프링:서블릿)
      ====================================
       model 1 => 가벼운 홈페이지 => JSP
       model 2 => 사이트 개발 => MVC      
      
     1) 웹 동작 : request(요청) , response(응답)
                 ==============   ===============
                  Client(Front)    Server  (Back)
        URL
           http://localhost /JSPBasicProject_1/jsp/basic_1.jsp
           ================ ==================================
              서버 정보     요청 => URL
                            ===================
                                   | ContextPath
           => 파일 요청 : 경우에 따라서는 파일 확장자를 변경
                          => .회사명 => .naver , .do
           => PathVariable /aaa/aaa => React           
                 request(파일요청)     
        Client   ======= Web Server   ======= Web Container(WAS)
        ======           아파치 / IIS         =================
        브라우저                |                 | Tomcat
                            요청 받는다                | 
                            파일 찾기 ==> Servlet/JSP  JSP/Servlet 엔진
                            => HTML/XML/JSON              |
                               (자동처리)                HTML로 변환
                           <=============                 |
                             HTML을 브라우저로 전송
                             => 번역된 내용 : 소스보기
       19page 요청 / 응답 => 네트워크 (C/S)
              정적페이지 : HTML/CSS => 데이터 갱신이 불가능
              동적페이지 : JSP / JavaScript => 데이터 갱신
              *** 웹에서는 파일(페이지)     
              *** 요청은 브라우저에서 사용되는 위치
                  =================================
                   | 주소란 : <a> <form>
                     => location.href
                     => ajax({url:...}) => jquery
                     => axios.get(url) => vue,react
                     ====== 서버와 연결 ======
       1. 서블릿
                    request
          client   ==========  객체생성
                              HttpServletRequest
                                (request)
                              HttpServletResponse
                                 (response)
                                    |
                                    --------------- 서블릿 찾기
                                                          |
                                                    서블릿 객체 생성
                                                    (new ~Servlet())
                                                          |
                                                         init() => 동작에 필요한 데이터 읽기
                                                                     => web.xml
                                                          |
                                                        doGet()/doPost()
                                                          GET     POST
                                                          ---     -----
                                                                  | 처리 (회원가입,로그인) => 보안
                                                          | 화면요청 / 단순한 데이터 전송
                                                                       => page, no, 검색어
                                                        ==================================
                                                           처리 => HTML로 변경 => 웹서버를 통해서 클라이언트로 전송
       1) 서블릿
          웹 서브시 기능을 해주는 자바 클래스
          => 자바안에 HTML코드를 첨부
             out.write("<html>")..
          => 단점
              = HTML을 사용하기 어렵다 (복잡) => CSS/JavaScript
              = 에러 잡기가 어렵다
              = 자바 => 약간을 수정해도 컴파일을 다시 해야한다
                => 버튼의 색상 변경 (문자 변경) => 컴파일
                *** 개발자는 바로 실행 결과를 볼 수 있는것을 선호
            장점                                               
             = 자바 => 소스를 볼 수 없다 (.class) 보안이 뛰어나다
             = HTML을 출력하지 않는 웹 개발      
               => Controller (자바/HTML을 분리) => 연결
                  ========== 스프링은 이미 제작 (서블릿)
                  = 라이브러리 : 구조
                    예) 4버전 => XML , 5버전 => 순수하게 자바
                        => 금융권(5) , 공기업(4)
                        => 차세대 개발 : Spring-Boot
    => 단점을 보완
       => 복잡한 HTML/CSS/JavaScript 구현
       => HTML안에 자바를 첨부
          => 구분 <% %> , <%= %>
       => 실행을 하면 톰캣이 컴파일을 자동 수행
          => 저장하고 브라우저를 새로 고침
          => 보안 취약하다 (소스 전체를 전송)    
      
  =>  JSP의 장점
      1) 서블릿보다 쉽게 소스작성이 가능하다 (빠르다)
      2) HTML / Java 가 나눠져 있다
      3) 디자인과 소스 코딩을 나눠서 작업할 수 있다
      4) 단순하다 => 데이터베이스 연동 => for / if
      5) = 자바가 먼저 수행 (데이터를 읽어 온다) => HTML을 이용해서 출력  
      6) HTML => out.write("<html>")
                 ========== 생략
                 <html>태그가 단독으로 수행
    => 서블릿은 클래스로 되어 있다
       JSP는 클래스가 아니라 메소드 영역이다
       =====================================
       
       a.jsp => a_jsp.java => a_jap.class => 실행
                    | 서블릿
       순서
       a.jap
        <%@ page contentType="text/html;charset=UTF-8"%>
        <!DOCTYPE html>
        <html>
         <head>
         </head>
         <body>
         </body>
        </heml>
       => 실행시에 톰캣에 의해 생성
       => a_jsp.java
       public class a_jsp extends HttpServlet
       {
           ===========================
             멤버변수  <%! %>
             메소드
           =========================== 
           public void _jspInit()
           {
              생성자 역할
              멤버변수의 초기화
           }  
           public void _jspDestroy()
           {
              // 새로고침 , 화면 이동 => 자동으로 메모리 해제
           }
           public void _jspService(
             HttpServletRequest,
             HttpServletResponse rseponse)
           {
               response.setContentType("text/html; charset=UTF-8")
               //PrintWrite out
               JspWriter out;
               HttpSession session
               Object page=this;
               PageContext pageContext=ServletContext
               
               ==================================
               
               out.write("<!DOCTYPE html>")
               out.write("<html>")
               out.write("<head>")
               out.write("</head>")
               out.write("<body>")
               out.write("</body>")
               out.write("</html>")
               
               
               ==================================
           }
       } 
       
       <% %> 없이 자바 코딩을 하면 => 일반 텍스트로 인식  
                         
                                                                          
                                                                          
                                      
 --%>
 <%--
       <%--
    public void _jspService(request,response)
    {
       final javax.servlet.jsp.PageContext pageContext;
       javax.servlet.http.HttpSession session = null;
       final javax.servlet.ServletContext application;
       final javax.servlet.ServletConfig config;
       javax.servlet.jsp.JspWriter out = null;
       final java.lang.Object page = this;
       javax.servlet.jsp.JspWriter _jspx_out = null;
       javax.servlet.jsp.PageContext _jspx_page_context = null;
       ============JSP 소스 코딩================
       
         out.write('\r');
         out.write('\n');
         out.write("\r\n");
         out.write("<!DOCTYPE html>\r\n");
         out.write("<html>\r\n");
         out.write("<head>\r\n");
         out.write("<meta charset=\"UTF-8\">\r\n");
         out.write("<title>Insert title here</title>\r\n");
         out.write("</head>\r\n");
         out.write("<body>\r\n");

        String name="홍길동";
        out.write(name);
       
       =======================================
    }
  
  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name="홍길동";
out.write(name);
%>
</body>
</html>