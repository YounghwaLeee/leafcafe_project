package com.leaf.myapp.vo;

public class MenuVO {
	private int p_num;
	private String m_code;
	private String s_code;

	private String p_name;
	private String p_ename;
	private int p_price;
	private String p_desc;
	private String p_info;
	private String p_info1;
	private String p_info2;
	private String p_info3;
	private String p_info4;
	private String p_info5;
	private String p_info6;
	private String p_info7;
	
	private String new_best;
	private String p_img;
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public String getP_ename() {
		return p_ename;
	}
	public void setP_ename(String p_ename) {
		this.p_ename = p_ename;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_desc() {
		return p_desc;
	}
	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}
	public String getP_info() {
		if(p_info1!=null) {
			p_info = p_info1 + "/" + p_info2 + "/" + p_info3 + "/" + p_info4 + "/" + p_info5 + "/" + p_info6 + "/" + p_info7;			
		}
		return p_info;
	}
	
	public void setP_info(String p_info) {
		this.p_info = p_info;
		
		//영양정보 / 로 분류하여 1234567에 대입한다.
		String p[]=p_info.split("/");
		p_info1 = p[0];
		p_info2 = p[1];
		p_info3 = p[2];
		p_info4 = p[3];
		p_info5 = p[4];
		p_info6 = p[5];
		p_info7 = p[6];
	}
	public String getNew_best() {
		return new_best;
	}
	public void setNew_best(String new_best) {
		this.new_best = new_best;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_info1() {
		return p_info1;
	}
	public void setP_info1(String p_info1) {
		this.p_info1 = p_info1;
	}
	public String getP_info2() {
		return p_info2;
	}
	public void setP_info2(String p_info2) {
		this.p_info2 = p_info2;
	}
	public String getP_info3() {
		return p_info3;
	}
	public void setP_info3(String p_info3) {
		this.p_info3 = p_info3;
	}
	public String getP_info4() {
		return p_info4;
	}
	public void setP_info4(String p_info4) {
		this.p_info4 = p_info4;
	}
	public String getP_info5() {
		return p_info5;
	}
	public void setP_info5(String p_info5) {
		this.p_info5 = p_info5;
	}
	public String getP_info6() {
		return p_info6;
	}
	public void setP_info6(String p_info6) {
		this.p_info6 = p_info6;
	}
	public String getP_info7() {
		return p_info7;
	}
	public void setP_info7(String p_info7) {
		this.p_info7 = p_info7;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	
}
