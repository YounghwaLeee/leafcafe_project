package com.leaf.myapp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.OpenService;
import com.leaf.myapp.vo.OpenPageVO;
import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OpenRequestVO;

@Controller
public class OpenQuestionController {
	
	@Inject
	OpenService openService;	
	
	// 창업문의 
	@RequestMapping("/openRequest")
	public ModelAndView franchiseRequest(HttpSession ses, OpenRequestVO orqVo) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)ses.getAttribute("logid");
		String username = (String)ses.getAttribute("logname");		
		
		if(userid==null) {
			mav.setViewName("register/login");
			return mav;
		}else {
			orqVo = openService.openUserPageGoInfo(userid);		
			
			orqVo.setUserid(userid);
			orqVo.setUsername(username);
			mav.addObject("orqVo",orqVo);
			mav.setViewName("open/openRequest");			
			return mav;
		}		
	}
	
	// 창업문의자 정보저장
	@RequestMapping(value="/registerOpenRequest", method=RequestMethod.POST)
	public ModelAndView registerOpenRequest(OpenRequestVO oprVo, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		String content = oprVo.getContent();
		oprVo.setContent(content.replace("\r\n", "<br>"));
		
		String userid = (String)ses.getAttribute("logid");		
		oprVo.setUserid(userid);
		int result = openService.openRequestInfo(oprVo);
		
		if(result>0) {
			mav.addObject("oprVo", oprVo);		
			mav.addObject("result",1);
		}else {
			mav.addObject("result",2);
		}
		mav.setViewName("franchise/franchiseRequestResult");
		return mav;
	}
	
	// 창업문의 페이지로 접속요청이 들어오면
	@RequestMapping("/openQuestionPage")
	public ModelAndView openquestionPage(HttpSession ses) {
		ModelAndView mav = new ModelAndView();		
		String authid = (String)ses.getAttribute("logid");
		
		if(authid==null || authid=="") {
			mav.setViewName("open/openAccessRefuse");
			return mav;
		}
		
		int authResult = openService.authOpenAccess(authid);// 7200번(가맹관리부)만 접근가능		
		if(authResult==0) {			
//			mav.addObject("noRegiEmp", "noEmp");
			mav.setViewName("open/openAccessRefuse");
			return mav;
		}else if(authResult==7200) {
			mav.setViewName("open/openMain");
			return mav;
		}else {
//			mav.addObject("noAcessEmp", authResult);
			mav.setViewName("open/openAccessRefuse");
			return mav;
		}
		
		
	}	
	
	// 창업문의 검색(작성자,내용)
	@RequestMapping("/openQuestionSearch")
	@ResponseBody
	public Map<String,Object> searchOpenQuestionList(OpenPageVO pVo){	
		
		int totalRecord = openService.openListpage(pVo.getSearchKey(),pVo.getSearchWord(), pVo.getOq_status());		

		pVo.setTotalRecord(totalRecord);

		

		int lastPageRecode = pVo.getTotalRecord()%pVo.getOnePageRecord();
		  
		  if(pVo.getTotalPage()==pVo.getNowPage() && lastPageRecode!=0) {
			  pVo.setOnePageRecord(lastPageRecode); 
		  }else {
			  pVo.setOnePageRecord(pVo.getOnePageRecord()); 
		  }

		  Map<String,Object> openMap = new HashMap<String,Object>(); 
		  openMap.put("pvo",pVo);
		  openMap.put("openvo",openService.searchOpenQuestionList(pVo));

		return openMap;
	}
		
	
	// 창업문의 내용보기
	@RequestMapping("/openReplyView")
	@ResponseBody
	public ModelAndView openReplyGo(int oq_num, HttpSession ses,OpenRequestReplyVO rpvo) {
		ModelAndView mav = new ModelAndView();
		
		rpvo = openService.openReplyExist(oq_num); // 답변존재하는지 id검색=> 검색값 vo셋팅(있으면 작성자id/ 없다면 nouserid 셋팅)
		String rpcon = rpvo.getRpcon();
		
		if(!rpvo.getUserid().equals("nouserid")) {	// 답변이 존재한다면 답변자 이름가져와서 셋팅		
			rpvo = openService.openReplyWriter(rpvo.getUserid(),oq_num); // 존재한 답변자 id의 이름셋팅 (로그인한 아이디와 비교X)			
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}else {
			rpvo.setUsername("nousername");
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}

		
		String loginadmin = (String)ses.getAttribute("logid");// 로그인한 유저아이디 가져오기


		if(loginadmin.equals(rpvo.getUserid())) { // 로그인한 아이디와 답변글 작성자 아이디가 일치하면
			rpvo.setUserid(loginadmin);
		}else {
			rpvo.setUserid("nosamereplyid");
		}
		
		String replyLastDay = openService.openReplyLastDate(oq_num);// 최종답변일 가져오기
		rpvo.setRpldate(replyLastDay);
		
		
		OpenRequestVO  oq = openService.openBoardInfo(oq_num);
		String otel = oq.getTel1();
		String stel = oq.getTel2();
		String ttel = oq.getTel3();
		String realtel = otel+"-"+stel+"-"+ttel;		
		
		oq.setRealtel(realtel);	
		
		mav.addObject("oqVo", oq);
		mav.addObject("rpvo",rpvo);		
		mav.setViewName("open/openReply");
		
		return mav;
	}
	
	// 창업문의 게시글 리스트
	@RequestMapping("/openReplyViewList")
	@ResponseBody
	public Map<String, Object> replyList(int oq_num, HttpSession ses,OpenRequestReplyVO rpvo){
		Map<String, Object> rplist = new HashMap<String, Object>();
		
		rpvo = openService.openReplyExist(oq_num); // 답변존재하는지 id검색=> 검색값 vo셋팅(있으면 작성자id/ 없다면 nouserid 셋팅)
		String rpcon = rpvo.getRpcon();
		
		if(!rpvo.getUserid().equals("nouserid")) {	// 답변이 존재한다면 답변자 이름가져와서 셋팅		
			rpvo = openService.openReplyWriter(rpvo.getUserid(),oq_num); // 존재한 답변자 id의 이름셋팅 (로그인한 아이디와 비교X)			
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}else {
			rpvo.setUsername("nousername");
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}

		
		String loginadmin = (String)ses.getAttribute("logid");// 로그인한 유저아이디 가져오기


		if(loginadmin.equals(rpvo.getUserid())) { // 로그인한 아이디와 답변글 작성자 아이디가 일치하면
			rpvo.setUserid(loginadmin);
		}else {
			rpvo.setUserid("nosamereplyid");
		}
		
		String replyLastDay = openService.openReplyLastDate(oq_num);// 최종답변일 가져오기
		rpvo.setRpldate(replyLastDay);
		
		OpenRequestVO  oq = openService.openBoardInfo(oq_num);
		
		rplist.put("oqlistvo", (OpenRequestVO)oq);
		rplist.put("rplistvo", (OpenRequestReplyVO)rpvo);	
		
		return rplist;
	}
	
	
	// 창업문의 답변쓰기
	@RequestMapping(value="/openReplyWrite",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> openReplyWrite(OpenRequestReplyVO rpvo, OpenRequestVO oqvo, HttpSession ses) {
		
		Map<String, Object> openreplymap = new HashMap<String, Object>(); // 게시글정보와 답변내용 가져오기
		rpvo.setUserid((String)ses.getAttribute("logid"));
		
		int replyInsertResult = openService.openReplyWriteInsert(rpvo);

		String replyLastDay = openService.openReplyLastDate(oqvo.getOq_num());// 최종답변일 가져오기
		rpvo.setRpldate(replyLastDay);
		
		if(replyInsertResult<=0) {
			rpvo.setReplyinsertresult(0);
		}else {
			openService.openReplyWriteOk(rpvo.getOq_num()); // 답변상태 나중에 트랜잭션 필요(미처리)
			oqvo.setOq_status("답변완료");
		}

		openreplymap.put("openvo",(OpenRequestVO)oqvo);		
		openreplymap.put("replyvo",(OpenRequestReplyVO)rpvo);
		
		return openreplymap;
	}
	
	// 답변 수정하기
	@RequestMapping(value="/openReplyEdit",method=RequestMethod.POST)
	@ResponseBody
	public OpenRequestReplyVO openReplyEdit(int oq_num, String rpcon) {		
		OpenRequestReplyVO orvo = new OpenRequestReplyVO();		
				
		int rp_num = openService.openReplyEditNum(oq_num);// oq_num으로 rp_num 가져오기	
		
		String replyLastDay = openService.openReplyLastDate(oq_num);// 최종답변일 가져오기
		orvo.setRpldate(replyLastDay);
		
		int replyEditResult = openService.openReplyEdit(rp_num, rpcon);
		orvo.setRpcon(rpcon);
		
		if(replyEditResult<=0) {
			orvo.setReplyeditresult(0);
			orvo.setRp_num(rp_num);
		}else {
			orvo.setRpcon(rpcon);
			orvo.setRp_num(rp_num);
		}		
		return orvo;
	}
	
	// 답변 삭제하기
	@RequestMapping(value="/openReplyDelete",method=RequestMethod.POST)
	@ResponseBody
	public OpenRequestVO openReplyDelete(int oq_num) {
		OpenRequestVO oqvo = new OpenRequestVO();
		
		int rp_num = openService.openReplyEditNum(oq_num);
		
		int replyDeleteResult = openService.openReplyDelete(rp_num); // 문의 답변삭제
		
		if(replyDeleteResult>0) { // 삭제완료시
			// 답변대기로 업데이트하기
			openService.openReplyDeleteResult(oq_num);
			oqvo.setOq_status("답변대기");
		}else {
			oqvo.setReplyexist(1);
		}
		return oqvo;
	}
}
