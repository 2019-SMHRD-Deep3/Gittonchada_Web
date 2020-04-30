package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class BoardDAO {

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
	
	
	// 게시글 작성
		public int insertPost(BoardDTO dto) {

			int cnt = 0;

			try {

				getConnection();
				String sql = "insert into board values(BOARD_IDX.NEXTVAL,?,?,?,?,SYSDATE,?,?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getBoard_id());
				psmt.setString(2, dto.getBoard_pw());
				psmt.setString(3, dto.getBoard_title());
				psmt.setString(4, dto.getBoard_content());
				psmt.setInt(5, 0);
				psmt.setString(6, dto.getLock_post());
				psmt.setInt(7, dto.getMember_seq());
				cnt = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;

		}

		// 게시글 리스트 불러오기
		public ArrayList<BoardDTO> selectPost() {
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

			try {
				getConnection();
				String sql = "select * from BOARD";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while (rs.next()) {
					int board_idx = rs.getInt(1);
					String board_id = rs.getString(2);
					String board_pw = rs.getString(3);
					String board_title = rs.getString(4);
					String board_content = rs.getString(5);
					String board_date = rs.getString(6);
					int board_num = rs.getInt(7);
					String lock_post=rs.getString(8);
					int member_seq = rs.getInt(9);

					BoardDTO dto = new BoardDTO(board_idx, board_id, board_pw, board_title, board_content, board_date, board_num, lock_post, member_seq);
					list.add(dto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}

			return list;
		}
		
		// 게시글 작성 내역 불러오기
		public BoardDTO selectOnePost(int idx) {
			BoardDTO dto = null;
			try {
				getConnection();
				String sql = "select * from BOARD where board_idx=?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, idx);
				rs = psmt.executeQuery();
				while(rs.next()) {
					int board_idx = rs.getInt(1);
					String board_id = rs.getString(2);
					String board_pw = rs.getString(3);
					String board_title = rs.getString(4);
					String board_content = rs.getString(5);
					String board_date = rs.getString(6);
					int board_num = rs.getInt(7);
					String lock_post=rs.getString(8);
					int member_seq = rs.getInt(9);
					//System.out.println(board_idx);
					dto = new BoardDTO(board_idx, board_id, board_pw, board_title, board_content, board_date, board_num, lock_post, member_seq);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
			return dto;
		}
	
	
}
