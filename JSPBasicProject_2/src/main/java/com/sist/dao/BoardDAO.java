package com.sist.dao;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.*;
public class BoardDAO {
   private Connection conn;
   private PreparedStatement ps;
   private static BoardDAO dao; // 싱글턴
   
   public void getConnection() // 미리 연결된 Connection 객체 얻기
   {
      try
      {
         Context init=new InitialContext();
         Context c=(Context)init.lookup("java://comp/env");
         DataSource ds=(DataSource)c.lookup("jdbc/oracle");
         conn=ds.getConnection();
      }catch(Exception ex) {}
   }
   public void disConnection() // 반환. 반환을 해야 재사용이 가능!
   {
      try
      {
         if(ps!=null) ps.close();
         if(conn!=null) conn.close();
      }catch(Exception ex) {}
   }
   public static BoardDAO newInstance()
   {
      if(dao==null)
         dao=new BoardDAO();
      return dao; // 싱글턴
   }
   
   // 기능 => 목록 (페이지)
   // => 화면에 출력한 데이터 (리턴형)      사용자가 요청한 값 (매개변수)
   public List<BoardVO> boardListData(int page)
   {
      List<BoardVO> list=new ArrayList<BoardVO>();
      try
      {
         getConnection();
         String sql="SELECT no,subject,name,"
               + "TO_CHAR(regdate,'YYYY-MM-DD'),hit,group_tab,num "
               + "FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num "
               + "FROM (SELECT no,subject,name,regdate,hit,group_tab "
               + "FROM replyBoard ORDER BY group_id DESC,group_step ASC)) "
               + "WHERE num BETWEEN ? AND ?";
         ps=conn.prepareStatement(sql);
         int rowSize=10;
         int start=(page*rowSize)-(rowSize-1);
         int end=rowSize*page;
         
         ps.setInt(1, start);
         ps.setInt(2, end);
         
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            BoardVO vo=new BoardVO();
            vo.setNo(rs.getInt(1));
            vo.setSubject(rs.getString(2));
            vo.setName(rs.getString(3));
            vo.setDbday(rs.getString(4));
            vo.setHit(rs.getInt(5));
            vo.setGroup_tab(rs.getInt(6));
            list.add(vo);
         }
         rs.close();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         disConnection();
      }
      return list;
   }
   public int boardRowCount()
   {
      int count=0;
      try
      {
         getConnection();
         String sql="SELECT COUNT(*) FROM replyBoard";
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         rs.next();
         count=rs.getInt(1);
         rs.close();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         disConnection();
      }
      return count;
   }
   public void boardInsert(BoardVO vo)
   {
      try
      {
         getConnection();
         String sql="INSERT INTO replyBoard("
               + "no,name,subject,content,pwd,group_id) "
               + "VALUES(rb_no_seq.nextval,?,?,?,?,"
               + "(SELECT NVL(MAX(group_id)+1,1) FROM replyBoard))";
         ps=conn.prepareStatement(sql);
         ps.setString(1, vo.getName());
         ps.setString(2, vo.getSubject());
         ps.setString(3, vo.getContent());
         ps.setString(4, vo.getPwd());
         ps.executeUpdate();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         disConnection();
      }
   }
   
}



