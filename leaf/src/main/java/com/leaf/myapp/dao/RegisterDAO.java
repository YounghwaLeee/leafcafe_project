package com.leaf.myapp.dao;


import java.util.List;

import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OrderListVO;
import com.leaf.myapp.vo.RegisterVO;

public interface RegisterDAO {
	
	public int idCheck(String userid);//아이디 중복체크 
	public int registerOk(RegisterVO vo);//회원가입
	public String idCheckOk(String userid, String tel); //아이디 찾기
	public String sendNumber(String tel, String username);//인증번호 확인.
	
	public RegisterVO loginSelect(RegisterVO vo);//로그인
	
	public String emailAddress(String tel);//전화번호로 이메일 주소 가져오기
	public int passwordUpdate(String tel,String email,String userpwd);//비밀번호가 업데이트
	
	//회원정보 수정 시 기존정보 선택 
     public RegisterVO mypage(String id);
     //회원수정정보 update
     public int mypageOk(RegisterVO rgVo);
     // 마이페이지 주문내역
     public List<OrderListVO> orderList(String id);
     //마이페이지 창업문의 내역
 	public List<OpenRequestReplyVO> openReply(String id);
     

}
