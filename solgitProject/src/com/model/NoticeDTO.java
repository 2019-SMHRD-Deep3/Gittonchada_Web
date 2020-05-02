package com.model;

public class NoticeDTO {
	
	private int notice_idx;
	private String notice_id;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private int notice_hit;
	
	public NoticeDTO(int notice_idx, String notice_id, String notice_title, String notice_content, String notice_date,
			int notice_hit) {
		super();
		this.notice_idx = notice_idx;
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_hit = notice_hit;
	}
	
	//공지사항 작성
	public NoticeDTO(String notice_id, String notice_title, String notice_content) {
		super();
		//this.notice_idx = notice_idx;
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		//this.notice_date = notice_date;
		//this.notice_hit = notice_hit;
	}
	
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}

}
