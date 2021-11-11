package com.leaf.myapp.vo;

public class MapVO {
	private String fc_name;
	private String fc_addr;
	private String lat;
	private String lon;
	private String searchMap;
	private int fc_num;
	private String fc_img;
	
	public int getFc_num() {
		return fc_num;
	}
	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}
	public String getFc_img() {
		return fc_img;
	}
	public void setFc_img(String fc_img) {
		this.fc_img = fc_img;
	}
	public String getSearchMap() {
		return searchMap;
	}
	public void setSearchMap(String searchMap) {
		this.searchMap = searchMap;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getFc_name() {
		return fc_name;
	}
	public void setFc_name(String fc_name) {
		this.fc_name = fc_name;
	}
	public String getFc_addr() {
		return fc_addr;
	}
	public void setFc_addr(String fc_addr) {
		this.fc_addr = fc_addr;
	}

}
