package com.leaf.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.NoticeService;
import com.leaf.myapp.vo.NoticePagingVO;
import com.leaf.myapp.vo.NoticeVO;


@Controller
public class NoticeController {
	@Inject
	NoticeService noticeService;
	
	//게시글 리스트
    @RequestMapping("/noticeList")
    public ModelAndView boardList(NoticePagingVO pVo, HttpSession ses) {
    	ModelAndView mav = new ModelAndView();
    	String userid=(String)ses.getAttribute("logid");
    	String auth = noticeService.checkAuto(userid);
    	System.out.println(auth+",auth");
		//총레코드수
    	pVo.setTotalRecord(noticeService.totalRecordCount(pVo));
    	System.out.println(pVo.getTotalRecord());
		mav.addObject("auth",auth);
    	mav.addObject("pVo",pVo);   
		mav.addObject("list", noticeService.noticePageSelect(pVo));
		mav.setViewName("notice/noticeList");			
				
		return mav;      
   }

	//게시글 리스트
/*	@RequestMapping("/noticeList")
	public ModelAndView noticeList(NoticePagingVO pVo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",noticeService.noticeAllSelect());
		mav.setViewName("notice/noticeList");
		return mav;
	}
		
	*/
	//게시글보기
	@RequestMapping("/noticeDetail")
	public ModelAndView noticeDetail(int no, NoticeVO vo) {
		ModelAndView mav = new ModelAndView();	
		vo.setHit(noticeService.hitCount(vo));		
		mav.addObject("noticeVo", noticeService.noticeView(no));		
		mav.setViewName("notice/noticeDetail");
		return mav;	
	}
	//글 삭제
	@RequestMapping("/noticeDelete")
	public ModelAndView NoticeDelete(int no) {
		int result = noticeService.noticeDel(no);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:noticeList");
		}else {
			mav.addObject("no", no);
			mav.setViewName("redirect:noticeDetail");
		}
		return mav;
	}
	//글 수정폼
	@RequestMapping("/noticeEdit")
	public ModelAndView noticeEdit(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", noticeService.noticeView(no));
		mav.setViewName("notice/noticeEdit");
		return mav;
	}
	//글수정
	@RequestMapping(value="/noticeEditOk", method=RequestMethod.POST)
	public ModelAndView noticeEditOk(NoticeVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid"));
		int result = noticeService.noticeEdit(vo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("no", vo.getNo());
			mav.setViewName("redirect:noticeDetail");
		}else {
			mav.addObject("msg","수정");
			mav.setViewName("notice/noticeResult");
		}
		return mav;
	}
	//글쓰기폼
	@RequestMapping("/noticeWrite")
	public String noticeWrite(){
		return "/notice/noticeForm";
	}
	//글쓰기
	@RequestMapping(value="/noticeWriteOk", method=RequestMethod.POST)
	public ModelAndView noticeWriteOk(NoticeVO vo, HttpSession session) {	
		String userid=(String)session.getAttribute("logid");
		vo.setUserid(userid);
		int writeResult = noticeService.noticeWrite(vo);
		ModelAndView mav = new ModelAndView();
		 if(writeResult>0) {
	         mav.setViewName("redirect:noticeList");
	     }else {
	         mav.setViewName("redirect:noticeWrite");
	     }
	     return mav;
	}
	//선택항목 삭제
	@RequestMapping(value="/deleteCheck",method=RequestMethod.POST)
	public ModelAndView deleteCheck(NoticeVO vo) {
		for(int i=0;i<vo.getDelCheck().length;i++) {
			int[] num = vo.getDelCheck();
			System.out.println(num[i]);
		}
		ModelAndView mav = new ModelAndView();
		int result=noticeService.delChk(vo.getDelCheck());
		mav.setViewName("redirect:noticeList");
		return mav;
	}

	//사회공헌 페이지
	@RequestMapping("/social")
	public String social() {
		return "/notice/social";
	}
}
