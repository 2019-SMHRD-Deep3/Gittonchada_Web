package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeDAO {

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
	
	// 공지글 작성
	public int insertNotice(NoticeDTO dto) {
		
		int cnt=0;
		
		try {

			getConnection();
			String sql = "insert into notice values(NOTICE_seq.NEXTVAL,?,?,?,SYSDATE,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNotice_id());
			psmt.setString(2, dto.getNotice_title());
			psmt.setString(3, dto.getNotice_content());
			psmt.setInt(4, 0);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 공지글 목록 불러오기
	public ArrayList<NoticeDTO> selectNotice() {
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();

		try {
			getConnection();
			String sql = "select * from NOTICE order by notice_idx desc ";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int notice_idx = rs.getInt(1);
				String notice_id = rs.getString(2);
				String notice_title = rs.getString(3);
				String notice_content = rs.getString(4);
				String notice_date = rs.getString(5);
				int notice_num = rs.getInt(6);

				NoticeDTO dto = new NoticeDTO(notice_idx, notice_id, notice_title, notice_content, notice_date, notice_num);
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
		
	// 공지글 작성 내역 불러오기
			public NoticeDTO selectOneNotice(int idx) {
				NoticeDTO dto = null;
				try {
					getConnection();
					String sql = "select * from Notice where notice_idx=?";
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, idx);
					rs = psmt.executeQuery();
					while(rs.next()) {
						int notice_idx = rs.getInt(1);
						String notice_id = rs.getString(2);
						String notice_title = rs.getString(3);
						String notice_content = rs.getString(4);
						String notice_date = rs.getString(5);
						int notice_num = rs.getInt(6);
						//System.out.println(board_idx);
						dto = new  NoticeDTO(notice_idx, notice_id, notice_title, notice_content, notice_date, notice_num);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close();
				}
				return dto;
			}

			public void deleteNotice(int post_idx) {
				try {
					//System.out.println("deletePost"+post_seq);
					getConnection();
					 String sql = "delete from Notice where Notice_Idx=?";
					
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, post_idx);
					rs = psmt.executeQuery();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close();
				}
				
			}
	}
