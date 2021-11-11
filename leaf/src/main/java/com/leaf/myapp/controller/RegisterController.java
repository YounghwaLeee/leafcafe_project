package com.leaf.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.RegisterService;
import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OpenRequestVO;
import com.leaf.myapp.vo.OrderListVO;
import com.leaf.myapp.vo.RegisterVO;

@Controller
public class RegisterController {
   
	@Inject
	 RegisterService registerService;
	
	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	
	//로깅을 위한 변수
	private static final Logger logger= LoggerFactory.getLogger(RegisterController.class);
	private static final String String = null;
	
	//회원가입 페이지로 보내기   
	@RequestMapping("/register")
	public String register() {
	   return "register/register";
	}
	
	//회원가입 폼등록
	@RequestMapping(value="/registerOk" ,method=RequestMethod.POST)
	public ModelAndView registerOk(RegisterVO vo) {
	   
	   ModelAndView mv = new ModelAndView();
	   int cnt= registerService.registerOk(vo);
	   
	   if(cnt>0) {
	      mv.setViewName("register/login");
	   }else {
	      mv.setViewName("redirect:/register");
	   }
	   
	      return mv;
	}

	//마이페이지 수정폼
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession ses) {
		
		
		String id=(String)ses.getAttribute("logid");
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",registerService.mypage(id));
		List<OrderListVO> orderList = registerService.orderList(id);
		if(orderList!=null) {
			mv.addObject("orderList",orderList);
		}
//		List<OpenRequestReplyVO> openReply = registerService.openReply(id);
//		if(openReply!=null) {
//			mv.addObject("openReply",openReply);
//		}
		mv.setViewName("register/mypageEdit");
	   return mv;
	}
	
	//마이페이지 수정확인 버튼 눌렀을때
	@RequestMapping(value="/mypageOk", method=RequestMethod.POST)
	public ModelAndView mypageOk(HttpSession ses,RegisterVO rgVo) {
		ModelAndView mv = new ModelAndView();
			rgVo.setUserid((String)ses.getAttribute("logid"));
			int result=registerService.mypageOk(rgVo);
	 
	    	 if(result>0) {//수정성공
	    		 mv.setViewName("redirect:login");
	    	 }else { //수정실패
	    		 mv.setViewName("redirect:mypage");
	    	 }
	    	
	    	 return mv;
	    	
	    	 
	     }
	
	
	
	//id중복체크
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(String userid) {
	
	   int cnt= registerService.idCheck(userid);
	   return cnt;
	      
	   }
	//email인증
	@RequestMapping("/register/emailCheck")
	public String emailCheck() {
		return "register/emailCheck";
	}
	   
	//로그인폼
			@RequestMapping("/login")
			public String login() {
				return "register/login";
			}
	
	//로그인
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public  ModelAndView loginOk(RegisterVO vo, HttpSession ses) {
		
		ModelAndView mv= new ModelAndView();
		
		RegisterVO resultVO=registerService.loginSelect(vo);
		
		if(resultVO==null) { //로그인 실패
			mv.setViewName("redirect:login");
			
		}else { //로그인성공
			ses.setAttribute("logid", resultVO.getUserid());
			ses.setAttribute("logname", resultVO.getUsername());
			ses.setAttribute("membership", resultVO.getMembership());
			ses.setAttribute("auth", resultVO.getAuth());
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession ses) {
		ses.invalidate();
		ModelAndView mv= new ModelAndView();
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	
	@RequestMapping("/idOk")
	public String idSearch() {
	   return "register/id";
	}
	@RequestMapping("/pwdOk")
	public String pwSearch() {
	   return "register/pwd";
	}
	
	//카카오
	@RequestMapping("/kakao")
	public String kakao() {
		   return "register/kakao";
		}
	

// mailSending 코드
    @RequestMapping( value = "/emailSending" )
    @ResponseBody
    public int mailSending(String email) throws IOException {
    		
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        	System.out.println(email);
        String setfrom = "needagirl88@gmail.com";
        String tomail = email; // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
   
        
          System.out.println("ddd");   
        
        return dice;
        
    }
    
  //아이디 찾기,비밀번호 찾기 인증번호
    
    @RequestMapping("/check/sendSMS")
    @ResponseBody
    public String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        registerService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr; //인증번호
    }
    
 //  인증번호 확인
    @RequestMapping("/update/phone")
    @ResponseBody
    public String sendNumber(String tel, String username) {
    	System.out.println(tel+username);
    		String userid = registerService.sendNumber(tel,username);
    		System.out.println(userid);
    		return userid;
    	
    	
    	
    }
  //비밀번호 찾기 메일 보내기.
    @RequestMapping( value = "/update/emailNumber" )
    @ResponseBody
    public int emailNumber(String tel) throws IOException {
    	System.out.println("tel"+tel);
    	String email=registerService.emailAddress(tel);
    	System.out.println(email);
    	
		int result=0;
        char pwCollection[] = new char[] {
                '1','2','3','4','5','6','7','8','9','0',
                'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                '!','@','#','$','%','^','&','*','(',')'};//배열에 선언

        		String ranPw = "";
        		   for (int i = 0; i < 10; i++) {
        		        int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
        		        ranPw += pwCollection[selectRandomPw];
        		      }


        String setfrom = "needagirl88@gmail.com";
        String tomail = email; // 받는 사람 이메일
        String title = "새로운 비밀번호 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 새로운 비밀번호는 " +ranPw+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 비밀번호로 로그인 해주세요."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);//성공
            result=1;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
       
        int cnt=registerService.passwordUpdate(tel,email,ranPw);
        
        return result;
    }
    
    
    // 마이페이지 창업문의게시글
    @RequestMapping("/myPageOpenQuestion")
    public ModelAndView myPageOpenQuestion(OpenRequestVO oqVo, OpenRequestReplyVO rpVo, HttpSession ses) {
    	
    	String id = (String)ses.getAttribute("logid");
    	
    	List<OpenRequestReplyVO> rpList = new ArrayList<OpenRequestReplyVO>();
    	rpList = registerService.openReply(id);
    	
    	ModelAndView mav = new ModelAndView();
   	
    	if(rpList!=null) {
			mav.addObject("openReply",rpList);
			mav.setViewName("register/myPageOpenQuestion");
		} 	
    	
    	return mav;
    }
    @RequestMapping("/orderList")
	public ModelAndView orderList(HttpSession ses) {
		
		
		String id=(String)ses.getAttribute("logid");
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",registerService.mypage(id));
		List<OrderListVO> orderList = registerService.orderList(id);
		if(orderList!=null) {
			mv.addObject("orderList",orderList);
		}
		mv.setViewName("register/orderList");
	   return mv;
	}
}
