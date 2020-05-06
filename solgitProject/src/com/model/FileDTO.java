package com.model;

public class FileDTO {

	private int file_seq;
	private String file_name;
	private String file_local;
	private String file_content;
	private String file_date;
	private String file_check;
	private int member_seq;
	
	public FileDTO(int file_seq, String file_name, String file_local, String file_content, String file_date, String file_check,
			int member_seq) {
		super();
		this.file_seq = file_seq;
		this.file_name = file_name;
		this.file_local = file_local;
		this.file_content = file_content;
		this.file_date = file_date;
		this.file_check = file_check;
		this.member_seq = member_seq;
	}
	
	
	public FileDTO(String file_name, String file_local, String file_content, int member_seq) {
		super();
		this.file_name = file_name;
		this.file_local = file_local;
		this.file_content = file_content;
		this.member_seq = member_seq;
	}


	public String getFile_content() {
		return file_content;
	}
	public void setFile_content(String file_content) {
		this.file_content = file_content;
	}
	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_local() {
		return file_local;
	}
	public void setFile_local(String file_local) {
		this.file_local = file_local;
	}
	public String getFile_date() {
		return file_date;
	}
	public void setFile_date(String file_date) {
		this.file_date = file_date;
	}
	public String getFile_check() {
		return file_check;
	}
	public void setFile_check(String file_check) {
		this.file_check = file_check;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	
}
