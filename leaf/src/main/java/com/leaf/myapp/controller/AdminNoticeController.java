package com.leaf.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.AdminNoticeService;
import com.leaf.myapp.vo.AdminNoticeVO;
import com.leaf.myapp.vo.AdminPageVO;
import com.leaf.myapp.vo.RegisterVO;


@Controller

  public class AdminNoticeController {
	@Inject
	AdminNoticeService adminnoticeService;
/*
	//�Խñ� ����Ʈ
    @RequestMapping("/adminnoticeMain")
    public ModelAndView adminnoticeList() {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", adminnoticeService.noticeAll());
    	mav.setViewName("adminNotice/noticeMain");
		return mav;      
   }
    
 * */
	//�Խñ� ����Ʈ
    @RequestMapping("/adminnoticeMain")
    public ModelAndView noticePageSelect(AdminPageVO pVo) {
    	ModelAndView mav = new ModelAndView();
       //�ѷ��ڵ��
    	pVo.setTotalRecord(adminnoticeService.totalRecordCount(pVo));
    	mav.addObject("pVo",pVo);   
		System.out.println("total record: " + pVo.getTotalRecord());
		
		mav.addObject("list", adminnoticeService.noticePageSelect(pVo));		
		System.out.println("list" + adminnoticeService.noticePageSelect(pVo).get(0).getAdmin_no());
		mav.setViewName("adminNotice/noticeMain");
		return mav;      
   }
    
	//�Խñۺ���
	@RequestMapping("/adminnoticeDetail")
	public ModelAndView noticeDetail(int no, AdminNoticeVO vo) {
		vo = adminnoticeService.noticeView(no);
		ModelAndView mav = new ModelAndView();
		vo.setAdmin_hit(adminnoticeService.hitCount(vo));
		mav.addObject("adminnoticeVo", vo);		
		mav.setViewName("adminNotice/adminnoticeDetail");
		return mav;	
	}
	//�۾�����
		@RequestMapping("/adminnoticeWrite")
		public String noticeWrite(){
			return "/adminNotice/noticeForm";
		}
	//�۾���
	@RequestMapping(value="/adminnoticeWriteOk", method=RequestMethod.POST)
	public ModelAndView noticeWriteOk(AdminNoticeVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid=(String)session.getAttribute("logid");
		vo.setUserid(userid);
		System.out.println(userid);
		adminnoticeService.adminnoticeWriteOk(vo);
		mav.addObject("userid", userid);
		mav.setViewName("redirect:adminnoticeMain");
		     return mav;
		}
	
	//�ۼ�����
	@RequestMapping("/adminnoticeEdit")
	public ModelAndView noticeEdit(int no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", adminnoticeService.noticeView(no));
		mav.setViewName("adminNotice/noticeEdit");
		return mav;
	}
	
	//�ۼ���
	@RequestMapping(value="/adminnoticeEditOk", method=RequestMethod.POST)
	public ModelAndView noticeEditOk(AdminNoticeVO vo, HttpSession ses) {
		String userid=(String)ses.getAttribute("logid");
		vo.setUserid(userid);
		ModelAndView mav = new ModelAndView();
		adminnoticeService.adminnoticeEditOk(vo);
			mav.addObject("no", vo.getAdmin_no());
			mav.setViewName("redirect:adminnoticeDetail");

		return mav;
	}
	//�� ����
	@RequestMapping("/adminnoticeDel")
	public ModelAndView adminnoticeDel(int no, HttpSession session) {
		String userid=(String)session.getAttribute("logid");
		
		
		int result = adminnoticeService.adminnoticeDel(no, userid);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
		mav.setViewName("redirect:adminnoticeMain");
		}else {
			mav.setViewName("redirect:adminnoticeDetail");
		}
		return mav;
	}
	
}
