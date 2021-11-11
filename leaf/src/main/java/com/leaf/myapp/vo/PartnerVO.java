package com.leaf.myapp.vo;

public class PartnerVO {
	
	private int part_num;  // ��Ʈ�ʹ�ȣ
	private String part_company; // ��Ʈ�� ��ü��
	private String part_name; // ��Ʈ�ʴ���ڸ�
	
	private String part_tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String part_email;
	
	private String part_code_name; // ��Ʈ�ʺз���
	private String part_regdate; // ��Ʈ�� �����
	
	
	
	
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public int getPart_num() {
		return part_num;
	}
	public void setPart_num(int part_num) {
		this.part_num = part_num;
	}
	public String getPart_company() {
		return part_company;
	}
	public void setPart_company(String part_company) {
		this.part_company = part_company;
	}
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public String getPart_tel() {
		if(tel2!=null) {
			part_tel = tel1+"-"+tel2+"-"+tel3;
		}
		return part_tel;
	}
	public void setPart_tel(String part_tel) {
		this.part_tel = part_tel;
		String[] AllTel = part_tel.split("-");
		this.tel1 = AllTel[0];
		this.tel2 = AllTel[1];
		this.tel3 = AllTel[2];
	}
	public String getPart_email() {
		return part_email;
	}
	public void setPart_email(String part_email) {
		this.part_email = part_email;
	}
	public String getPart_code_name() {
		return part_code_name;
	}
	public void setPart_code_name(String part_code_name) {
		this.part_code_name = part_code_name;
	}
	public String getPart_regdate() {
		return part_regdate;
	}
	public void setPart_regdate(String part_regdate) {
		this.part_regdate = part_regdate;
	}
	
	
	
	
}
