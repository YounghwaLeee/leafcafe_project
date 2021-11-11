package com.leaf.myapp.vo;

public class OrderListVO {
	private String userid;
	private String od_time;
	private int od_cnt;
	private int p_price;
	private String p_name;
	private int menutotal;
	private String p_img;
	  
	
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOd_time() {
		return od_time;
	}
	public void setOd_time(String od_time) {
		this.od_time = od_time;
	}
	public int getOd_cnt() {
		return od_cnt;
	}
	public void setOd_cnt(int od_cnt) {
		this.od_cnt = od_cnt;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getMenutotal() {
		return menutotal;
	}
	public void setMenutotal(int menutotal) {
		this.menutotal = menutotal;
	}
	
}
