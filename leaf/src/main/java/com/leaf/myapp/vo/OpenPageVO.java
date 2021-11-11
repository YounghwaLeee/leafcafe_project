package com.leaf.myapp.vo;

public class OpenPageVO {
	private int totalRecord; // �� ���ڵ� ��
	private int nowPage=1; // ���� ������ ��ȣ
	private int totalPage; // �� ��������
	private int onePageRecord=10; //���������� ���ڵ� ��
	
	private int startPage=1;
	private int onePageViewNum=5; // 5���� ǥ��
	
	private String searchKey;
	private String searchWord;
	
	private int rnChange; // ���������� * ���������� ���ڵ� ��
	
	private String arrayOption; // ���� ����
	
	private String oq_status;// �亯���� (�亯���/�亯�Ϸ�)
	
	
	
	////////////
	public String getArrayOption() {
		return arrayOption;
	}
	public void setArrayOption(String arrayOption) {
		this.arrayOption = arrayOption;
	}
	
	
	/////////
	public int getRnChange() {
		return rnChange;
	}
	public void setRnChange(int rnChange) {
		this.rnChange = rnChange;
	}
	
	////////////
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		this.totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
	}
		
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		if(nowPage!=0) {
			this.startPage = (nowPage-1)/onePageViewNum*onePageViewNum+1;
			this.rnChange = nowPage*onePageRecord;			
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
	
	
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getOq_status() {
		return oq_status;
	}
	public void setOq_status(String oq_status) {
		this.oq_status = oq_status;
	}
	
	
	
	
	
}