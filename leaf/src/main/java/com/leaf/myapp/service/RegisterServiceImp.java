package com.leaf.myapp.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.RegisterDAO;
import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OrderListVO;
import com.leaf.myapp.vo.RegisterVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class RegisterServiceImp implements RegisterService {
   @Inject
   RegisterDAO registerdao;

   @Override
   public int registerOk(RegisterVO vo) {
      
      return registerdao.registerOk(vo);
   }

   @Override
   public int idCheck(String userid) {
      
      return registerdao.idCheck(userid);
   }
   @Override //문자인증
   public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

       String api_key = "NCS4SHKDY9DSSQEC";
       String api_secret = "ZXD4KLFCHNJA89ICRGPT8ECNRXJ4DUO9";
       Message coolsms = new Message(api_key, api_secret);

       // 4 params(to, from, type, text) are mandatory. must be filled
       HashMap<String, String> params = new HashMap<String, String>();
       params.put("to", phoneNumber);    // 수신전화번호
       params.put("from", "01095528191");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
       params.put("type", "SMS");
       params.put("text", "leaf아이디 찾기 : 인증번호는" + "["+cerNum+"]" + "입니다.");
      

       try {
           JSONObject obj = (JSONObject) coolsms.send(params);
           System.out.println(obj.toString());
       } catch (CoolsmsException e) {
           System.out.println(e.getMessage());
           System.out.println(e.getCode());
       }
       

   }

@Override //아이디 찾기
public String sendNumber(String tel, String username) {
	
	return registerdao.sendNumber(tel,username);
	}

@Override//로그인
public RegisterVO loginSelect(RegisterVO vo) {
	
	return registerdao.loginSelect(vo);
}

@Override
public String emailAddress(String tel) {
	
	return registerdao.emailAddress(tel);
}


@Override
public int passwordUpdate(String tel, String email, String userpwd) {
	
	return registerdao.passwordUpdate(tel,email,userpwd);
}


  @Override public RegisterVO mypage(String id) {
	  return registerdao.mypage(id);
  }

@Override
public int mypageOk(RegisterVO rgVo) {
	
	return registerdao.mypageOk(rgVo);
}

@Override
public List<OrderListVO> orderList(String id) {
	// TODO Auto-generated method stub
	return registerdao.orderList(id);
}

@Override
public List<OpenRequestReplyVO> openReply(String id) {
	// TODO Auto-generated method stub
	return registerdao.openReply(id);
}
 


}
