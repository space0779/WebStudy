<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%--
   1. 동작 과정
      1) 요청 : http://localhost/JSPBasicProject_2/jsp/basic_1.jsp
               => basic_1.jsp를 찾아서 실행 결과를 보여달라
               => 주소창 
      2) 웹서버에서 요청을 받는다 
         ===== HTML/XML/JSON => 자체 처리
         ===== .jsp/servlet => 처리가 불가능
      3) jsp => WAS(Web Application Server) => 톰캣
                jsp,servlet 번역 (자바 처리) => jsp 엔진 (= 톰캣)
      4) 톰캣
          = jsp ==> 자바파일로 변경
            basic_1.jsp ==> basic_1_jsp.java
            ===========
             | 코딩된 내용이 _jspServer() 메소드 안에 들어간다 
               public void _jspService()
               {
                  session , pageContext , page , exception
                  out , application , config ==> 생성 
                  ========================== 내장 객체
                  =======================================
                  
                  jsp에서 코딩한 내용을 첨부 => _jspService() 메소드 안에 첨부
                  =======================================
               }
      = 컴파일 => basic_1_jsp.class => 서블릿
      = 실행 => out.write("<html>")
               => 출력버퍼에 출력
               => ====== html을 브라우저에서 읽어서 출력
      *** html/css/javascript를 사용하기 편리하게 만들어져 있다 => JSP
          html태그앞에 out.write()가 생략되어 있다 => JSP
   2. 지시자 => 설정 (139page)
      page : jsp파일에 대한 정보
        사용법)
        <%@ page 속성=값 속성=값 속성=값 %>
                 속성은 지정되어 있다
                 속성은 한번만 사용이 가능 => import는 여러번 사용이 가능
                 => XML 형식으로 만들어져 있다
                    =======
                    문법이 어렵다 (1. 대소문자를 구분 | 2. 값을 설정할 때 반드시 "")
                 => info : 파일에 대한 설명
                    info="게시판 수정파일" 
                 => contentType : 브라우저 전송 => 어떤 형식인지를 알려준다
                    contentType="text/html;charset=UTF-8" => html 형식 
                    contentType="text/xml;charset=UTF-8" => xml 형식
                                          =============
                                          UTF-8 / EUC-KR
                                            |        ㄴ Window에서만(git에서 깨질수도)
                                            | 운영체제 호환
                    *** GIT (공유) => UTF-8로 변경 후 값을 가져와야 한다
                    *** MAC / Window => 경로명 => 호환시키는 방법 있다 
                    => File.separator '\\'
                    contentType="text/plain;charset=UTF-8" => json 형식
                                 ==========
                                 | Vue/React (JSON 으로 보내야 사용 가능)
                    => VO(상세보기) => {} => JSON
                    => List(목록) => []
                    => Ajax 에서 JSON을 전송 => simple-json.jar 
                    =============         => jackson (json 만들어주는 파일)
                 => import : 라이브러리 불러올 때 사용
                    import=" , , "
                    <%@ page import=""%>
                    <%@ page import=""%>
                    <%@ page import=""%> ==> import만 유일하게 여러번 사용 가능
                 => buffer : 8kb
                    => 증가 가능 (HTML이 전체 인식이 안되는 경우)
                    => HTML을 저장하는 메모리 공간 => 출력버퍼
                                                 => 사용지당 한개만 생성
                                                 => 브라우저에서 전체 읽기를 하면 => 버퍼를 비워준다 (autoFlush)
                 => errorPage : 한개만 설정이 가능
                 => isErrorPage : 종류별로 처리가 가능      
                    => 404 : 파일이 없는 경우
                    => 500 : 자바 컴파일시 오류
                    => 403 : 접근 거부 ==> Spring(Security) => 암호/복호 , 권한부여
                    => 400 : GET/POST => 전송방식이 잘못되었을 때
                             doGet / doPost
                             => service()
                             => @GetMapping
                                @PostMapping
                    => 412 : 절못된 전송 (bad request)
                             => [] => String = 412 오류 발생
      include : JSP안에 다른 JSP를 포함
                <%@ include file=""%> : 사용빈도가 거의 없다
                  => 정적이기 때문에 잘 사용 안한다
                  자바파일까지 포함 => 한번에 컴파일
                <jsp:include page=""> : 동적
                  따로 컴파일 ==> html만 추가
      taglib : JSP에서 자바문법(제어문,변수선언,메소드호출)
               ============= 태그형으로 제작
               JSP는 View의 역할만 수행 (= 화면 출력에만 주력)
                    ==== 화면 UI => 보안에 취약하기 때문에 UI에만 사용
   3. 자바 사용법 
      => HTML + Java => 구분 
      => 스크립트
         <%  %> : 일반자바 (메소드안에서 자바코딩)
                   변수(지역변수), 메소드 호출, 연산자, 제어문
                   => 일반적으로 가장 많이 사용 
         =================  _jspService() 안에 첨부
         <%! %> : 사용빈도는 거의 없다 
                  => 클래스 영역
                  => 메소드 선언, 멤버변수 설정
         <%= %> : out.write() => 데이터 출력
         <% 
            <%! %> , <%= %> ==> 오류 발생 (따로따로 사용해야 한다)
         %>
         a.jsp
         =====
           => a_jsp.java
           public class a_jsp extends HttpServlet
           {
              ===========================
              
                <%! 
                   int a;
                   public void display(){}
                %>
              ===========================
              public void _jspIniti(){}
              public void _jspDestroy(){}
              public void _jspService(){
                ===========================
                
                  <% 
                    for(int i=0;i<10;i++)
                    {
                  %>
                      <h1><%=i%></h1> 
                  <%
                    }
                  %>
                  
                  for(int i=0;i<3;i++)
                  {
                     out.write("<h1>");
                     out.println(i);
                     out.write("</h1>");
                  }
                  
                ===========================
              } 
           }
   public void _jspService(
   final javax.servlet.http.HttpServletRequest request, 
   final javax.servlet.http.HttpServletResponse response)
   
   final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
   ====================
   4. 내장 객체 => Spring에서는 자체 처리
      _jspService안에 미리 선언후에 사용이 가능하게 만든 객체
      => 내장 객체 / 기본객체
   ================================= request,response (12/05 할 내용)
      => 답변형 게시판 
   5. 액션 태그
   
   6. 빈즈 => 병행 => VO (Getter/Setter. 데이터 모아서 보내는 방식)
   7. 데이터베이스 연동 
   8. MVC
   ===================== Spring, Spring-Boot, 실무
   public void_jspService(){
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
       int a=10/0; // 500 오류 발생 
  %>
</body>
</html> 