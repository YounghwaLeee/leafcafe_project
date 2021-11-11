package com.leaf.myapp.vo;

public class SalesVO {
	private int od_num; // 주문번호
	private int p_num; // 판매상품번호
	private int od_cnt; // 수량
	private int fc_num; // 가맹점번호
	private String od_time; // 주문시간
	private String userid; // 구매자아이디
	
	private String p_name; // 상품명
	private String m_code; // 중분류명
	private String fc_name; // 가맹점이름
	private String fc_addr; // 가맹점주소
	private int p_price; // 상품가격
	
	// 상단 숫자
	private int topTotalFran;
	private int topTotalBuyCnt;
	private int topTotalBuyUser;
	private int topTotalSales;
	
	
	// 계산
	private int rank;// 순위
	private int totalsales; // 총판매액
	private int totalcnt; // 총판매수량
	
	private String searchWord; // 검색어
	private String sdate; // 시작일
	private String edate; // 종료일
	
	
	
	public int getOd_num() {
		return od_num;
	}
	public void setOd_num(int od_num) {
		this.od_num = od_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getOd_cnt() {
		return od_cnt;
	}
	public void setOd_cnt(int od_cnt) {
		this.od_cnt = od_cnt;
	}
	public int getFc_num() {
		return fc_num;
	}
	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}
	public String getOd_time() {
		return od_time;
	}
	public void setOd_time(String od_time) {
		this.od_time = od_time;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
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
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getTotalsales() {
		return totalsales;
	}
	public void setTotalsales(int totalsales) {
		this.totalsales = totalsales;
	}
	public int getTotalcnt() {
		return totalcnt;
	}
	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	public int getTopTotalFran() {
		return topTotalFran;
	}
	public void setTopTotalFran(int topTotalFran) {
		this.topTotalFran = topTotalFran;
	}
	public int getTopTotalBuyCnt() {
		return topTotalBuyCnt;
	}
	public void setTopTotalBuyCnt(int topTotalBuyCnt) {
		this.topTotalBuyCnt = topTotalBuyCnt;
	}
	public int getTopTotalBuyUser() {
		return topTotalBuyUser;
	}
	public void setTopTotalBuyUser(int topTotalBuyUser) {
		this.topTotalBuyUser = topTotalBuyUser;
	}
	public int getTopTotalSales() {
		return topTotalSales;
	}
	public void setTopTotalSales(int topTotalSales) {
		this.topTotalSales = topTotalSales;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}

	
	
	
}
