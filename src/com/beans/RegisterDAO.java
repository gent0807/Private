package com.beans;

import java.sql.*;
import java.util.*;

public class RegisterDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	final String USER_INSERT="insert into membertbl values(?, ?, ?);";
	final String USER_LIST="select * from membertbl;";
	final String EXPERT_INSERT="insert into registerexperttbl values(?,?,?);";
	final String EXPERT_LIST="select * from experttbl";
	final String REXPERT_LIST="select * from registerexperttbl";
	final String PRODUCER_INSERT="insert into registerproducertbl values(?,?,?,?);";
	final String PRODUCER_LIST="select * from producertbl";
	final String RPRODUCER_LIST="select * from registerproducertbl";
	
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
	
	public String findUserPassword(String email) throws SQLException{
		String password=null;
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement("select password from membertbl where memberid=(?)");
		pstmt.setString(1,email);
		rs=pstmt.executeQuery();
		while(rs.next()){
			password=rs.getString("password");
		}
		JDBCUtil.close(pstmt, conn);
		return password;
	}
	
	public void insertExpert(RegisterDTO mem) throws SQLException{
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(EXPERT_INSERT);
		pstmt.setString(1,makeId(mem.getMemberidfront(),mem.getMemberidback(),mem.getMemberidbackself()));
		pstmt.setString(2,mem.getPassword());
		pstmt.setString(3,mem.getNickname());
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt, conn);
	}
	
	public ArrayList<RegisterDTO> selectExpertList() throws SQLException {
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(EXPERT_LIST); //쿼리를 실행할 statement 객체 생성
		rs=pstmt.executeQuery();
		ArrayList<RegisterDTO> aList = new ArrayList<RegisterDTO>();
		while(rs.next()){
			RegisterDTO rd=new RegisterDTO();			
			rd.setMemberid(rs.getString("expertid"));
			rd.setPassword(rs.getString("password"));
			rd.setNickname(rs.getString("nickname"));
			aList.add(rd);
		}
		JDBCUtil.close(pstmt, conn);
		return aList;
		
	}
	

	public ArrayList<RegisterDTO> selectRExpertList() throws SQLException {
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(REXPERT_LIST); //쿼리를 실행할 statement 객체 생성
		rs=pstmt.executeQuery();
		ArrayList<RegisterDTO> aList = new ArrayList<RegisterDTO>();
		while(rs.next()){
			RegisterDTO rd=new RegisterDTO();			
			rd.setMemberid(rs.getString("expertid"));
			rd.setPassword(rs.getString("password"));
			rd.setNickname(rs.getString("nickname"));
			aList.add(rd);
		}
		JDBCUtil.close(pstmt, conn);
		return aList;
		
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
	
	public String expertCheck(RegisterDTO mem) throws SQLException {
		ArrayList<String> idlist=new ArrayList<String>();
		ArrayList<String> plist=new ArrayList<String>();
		String expertCheck=null;
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(EXPERT_LIST);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			idlist.add(rs.getString("expertid"));
			plist.add(rs.getString("password"));			
		}
		for(int i=0; i<idlist.size(); i++){
			if(mem.getMemberid().equals(idlist.get(i))){
				if(mem.getPassword().equals(plist.get(i))){
					expertCheck="ALLOK";
					return expertCheck;
					
				}
				else {
					expertCheck="IDOK";
					return expertCheck;
				}
			}
			expertCheck="NOTOK";
			
		}
		JDBCUtil.close(pstmt, conn);
		return expertCheck;		
	}
	
	public String findExpertPassword(String email) throws SQLException{
		String password=null;
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement("select password from experttbl where expertid=(?)");
		pstmt.setString(1,email);
		rs=pstmt.executeQuery();
		while(rs.next()){
			password=rs.getString("password");
		}
		JDBCUtil.close(pstmt, conn);
		return password;
	}
	
	
	public void insertProducer(RegisterDTO mem) throws SQLException{
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(PRODUCER_INSERT);
		pstmt.setString(1,makeId(mem.getMemberidfront(),mem.getMemberidback(),mem.getMemberidbackself()));
		pstmt.setString(2,mem.getPassword());
		pstmt.setString(3,mem.getStoreid());
		pstmt.setString(4,mem.getStorename());
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt, conn);
	}
	
	public ArrayList<RegisterDTO> selectProducerList() throws SQLException {
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(PRODUCER_LIST); //쿼리를 실행할 statement 객체 생성
		rs=pstmt.executeQuery();
		ArrayList<RegisterDTO> aList = new ArrayList<RegisterDTO>();
		while(rs.next()){
			RegisterDTO rd=new RegisterDTO();			
			rd.setMemberid(rs.getString("producerid"));
			rd.setPassword(rs.getString("password"));
			rd.setStoreid(rs.getString("storeid"));
			rd.setStorename(rs.getString("storename"));
			aList.add(rd);
		}
		JDBCUtil.close(pstmt, conn);
		return aList;
		
	}
	
	public ArrayList<RegisterDTO> selectRProducerList() throws SQLException {
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(RPRODUCER_LIST); //쿼리를 실행할 statement 객체 생성
		rs=pstmt.executeQuery();
		ArrayList<RegisterDTO> aList = new ArrayList<RegisterDTO>();
		while(rs.next()){
			RegisterDTO rd=new RegisterDTO();			
			rd.setMemberid(rs.getString("producerid"));
			rd.setPassword(rs.getString("password"));
			rd.setStoreid(rs.getString("storeid"));
			rd.setStorename(rs.getString("storename"));
			aList.add(rd);
		}
		JDBCUtil.close(pstmt, conn);
		return aList;
		
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
	
	public String[] producerCheck(RegisterDTO mem) throws SQLException {
		ArrayList<String> idlist=new ArrayList<String>();
		ArrayList<String> plist=new ArrayList<String>();
		ArrayList<String> nlist=new ArrayList<String>();
		ArrayList<String> silist=new ArrayList<String>();
		String[] producerCheck=new String[4];
		for(int i=0; i<producerCheck.length; i++) {
			producerCheck[i]="NO";
		}		
		System.out.println(producerCheck[0]+","+producerCheck[1]+","+producerCheck[2]+","+producerCheck[3]);
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement(PRODUCER_LIST);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			idlist.add(rs.getString("producerid"));
			plist.add(rs.getString("password"));
			nlist.add(rs.getString("storename"));
			silist.add(rs.getString("storeid"));
		}
		for(int i=0;i<idlist.size();i++){
			if(mem.getMemberid().equals(idlist.get(i))) {
				producerCheck[0]="OK";
			}
			if(mem.getPassword().equals(plist.get(i))) {
				producerCheck[1]="OK";
			}
			if(mem.getStorename().equals(nlist.get(i))) {
				producerCheck[2]="OK";
			}
			if(mem.getStoreid().equals(silist.get(i))) {
				producerCheck[3]="OK";
			}
		}
		System.out.println(producerCheck[0]+","+producerCheck[1]+","+producerCheck[2]+","+producerCheck[3]);
		return producerCheck;
	}
	
	public String findProducerPassword(String email) throws SQLException{
		String password=null;
		conn=JDBCUtil.getConnection();
		pstmt=conn.prepareStatement("select password from producertbl where producerid=(?)");
		pstmt.setString(1,email);
		rs=pstmt.executeQuery();
		while(rs.next()){
			password=rs.getString("password");
		}
		JDBCUtil.close(pstmt, conn);
		return password;
	}
	
	
	
}
