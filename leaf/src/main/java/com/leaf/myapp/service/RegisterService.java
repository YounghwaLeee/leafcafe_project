package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OrderListVO;
import com.leaf.myapp.vo.RegisterVO;

public interface RegisterService {
	public int registerOk(RegisterVO vo);
	public int idCheck(String userid);
	public void certifiedPhoneNumber(String phoneNumber, String cerNum);
	
	public String sendNumber(String tel, String username);
	public RegisterVO loginSelect(RegisterVO vo);
	public String emailAddress(String tel);


	public int passwordUpdate(String tel,String email,String userpwd);
//	
	public RegisterVO mypage(String id);
	//회원정보 update
	public int mypageOk(RegisterVO rgVo);
	//mypage 주문내역
	public List<OrderListVO> orderList(String id);
	public List<OpenRequestReplyVO> openReply(String id);

	

}
