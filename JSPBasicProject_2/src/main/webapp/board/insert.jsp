<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/table.css">
<style type="text/css">
   img#main{
      margin-top: 50px;
   }
   a{
      color: black;
      text-decoration: none;
   }
   a:hover{
      color: green;
      text-decoration: underline;
   }
</style>
</head>
<body>
  <center>
    <img id="main" src="https://i0.wp.com/aikidonews.co.kr/wp-content/uploads/2017/03/QA-e1488530256249.jpg?resize=500%2C269" width="500" height="100">
    <form method=post action="insert_ok.jsp">
    <table class="table_content" width=800>
      <tr>
        <th width=20%>이름</th>
        <td width=80%>
         <input type=text name=name size=15 required>
        </td>
      </tr>
      <tr>
        <th width=20%>제목</th>
        <td width=80%>
         <input type=text name=subject size=45 required>
        </td>
      </tr>
      <tr>
        <th width=20%>내용</th>
        <td width=80%>
         <textarea rows="10" cols="45" name=content required></textarea>
        </td>
      </tr>
      <tr>
        <th width=20%>비밀번호</th>
        <td width=80%>
         <input type=password name=pwd size=10 required>
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <button>글쓰기</button>
          <input type=button value="취소"
           onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
    </form>
</body>
</html>