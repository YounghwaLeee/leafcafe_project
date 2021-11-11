package com.leaf.myapp.vo;

public class RegisterVO {
	
	private String userid;
	private String userpwd;
	private String username;
	private String birth;
	private int membership;
	private String regdate;
	
	private String addr; //통합 주소
	private String addr1;//우편번호
	private String addr2;//주소
	private String addr3;//상세주소
	private String addr4;//참고항목
	
	
	private String auth;
	private String publeYear;
	// ����ó
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	// �̸���
	private String email;
	private String emailid; // @��
	private String domain; // @��	
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBirth() {
		birth=publeYear;
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
		
		
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
	// �̸���
	public String getEmail() {
		email = emailid+"@"+domain;
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		
		if(email!=null) {
			String[] mail = email.split("@");
			this.emailid = mail[0];
			this.domain = mail[1];
		}
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}

	// ����ó
	public String getTel() {
		if(tel!=null) {
			tel1 = tel.substring(0,3);
			tel2 = tel.substring(3,7);
			tel3 = tel.substring(7);
		}else {
			tel = tel1+tel2+tel3;
		}
			
		return tel;
	}
	public void setTel(String tel) {
		
		this.tel = tel;
		
			}
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
	public String getPubleYear() {
		return publeYear;
	}
	public void setPubleYear(String publeYear) {
		this.publeYear = publeYear;
	}
	
	public String getAddr() {
		addr = addr1+"/"+addr2+"/"+addr3+"/"+addr4;
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
		
		String a[]=addr.split("/");
		addr1=a[0];
		addr2=a[1];
		addr3=a[2];
		addr4=a[3];
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getAddr4() {
		return addr4;
	}
	public void setAddr4(String addr4) {
		this.addr4 = addr4;
	}

}
