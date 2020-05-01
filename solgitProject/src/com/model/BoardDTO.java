package com.model;

public class BoardDTO {

	private int board_idx;
	private String board_id;
	private String board_pw;
	private String board_title;
	private String board_content;
	private String board_date;
	private int board_num;
	private String lock_post;
	private int member_seq;
	


	public BoardDTO(int board_idx, String board_id, String board_pw, String board_title, String board_content,
			String board_date, int board_num, String lock_post, int member_seq) {
		super();
		this.board_idx = board_idx;
		this.board_id = board_id;
		this.board_pw = board_pw;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_num = board_num;
		this.lock_post = lock_post;
		this.member_seq = member_seq;
	}
/// 게시글 작성하기
	public BoardDTO(String board_id, String board_pw, String board_title, String board_content,String lock_post,
			 int board_num) {
		//this.board_idx = board_idx;
		this.board_id = board_id;
		this.board_pw = board_pw;
		this.board_title = board_title;
		this.board_content = board_content;
		this.lock_post = lock_post;
	}
/// 게시글 작성하기2
	public BoardDTO(String board_id, String board_pw, String board_title, String board_content,String lock_post) {
		//this.board_idx = board_idx;
		this.board_id = board_id;
		this.board_pw = board_pw;
		this.board_title = board_title;
		this.board_content = board_content;
		this.lock_post = lock_post;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getBoard_pw() {
		return board_pw;
	}

	public void setBoard_pw(String board_pw) {
		this.board_pw = board_pw;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getLock_post() {
		return lock_post;
	}

	public void setLock_num(String lock_post) {
		this.lock_post = lock_post;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public void setLock_post(String lock_post) {
		this.lock_post = lock_post;
	}
	
}
