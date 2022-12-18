package com.beans;

import java.sql.Connection;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;



public class WriteDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	final String Q_INSERT="insert into questiontbl values(null, ?, ?, ?, ?, SYSDATE(), ?, ?, DEFAULT);";
	final String Q_LIST="select * from questiontbl order by idx desc;";
	final String A_INSERT="insert into announcetbl values(null, ?, ?, ?, SYSDATE(), ?, ?, DEFAULT);";
	final String A_LIST="select * from announcetbl order by idx desc;";
	
	public void insertQuestion(WriteDTO wt) throws SQLException {
		conn=JDBCUtil.getConnection(); // 같은 패키지에 있는 클래스는 import 작업이 불필요
		pstmt=conn.prepareStatement(Q_INSERT);//쿼리를 실행할 statement 객체 생성
		pstmt.setString(1, wt.getTitle());
		pstmt.setString(2, wt.getContent());
		pstmt.setString(3, wt.getNick());
		pstmt.setString(4, wt.getExpertnick());
		pstmt.setString(5, wt.getOfile());
		pstmt.setString(6, wt.getSfile());
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt, conn);
	}
	
	public ArrayList<WriteDTO> selectQList() throws SQLException {
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(Q_LIST); //쿼리를 실행할 statement 객체 생성
		rs=pstmt.executeQuery();
		ArrayList<WriteDTO> qList = new ArrayList<WriteDTO>();
		while(rs.next()){
			WriteDTO wt=new WriteDTO();			
			wt.setIdx(rs.getInt("idx"));
			wt.setTitle(rs.getString("title"));
			wt.setContent(rs.getString("content"));
			wt.setNick(rs.getString("nick"));
			wt.setExpertnick(rs.getString("expertnick"));
			wt.setPostdate(rs.getDate("postdate"));
			wt.setOfile(rs.getString("ofile"));
			wt.setSfile(rs.getString("sfile"));
			wt.setVisitcount(rs.getInt("visitcount"));
			qList.add(wt);
		}
		JDBCUtil.close(pstmt, conn);
		return qList;
		
	}
	
	public String selectUserNick(String loginid) throws SQLException {
		conn=JDBCUtil.getConnection();
		String nick=null;
		pstmt=conn.prepareStatement("Select nickname from membertbl where memberid=(?)");
		try {
			pstmt.setString(1, loginid);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				nick=rs.getString("nickname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("일반 사용자 닉네임 조회 오류발생");
		}
		JDBCUtil.close(pstmt, conn);
		return nick;
		
	}
	
	public String selectExpertNick(String expertLoginid) throws SQLException {
		conn=JDBCUtil.getConnection();
		String expertnick=null;
		pstmt=conn.prepareStatement("Select nickname from experttbl where expertid=(?)");
		try {
			pstmt.setString(1, expertLoginid);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				expertnick=rs.getString("nickname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("전문가 닉네임 조회 오류발생");
		}
		JDBCUtil.close(pstmt, conn);
		return expertnick;
		
	}
	
	
	public void insertAnnounce(WriteDTO wt) throws SQLException {
		conn=JDBCUtil.getConnection(); // 같은 패키지에 있는 클래스는 import 작업이 불필요
		pstmt=conn.prepareStatement(A_INSERT);//쿼리를 실행할 statement 객체 생성
		pstmt.setString(1, wt.getTitle());
		pstmt.setString(2, wt.getContent());
		pstmt.setString(3, wt.getNick());
		pstmt.setString(4, wt.getOfile());
		pstmt.setString(5, wt.getSfile());
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt, conn);
	}
	
	public ArrayList<WriteDTO> selectAList() throws SQLException {
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(A_LIST); //쿼리를 실행할 statement 객체 생성
		rs=pstmt.executeQuery();
		ArrayList<WriteDTO> aList = new ArrayList<WriteDTO>();
		while(rs.next()){
			WriteDTO wt=new WriteDTO();			
			wt.setIdx(rs.getInt("idx"));
			wt.setTitle(rs.getString("title"));
			wt.setContent(rs.getString("content"));
			wt.setNick(rs.getString("nick"));
			wt.setPostdate(rs.getDate("postdate"));
			wt.setOfile(rs.getString("ofile"));
			wt.setSfile(rs.getString("sfile"));
			wt.setVisitcount(rs.getInt("visitcount"));
			aList.add(wt);
		}
		JDBCUtil.close(pstmt, conn);
		return aList;
		
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount=0;
		
		String query="SELECT COUNT(*) FROM questiontbl";
		
		if(map.get("searchWord")!=null) {
			query +=" WHERE " + map.get("searchField")+" "+" LIKE '%" + map.get("searchWord")+"%'";
		}
		try {
			conn=JDBCUtil.getConnection(); // 같은 패키지에 있는 클래스는 import 작업이 불필요
			pstmt=conn.prepareStatement(Q_LIST);//쿼리를 실행할 statement 객체 생성
			rs=pstmt.executeQuery();
			rs.next();
			totalCount=rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<WriteDTO> selectListPage(Map<String, Object> map){
		List<WriteDTO> QList= new Vector<WriteDTO>();
		String query=" "+"SELECT * FROM (" + " SELECT Tb.*, ROWNUM rNum FROM ("+"SELECT * FROM questiontbl";
		if(map.get("searchWord")!=null){
			query+=" where" +map.get("searchField")+"LIKE '%"+map.get("searchWord")+"%'";
		}
		query+=" ORDER BY idx DESC"+" )Tb"+")"+"WHERE rNum BETWEEN ? AND ?";
		try {
			conn=JDBCUtil.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				WriteDTO wt=new WriteDTO();
				wt.setIdx(rs.getInt(1));
				wt.setTitle(rs.getString(2));
				wt.setContent(rs.getString(3));
				wt.setNick(rs.getString(4));
				wt.setExpertnick(rs.getString(5));
				wt.setPostdate(rs.getDate(6));
				wt.setOfile(rs.getString(7));
				wt.setSfile(rs.getString(8));
				wt.setVisitcount(rs.getInt(9));
				QList.add(wt);
			}
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return QList;
		
	}
	
	public WriteDTO selectAView(String idx) {
		WriteDTO wt=new WriteDTO();
		String query="SELECT * FROM announcetbl where idx=?";
		try {
			conn=JDBCUtil.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				wt.setIdx(rs.getInt(1));
				wt.setTitle(rs.getString(2));
				wt.setContent(rs.getString(3));
				wt.setNick(rs.getString(4));
				wt.setPostdate(rs.getDate(5));
				wt.setOfile(rs.getString(6));
				wt.setSfile(rs.getString(7));
				wt.setVisitcount(rs.getInt(8));
			}
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return wt;
	}
	
	public WriteDTO selectQView(String idx) {
		WriteDTO wt=new WriteDTO();
		String query="SELECT * FROM questiontbl where idx=?";
		try {
			conn=JDBCUtil.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				wt.setIdx(rs.getInt(1));
				wt.setTitle(rs.getString(2));
				wt.setContent(rs.getString(3));
				wt.setNick(rs.getString(4));
				wt.setExpertnick(rs.getString(5));
				wt.setPostdate(rs.getDate(6));
				wt.setOfile(rs.getString(7));
				wt.setSfile(rs.getString(8));
				wt.setVisitcount(rs.getInt(9));
			}
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return wt;
	}
	
	
	public void updateVisitCount(String idx) throws SQLException {
		conn=JDBCUtil.getConnection();
		String query="UPDATE questiontbl SET visitcount=visitcount+1 where idx=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, idx);
		pstmt.executeUpdate();
	}
	
	public int deleteQ(String idx) {
		int result=0;
		String query="DELETE * FROM questiontbl where idx=?";
		try {
			conn=JDBCUtil.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,idx);
			result=pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

