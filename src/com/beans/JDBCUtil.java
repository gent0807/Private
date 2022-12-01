package com.beans;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.sun.corba.se.pept.transport.Connection;

public class JDBCUtil {
	final static String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	final static String JDBC_URL = "jdbc:mysql://localhost:3306/privatedb?serverTimezone=UTC&useSSL=false&useUnicode=true&characterEncoding=utf-8 ";    
	final static String JDBC_USER="root";
	final static String JDBC_PASS="loopholesub0807$&!";
	
	public static java.sql.Connection getConnection() {
	      try {
	         Class.forName(JDBC_DRIVER);
	         return DriverManager.getConnection( JDBC_URL, JDBC_USER , JDBC_PASS);
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return null;

	   }
	
	 public static void close(PreparedStatement pstmt, java.sql.Connection conn) {
	      try {
	      pstmt.close();
	      conn.close();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	}
	   
	    public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
	      try {
	         pstmt.close();
	         conn.close();
	         rs.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }
}
