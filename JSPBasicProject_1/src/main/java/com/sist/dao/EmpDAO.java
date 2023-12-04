package com.sist.dao;
import java.util.*;
import java.sql.*;
public class EmpDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   private static EmpDAO dao; // 싱글턴 
   
   // 드라이버 등록 
   public EmpDAO()
   {
      try
      {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      }catch(Exception ex) {}
   }
   // 오라클 연결
   public void getConnection()
   {
      try
      {
         conn=DriverManager.getConnection(URL,"hr","happy");
      }catch(Exception ex) {}
   }
   // 오라클 닫기 
   public void disConnection()
   {
      try
      {
         if(ps!=null) ps.close();
         if(conn!=null) conn.close();
      }catch(Exception ex) {}
   }
   // 싱글턴 
   public static EmpDAO newInstance()
   {
      if(dao==null)
         dao=new EmpDAO();
      return dao;
   }
   // 기능 (사용자 요청)
   public List<EmpVO> empListData()
   {
      List<EmpVO> list=new ArrayList<EmpVO>();
      try
      {
         getConnection();
         String sql="SELECT empno,ename,job,hiredate,sal "
               + "FROM emp";
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            EmpVO vo=new EmpVO();
            vo.setEmpno(rs.getInt(1));
            vo.setEname(rs.getString(2));
            vo.setJob(rs.getString(3));
            vo.setHiredate(rs.getDate(4));
            vo.setSal(rs.getInt(5));
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
}