package com.leaf.myapp.vo;

public class FranNoticeVO {
	
	private int no;
	private String title;
	private String writedate;
	private int hit;
	private String userid;
	private String content;
	private int[] delCheck;
		
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int[] getDelCheck() {
		return delCheck;
	}
	public void setDelCheck(int[] delCheck) {
		this.delCheck = delCheck;
	}
	
	
}


