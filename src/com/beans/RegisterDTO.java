package com.beans;

public class RegisterDTO {
	private String memberidfront;
	private String memberidback;
	private String memberidbackself;
	private String password;
	private String nickname;
	private String memberid;
	private String storeid;
	private String storename;
	private String expertid;
	
	public String getMemberidfront() {
		return memberidfront;
	}
	public void setMemberidfront(String memberidfront) {
		this.memberidfront = memberidfront;
	}
	public String getMemberidback() {
		return memberidback;
	}
	public void setMemberidback(String memberidback) {
		this.memberidback = memberidback;
	}
	public String getMemberidbackself() {
		return memberidbackself;
	}
	public void setMemberidbackself(String memberidbackself) {
		this.memberidbackself = memberidbackself;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
}
