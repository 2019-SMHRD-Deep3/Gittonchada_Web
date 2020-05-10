package com.model;

public class ReplyDTO {

	private int reply_idx;
	private String reply_id;
	private String reply_pw;
	private String reply_content;
	private String reply_date;
	private int board_idx;
	private int member_seq;
	
	public ReplyDTO(int reply_idx, String reply_id, String reply_pw, String reply_content, String reply_date,
			int board_idx, int member_seq) {
		super();
		this.reply_idx = reply_idx;
		this.reply_id = reply_id;
		this.reply_pw = reply_pw;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.board_idx = board_idx;
		this.member_seq = member_seq;
	}
	public ReplyDTO(String reply_id, String reply_content, int board_idx, int member_seq) {
		super();
		//this.reply_idx = reply_idx;
		this.reply_id = reply_id;
		//this.reply_pw = reply_pw;
		this.reply_content = reply_content;
		//this.reply_date = reply_date;
		this.board_idx = board_idx;
		this.member_seq = member_seq;
		
	}
	
	public ReplyDTO(int board_idx) {
		this.board_idx=board_idx;
	}
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_pw() {
		return reply_pw;
	}
	public void setReply_pw(String reply_pw) {
		this.reply_pw = reply_pw;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	
	
}
