<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/table.css">
</head>
<body>
  <center>
   <h1>개인정보</h1>
   <%--
          <form>
            => 입력된 값만 전송 => input, textarea, select
          </form>
    --%>
   <form method=post action="output.jsp">
   <table class="table_content" width=500>
     <tr>
      <th width=20%>이름</th>
      <td width=80%>
       <input type=text size=15 name="name">
       <%-- request.getParameter("name") --%>
      </td>
     </tr>
     <tr>
      <th width=20%>성별</th>
      <td width=80%>
       <input type=radio name=sex value="남자" checked>남자
       <input type=radio name=sex value="여자">여자
      </td>
     </tr>
     <tr>
      <th width=20%>전화</th>
      <td width=80%>
       <select name="tel1">
        <option>02</option>
        <option>031</option>
        <option>032</option>
        <option>042</option>
        <option>043</option>
       </select>
       <input type=text name="tel2" size=15>
      </td>
     </tr>
     <tr>
      <th width=20%>소개</th>
      <td width=80%>
       <textarea rows="5" cols="30" name="content"></textarea>
      </td>
     </tr>
     <tr>
      <th width=20%>취미</th>
      <td width=80%>
       <input type="checkbox" name=hobby value="운동">운동
       <input type="checkbox" name=hobby value="낚시">낚시
       <input type="checkbox" name=hobby value="독서">독서
       <input type="checkbox" name=hobby value="게임">게임
       <input type="checkbox" name=hobby value="여행">여행
      </td>
     </tr>
     <tr>
       <td colspan="2" align=center>
         <button>전송</button>
       </td>
     </tr>
   </table>
   </form>
  </center>
</body>
</html>