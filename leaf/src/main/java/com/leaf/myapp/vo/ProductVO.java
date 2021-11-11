package com.leaf.myapp.vo;

import java.util.List;

public class ProductVO {
	//입고 vo
	private int hq_num;
	private String hq_name;
	private int ware_price;
	private String ware_date;
	private int ware_cnt;
	private int emp_num;
	private int ware_num;
	//파트너 vo
	private int part_num;
	private String part_company;
	private String part_name;
	private String part_tel;
	private String part_email;
	private String part_code_name;
	private String part_regdate;
	
	//발주 vo
	private int pc_num;
	private int pc_cnt;
	private String pc_date;
	private int order_status;

	//가맹점 vo
	private int fc_num;
	private String fc_name;
	private String fc_tel;
	private String fc_boss;
	private String fc_hours;
	private String fc_transport;
	private String fc_addr;
	private String userid;

	//여러개의 발주 번호 담을 변수
	private List<Integer> purchaseDel;
	
	//여러개의 본사재고상품 번호 담을 변수
	private List<Integer> warehousingDel;
	
	//재고 수량
	private int inventory;
	private int ware_cntAll;
	private int pc_cntAll;

	public int getWare_cntAll() {
		return ware_cntAll;
	}
	public void setWare_cntAll(int ware_cntAll) {
		this.ware_cntAll = ware_cntAll;
	}
	public int getPc_cntAll() {
		return pc_cntAll;
	}
	public void setPc_cntAll(int pc_cntAll) {
		
		this.pc_cntAll = pc_cntAll;
		inventory = ware_cntAll - pc_cntAll;
	}
	public int getWare_num() {
		return ware_num;
	}
	public void setWare_num(int ware_num) {
		this.ware_num = ware_num;
	}
	public int getInventory() {
		return inventory;
		
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public List<Integer> getWarehousingDel() {
		return warehousingDel;
	}
	public void setWarehousingDel(List<Integer> warehousingDel) {
		this.warehousingDel = warehousingDel;
	}
	public List<Integer> getPurchaseDel() {
		return purchaseDel;
	}
	public void setPurchaseDel(List<Integer> purchaseDel) {
		this.purchaseDel = purchaseDel;
	}
	public int getHq_num() {
		return hq_num;
	}
	public void setHq_num(int hq_num) {
		this.hq_num = hq_num;
	}
	public int getWare_price() {
		return ware_price;
	}
	public void setWare_price(int ware_price) {
		this.ware_price = ware_price;
	}
	public int getWare_cnt() {
		return ware_cnt;
	}
	public void setWare_cnt(int ware_cnt) {
		this.ware_cnt = ware_cnt;
	}
	public String getWare_date() {
		return ware_date;
	}
	public void setWare_date(String ware_date) {
		this.ware_date = ware_date;
	}
	public int getPart_num() {
		return part_num;
	}
	public void setPart_num(int part_num) {
		this.part_num = part_num;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public String getHq_name() {
		return hq_name;
	}
	public void setHq_name(String hq_name) {
		this.hq_name = hq_name;
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
		return part_tel;
	}
	public void setPart_tel(String part_tel) {
		this.part_tel = part_tel;
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
	public int getPc_num() {
		return pc_num;
	}
	public void setPc_num(int pc_num) {
		this.pc_num = pc_num;
	}
	public int getPc_cnt() {
		return pc_cnt;
	}
	public void setPc_cnt(int pc_cnt) {
		this.pc_cnt = pc_cnt;
	}
	public String getPc_date() {
		return pc_date;
	}
	public void setPc_date(String pc_date) {
		this.pc_date = pc_date;
	}
	public int getFc_num() {
		return fc_num;
	}
	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public String getFc_name() {
		return fc_name;
	}
	public void setFc_name(String fc_name) {
		this.fc_name = fc_name;
	}
	public String getFc_tel() {
		return fc_tel;
	}
	public void setFc_tel(String fc_tel) {
		this.fc_tel = fc_tel;
	}
	public String getFc_boss() {
		return fc_boss;
	}
	public void setFc_boss(String fc_boss) {
		this.fc_boss = fc_boss;
	}
	public String getFc_hours() {
		return fc_hours;
	}
	public void setFc_hours(String fc_hours) {
		this.fc_hours = fc_hours;
	}
	public String getFc_transport() {
		return fc_transport;
	}
	public void setFc_transport(String fc_transport) {
		this.fc_transport = fc_transport;
	}
	public String getFc_addr() {
		return fc_addr;
	}
	public void setFc_addr(String fc_addr) {
		this.fc_addr = fc_addr;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
}
