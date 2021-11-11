package com.leaf.myapp.vo;

public class AdminSalesPageVO {
	private int totalRecord; // �� ���ڵ� ��
	private int nowPage=1; // ���� ������ ��ȣ
	private int totalPage; // �� ��������
	private int onePageRecord=5; //���������� ���ڵ� ��
	
	private int startPage=1;
	private int onePageViewNum=5; // 5���� ǥ��
	
	private int rnChange;
	
	private String searchWord;
	private String sdate; // ������
	private String edate; // ������
	

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		if(nowPage!=0) {
			startPage = (nowPage-1)/onePageViewNum*onePageViewNum+1;
			rnChange = nowPage*onePageRecord;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getOnePageViewNum() {
		return onePageViewNum;
	}

	public void setOnePageViewNum(int onePageViewNum) {
		this.onePageViewNum = onePageViewNum;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getRnChange() {
		return rnChange;
	}

	public void setRnChange(int rnChange) {
		this.rnChange = rnChange;
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
