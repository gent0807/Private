package com.beans;

import java.sql.*;
import java.util.*;

public class RegisterDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	final String USER_INSERT="insert into membertbl values(?, ?, ?);";
	final String USER_LIST="select * from membertbl;";
	final String PRODUCER_INSERT="insert into producertbl values(?,?,?);";
	final String PRODUCER_LIST="select * from producertbl";
	final String EXPERT_INSERT="insert into experttbl values(?,?,?);";
	final String EXPERT_LIST="select * from experttbl";		
	
	public String makeId(String memberidfront, String memberidback, String memberidbackself){
		String memberid=null;
		if(memberidback.equals("self")){
			memberid=memberidfront+"@"+memberidbackself;
		}
		else{
			memberid=memberidfront+"@"+memberidback;
		}
		return memberid;
	}
 		
	public void insertMember(RegisterDTO mem) throws SQLException {
		conn=JDBCUtil.getConnection(); // 같은 패키지에 있는 클래스는 import 작업이 불필요
		pstmt=conn.prepareStatement(USER_INSERT);//쿼리를 실행할 statement 객체 생성
		pstmt.setString(1,makeId(mem.getMemberidfront(),mem.getMemberidback(),mem.getMemberidbackself()));
		pstmt.setString(2,mem.getPassword());
		pstmt.setString(3,mem.getNickname() );
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt, conn);
	}
	
	public ArrayList<RegisterDTO> selectMemberList() throws SQLException {
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(USER_LIST); //쿼리를 실행할 statement 객체 생성
		rs=pstmt.executeQuery();
		ArrayList<RegisterDTO> aList = new ArrayList<RegisterDTO>();
		while(rs.next()){
			RegisterDTO rd=new RegisterDTO();			
			rd.setMemberid(rs.getString("memberid"));
			rd.setPassword(rs.getString("password"));
			rd.setNickname(rs.getString("nickname"));
			aList.add(rd);
		}
		JDBCUtil.close(pstmt, conn);
		return aList;
		
	}
	
	public String check(RegisterDTO mem) throws SQLException {
		ArrayList<String> idlist=new ArrayList<String>();
		ArrayList<String> plist=new ArrayList<String>();
		String check=null;
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(USER_LIST);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			idlist.add(rs.getString("memberid"));
			plist.add(rs.getString("password"));			
		}
		for(int i=0; i<idlist.size(); i++){
			if(mem.getMemberid().equals(idlist.get(i))){
				if(mem.getPassword().equals(plist.get(i))){
					check="ALLOK";
					return check;
					
				}
				else {
					check="IDOK";
					return check;
				}
			}
			check="NOTOK";
			
		}
		JDBCUtil.close(pstmt, conn);
		return check;
		
		
	}
	
	public void insertExpert(RegisterDTO mem) throws SQLException{
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(EXPERT_INSERT);
	}
	
	public String expertIsin(RegisterDTO mem) throws SQLException{
		String expertIsin="NO";
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(EXPERT_LIST);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			if(mem.getMemberid().equals(rs.getString("expertid"))) {
				expertIsin="YES";
				return expertIsin;
			}
		}
		return expertIsin;
	}
	
	public void insertProducer(RegisterDTO mem) throws SQLException{
		conn=JDBCUtil.getConnection(); // 같은 패키지에 있는 클래스는 import 작업이 불필요
		pstmt=conn.prepareStatement(PRODUCER_INSERT);
	}
	
	public String producerIsin(RegisterDTO mem) throws SQLException{
		String producerIsin="NO";
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(PRODUCER_LIST);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			if(mem.getMemberid().equals(rs.getString("producerid"))) {
				producerIsin="YES";
				return producerIsin;
			}
		}
		return producerIsin;
	}
	
	
	
}
