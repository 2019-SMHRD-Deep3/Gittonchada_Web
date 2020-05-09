package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private static MemberDAO dao;
	private MemberDAO() {
		
	}
	
	public static MemberDAO getDAO() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	
	// 접속 메소드
	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "solgit";
			String db_pw = "solgit";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	// 연결 종료 메소드
	private void close() {
		try {
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 회원가입
	public int join(MemberDTO dto) {

		int cnt = 0;

		try {

			getConnection();
			String sql = "insert into MEMBER values(member_Seq.nextval,?,?,?,?,?,0)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getBirth());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getPhone());
			//psmt.setInt(6, dto.getManager());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 회원수정
		public int edit(MemberDTO dto) {

			int cnt = 0;

			try {

				getConnection();
				String sql = "UPDATE MEMBER SET MEMBER_Email=?, MEMBER_Birth=?, MEMBER_Name=?, MEMBER_Phone=? WHERE MEMBER_Seq=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getEmail());
				psmt.setString(2, dto.getBirth());
				psmt.setString(3, dto.getName());
				psmt.setString(4, dto.getPhone());
				psmt.setString(5, dto.getSeq());
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
	
		
	// 로그인
	public MemberDTO login(MemberDTO dto) {
		MemberDTO info = null;
		
		String l_seq = null;
		String l_email = null;
		String l_pw = null;
		String l_birth = null;
		String l_name = null;
		String l_phone = null;
		int l_manager;

		try {
			
			
			getConnection();

			String sql = "select * from MEMBER where MEMBER_EMAIL=? and MEMBER_PW=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				 rs.getString(1);
				 rs.getString(2);
				 rs.getString(3);
				l_seq = rs.getString("MEMBER_SEQ");
				l_email = rs.getString("MEMBER_EMAIL");
				l_pw = rs.getString("MEMBER_PW");
				l_birth = rs.getString("MEMBER_BIRTH");
				l_name = rs.getString("MEMBER_NAME");
				l_phone = rs.getString("MEMBER_PHONE");
				l_manager = rs.getInt("MEMBER_MANAGER");
				
//				System.out.println(l_seq);
//				System.out.println(l_phone);
//				System.out.println(l_manager);
				info = new MemberDTO(l_seq, l_email, l_pw, l_birth, l_name, l_phone, l_manager);
//				System.out.println(info.getEmail());
//				System.out.println(info.getSeq());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close();
			
		}
		
		return info;
	}
	
	
//	 회원정보 수정
//	public int updateUser(MemberDTO dto) {
//		int cnt = 0;
//		
//		
//		try {
//			getConnection();
//			String sql = "update MEMBER set MEMBER_PW=?,MEMBER_NM=?,MEMBER_EMAIL=? where MEMBER_ID=?";
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, dto.getPw());
//			psmt.setString(2, dto.getNm());
//			psmt.setString(3, dto.getEmail());
//			psmt.setString(4, dto.getId());
//			
//			cnt = psmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//				
//		return cnt;
//	}

}
