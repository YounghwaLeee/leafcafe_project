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
	
	// â������ 
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
	
	// â�������� ��������
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
	
	// â������ �������� ���ӿ�û�� ������
	@RequestMapping("/openQuestionPage")
	public ModelAndView openquestionPage(HttpSession ses) {
		ModelAndView mav = new ModelAndView();		
		String authid = (String)ses.getAttribute("logid");
		
		if(authid==null || authid=="") {
			mav.setViewName("open/openAccessRefuse");
			return mav;
		}
		
		int authResult = openService.authOpenAccess(authid);// 7200��(���Ͱ�����)�� ���ٰ���		
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
	
	// â������ �˻�(�ۼ���,����)
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
		
	
	// â������ ���뺸��
	@RequestMapping("/openReplyView")
	@ResponseBody
	public ModelAndView openReplyGo(int oq_num, HttpSession ses,OpenRequestReplyVO rpvo) {
		ModelAndView mav = new ModelAndView();
		
		rpvo = openService.openReplyExist(oq_num); // �亯�����ϴ��� id�˻�=> �˻��� vo����(������ �ۼ���id/ ���ٸ� nouserid ����)
		String rpcon = rpvo.getRpcon();
		
		if(!rpvo.getUserid().equals("nouserid")) {	// �亯�� �����Ѵٸ� �亯�� �̸������ͼ� ����		
			rpvo = openService.openReplyWriter(rpvo.getUserid(),oq_num); // ������ �亯�� id�� �̸����� (�α����� ���̵�� ��X)			
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}else {
			rpvo.setUsername("nousername");
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}

		
		String loginadmin = (String)ses.getAttribute("logid");// �α����� �������̵� ��������


		if(loginadmin.equals(rpvo.getUserid())) { // �α����� ���̵�� �亯�� �ۼ��� ���̵� ��ġ�ϸ�
			rpvo.setUserid(loginadmin);
		}else {
			rpvo.setUserid("nosamereplyid");
		}
		
		String replyLastDay = openService.openReplyLastDate(oq_num);// �����亯�� ��������
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
	
	// â������ �Խñ� ����Ʈ
	@RequestMapping("/openReplyViewList")
	@ResponseBody
	public Map<String, Object> replyList(int oq_num, HttpSession ses,OpenRequestReplyVO rpvo){
		Map<String, Object> rplist = new HashMap<String, Object>();
		
		rpvo = openService.openReplyExist(oq_num); // �亯�����ϴ��� id�˻�=> �˻��� vo����(������ �ۼ���id/ ���ٸ� nouserid ����)
		String rpcon = rpvo.getRpcon();
		
		if(!rpvo.getUserid().equals("nouserid")) {	// �亯�� �����Ѵٸ� �亯�� �̸������ͼ� ����		
			rpvo = openService.openReplyWriter(rpvo.getUserid(),oq_num); // ������ �亯�� id�� �̸����� (�α����� ���̵�� ��X)			
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}else {
			rpvo.setUsername("nousername");
			rpvo.setRpcon(rpcon);
			rpvo.setOq_num(oq_num);
		}

		
		String loginadmin = (String)ses.getAttribute("logid");// �α����� �������̵� ��������


		if(loginadmin.equals(rpvo.getUserid())) { // �α����� ���̵�� �亯�� �ۼ��� ���̵� ��ġ�ϸ�
			rpvo.setUserid(loginadmin);
		}else {
			rpvo.setUserid("nosamereplyid");
		}
		
		String replyLastDay = openService.openReplyLastDate(oq_num);// �����亯�� ��������
		rpvo.setRpldate(replyLastDay);
		
		OpenRequestVO  oq = openService.openBoardInfo(oq_num);
		
		rplist.put("oqlistvo", (OpenRequestVO)oq);
		rplist.put("rplistvo", (OpenRequestReplyVO)rpvo);	
		
		return rplist;
	}
	
	
	// â������ �亯����
	@RequestMapping(value="/openReplyWrite",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> openReplyWrite(OpenRequestReplyVO rpvo, OpenRequestVO oqvo, HttpSession ses) {
		
		Map<String, Object> openreplymap = new HashMap<String, Object>(); // �Խñ������� �亯���� ��������
		rpvo.setUserid((String)ses.getAttribute("logid"));
		
		int replyInsertResult = openService.openReplyWriteInsert(rpvo);

		String replyLastDay = openService.openReplyLastDate(oqvo.getOq_num());// �����亯�� ��������
		rpvo.setRpldate(replyLastDay);
		
		if(replyInsertResult<=0) {
			rpvo.setReplyinsertresult(0);
		}else {
			openService.openReplyWriteOk(rpvo.getOq_num()); // �亯���� ���߿� Ʈ����� �ʿ�(��ó��)
			oqvo.setOq_status("�亯�Ϸ�");
		}

		openreplymap.put("openvo",(OpenRequestVO)oqvo);		
		openreplymap.put("replyvo",(OpenRequestReplyVO)rpvo);
		
		return openreplymap;
	}
	
	// �亯 �����ϱ�
	@RequestMapping(value="/openReplyEdit",method=RequestMethod.POST)
	@ResponseBody
	public OpenRequestReplyVO openReplyEdit(int oq_num, String rpcon) {		
		OpenRequestReplyVO orvo = new OpenRequestReplyVO();		
				
		int rp_num = openService.openReplyEditNum(oq_num);// oq_num���� rp_num ��������	
		
		String replyLastDay = openService.openReplyLastDate(oq_num);// �����亯�� ��������
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
	
	// �亯 �����ϱ�
	@RequestMapping(value="/openReplyDelete",method=RequestMethod.POST)
	@ResponseBody
	public OpenRequestVO openReplyDelete(int oq_num) {
		OpenRequestVO oqvo = new OpenRequestVO();
		
		int rp_num = openService.openReplyEditNum(oq_num);
		
		int replyDeleteResult = openService.openReplyDelete(rp_num); // ���� �亯����
		
		if(replyDeleteResult>0) { // �����Ϸ��
			// �亯���� ������Ʈ�ϱ�
			openService.openReplyDeleteResult(oq_num);
			oqvo.setOq_status("�亯���");
		}else {
			oqvo.setReplyexist(1);
		}
		return oqvo;
	}
}
