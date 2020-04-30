package com.model;

public class MemberDTO {
	private String seq;
	private String email;
	private String pw;
	private String birth;
	private String name;
	private String phone;
	private int manager;
	
	// 회원정보
	public MemberDTO(String email, String pw, String birth, String name, String phone) {
		super();
		this.email = email;
		this.pw = pw;
		this.birth = birth;
		this.name = name;
		this.phone = phone;
	}

	// 회원 전체 정보
	public MemberDTO(String seq, String email, String pw, String birth, String name, String phone, int manager) {
		this.seq = seq;
		this.email = email;
		this.pw = pw;
		this.birth = birth;
		this.name = name;
		this.phone = phone;
		this.manager = manager;
	}
	
	
	
	// 로그인
	public MemberDTO(String email, String pw) {
		this.email = email;
		this.pw = pw;
	}


	public MemberDTO(String email, String pw, String birth, String name, String phone, int i) {
		this.email = email;
		this.pw = pw;
		this.birth = birth;
		this.name = name;
		this.phone = phone;
		this.manager = 1;
	}

	// 겟터 & 셋터
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

}
