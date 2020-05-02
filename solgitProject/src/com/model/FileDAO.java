package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FileDAO {

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
	
	// file upload
	public int insertFile(FileDTO dto) {
		int cnt=0;
		
		try {
			getConnection();
			String sql="insert into Load_File values(File_seq.nextval,?,?,sysdate,'대기중',?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getFile_name());
			psmt.setString(2, dto.getFile_local());
			psmt.setInt(3, dto.getMember_seq());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	// 파일 리스트 불러오기
	public ArrayList<FileDTO> selectFileList(int idx){
		ArrayList<FileDTO> file_list = new ArrayList<FileDTO>();
		try {
			getConnection();
			String sql = "select * from Load_File where member_seq=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			while(rs.next()) {
				int file_seq=rs.getInt(1);
				String file_name=rs.getString(2);
				String file_local=rs.getString(3);
				String file_date=rs.getString(4);
				String file_check=rs.getString(5);
				int member_seq=rs.getInt(6);
				FileDTO dto = new FileDTO(file_seq, file_name, file_local, file_date, file_check, member_seq);
				file_list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return file_list;
	}
}
