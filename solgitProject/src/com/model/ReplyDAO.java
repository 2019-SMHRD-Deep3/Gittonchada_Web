package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReplyDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private void getConnection() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "solgit";
			String db_pw = "solgit";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// 댓글 작성
	public int insertReply(ReplyDTO dto) {
		
		int cnt=0;
		try {

			getConnection();
			String sql = "insert into reply values(reply_seq.NEXTVAL,?,?,?,SYSDATE,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getReply_id());
			psmt.setString(2, dto.getReply_pw());
			psmt.setString(3, dto.getReply_content());
			psmt.setInt(4, dto.getBoard_idx());
			psmt.setInt(5, 0);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 댓글 목록 불러오기
	public ArrayList<ReplyDTO> selectReply(int idx){
		ArrayList<ReplyDTO> reple_list = new ArrayList<ReplyDTO>();
		
		try {
			getConnection();
			String sql = "select * from REPLY where board_idx=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int reply_idx = rs.getInt(1);
				String reply_id = rs.getString(2);
				String reply_pw = rs.getString(3);
				String reply_content = rs.getString(4);
				String reply_date = rs.getString(5);
				int board_idx = rs.getInt(6);
				int member_seq = rs.getInt(7);

				ReplyDTO dto = new ReplyDTO(reply_idx, reply_id, reply_pw, reply_content, reply_date, board_idx, member_seq);
				reple_list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return reple_list;
		
	}

	public int deleteReply(int idx) {
		int board_idx = 0;
		try {
			System.out.println(idx);
			getConnection();
			String sql_select = "select * from reply where reply_idx=?";
			psmt = conn.prepareStatement(sql_select);
			psmt.setInt(1, idx);
			rs=psmt.executeQuery();
			while(rs.next()) {
				board_idx = rs.getInt(6);
			}
			String sql = "delete from reply where reply_idx=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_idx;
	}
	
}
