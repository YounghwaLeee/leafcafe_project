package com.leaf.myapp.vo;

public class FranPageVO {
	
	private int totalRecord;//총레코드수 
	private int nowPage=1;// 현재페이지 현재 페이지 정보를 넣어주면 무조건 1page
	private int totalPage; //총페이지수
	private int OnePageRecord=5;//한페이지당 레코드수 (나중에 얘를 10으로 바꿔주면 한페이지
	
	private int onePageNumCount=5; //한번에 5페이지씩 보이게 하겠다. 
	private int startPage=1;//한 화면에 보이는 첫번째 페이지 버튼 숫자.  
	private int lastPage=5;
	
	private String searchKeyword; //검색어
	
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getTotalRecord() {
		
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		//총 레코드수가 구해지면 총 페이지 수를 구하겠다.
		this.totalRecord = totalRecord;
		
		totalPage=(int)Math.ceil(totalRecord/(double)OnePageRecord);
		//총페이지수 계산할때는 둘중에 하나를 실수를 만들어서 계산한다.
		if(nowPage==totalPage) {
			lastPage=totalRecord%OnePageRecord;
			
	}
	

	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		if(nowPage!=0) {
			//			현재페이지     한번에 표시할 페이지 수 
			startPage = (nowPage-1)/onePageNumCount*onePageNumCount+1;
		}
		System.out.println(nowPage);
		System.out.println(totalPage);
		
		
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getOnePageRecord() {
		return OnePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		OnePageRecord = onePageRecord;
	}
	public int getOnePageNumCount() {
		return onePageNumCount;
	}
	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
		
	
	}

}
