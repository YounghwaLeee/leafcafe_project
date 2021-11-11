package com.leaf.myapp.vo;

public class OpenRequestReplyVO {
	private int rp_num;  // �亯��ȣ
	private String rpdate; // �ۼ���
	private String rpldate; // ����������
	private String rpcon; // �亯����
	private int oq_num; // ���� �Խù�ȣ
	private String content;
	private String userid; // ���Ͱ����� �ۼ��� ���̵�
	private String username; // ���Ͱ����� �ۼ��� ���� �̸�
	
	private int replyinsertresult=1; // �亯��� ���� (1:����, 0:����)
		
	private int replyeditresult=1;// ��ۼ�������
	private int replydeleteresult=1;// ��ۻ�������
	
	
	private String openrequestwrtiedate;
	
	
	
	
	public String getOpenrequestwrtiedate() {
		return openrequestwrtiedate;
	}
	public void setOpenrequestwrtiedate(String openrequestwrtiedate) {
		this.openrequestwrtiedate = openrequestwrtiedate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRp_num() {
		return rp_num;
	}
	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}
	public String getRpdate() {
		return rpdate;
	}
	public void setRpdate(String rpdate) {
		this.rpdate = rpdate;
	}
	public String getRpldate() {
		return rpldate;
	}
	public void setRpldate(String rpldate) {
		this.rpldate = rpldate;
	}
	public String getRpcon() {
		return rpcon;
	}
	public void setRpcon(String rpcon) {
		this.rpcon = rpcon;
	}
	public int getOq_num() {
		return oq_num;
	}
	public void setOq_num(int oq_num) {
		this.oq_num = oq_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getReplyinsertresult() {
		return replyinsertresult;
	}
	public void setReplyinsertresult(int replyinsertresult) {
		this.replyinsertresult = replyinsertresult;
	}
	public int getReplyeditresult() {
		return replyeditresult;
	}
	public void setReplyeditresult(int replyeditresult) {
		this.replyeditresult = replyeditresult;
	}
	public int getReplydeleteresult() {
		return replydeleteresult;
	}
	public void setReplydeleteresult(int replydeleteresult) {
		this.replydeleteresult = replydeleteresult;
	}
	
	
	
	
}
