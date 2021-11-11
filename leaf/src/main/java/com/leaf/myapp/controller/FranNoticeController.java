package com.leaf.myapp.controller;

import java.lang.reflect.Array;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.FranNoticeService;
import com.leaf.myapp.vo.FranNoticeVO;
import com.leaf.myapp.vo.FranPageVO;


@Controller
public class FranNoticeController {

@Inject
FranNoticeService frannoticeservice;

//검색어 
@RequestMapping("/FranSearch")
@ResponseBody
public List<FranNoticeVO> FranSearch(FranPageVO pVo){
	List<FranNoticeVO> fran=frannoticeservice.noticeAllSelect(pVo);
	
	//System.out.println("나와라"+frannoticeservice.noticeAllSelect(pVo).size());
	return fran;
	
}

//글목록
@RequestMapping("/franNotice")
	public ModelAndView noticeFranPage(FranPageVO pVo) {
	ModelAndView mv = new ModelAndView();
	
	//총레코드수
	pVo.setTotalRecord(frannoticeservice.totalRecordCount(pVo));
	System.out.println(pVo.getTotalRecord());
	System.out.println(pVo.getTotalPage());
	mv.setViewName("franNotice/franList");
	mv.addObject("list",frannoticeservice.noticeAllSelect(pVo));
	mv.addObject("pVo",pVo);
	return mv;
}

//글쓰기폼
@RequestMapping("/frannoticeWrite")
public String frannoticeWrite() {
	
	return "franNotice/franNoticeForm";
}


//글등록
@RequestMapping("/franNoticeWriteOk")
	public ModelAndView franNoticeWriteOk(HttpSession ses,FranNoticeVO vo) {
	
	ModelAndView mv= new ModelAndView();
	String userid=(String)ses.getAttribute("logid");
	vo.setUserid(userid);
	int cnt=frannoticeservice.franNoticeWriteOk(vo);
	if(cnt>0) {
		mv.setViewName("redirect:franNotice");

	}
	return mv;
	
}

//글내용보기
@RequestMapping("/frannoticeDetail")
public ModelAndView frannoticeDetail(int no) {
	ModelAndView mv= new ModelAndView();
	
	//뷰페이지만들고.
	mv.setViewName("franNotice/franNoticeDetail");
	mv.addObject("vo",frannoticeservice.frannoticeDetail(no));
	FranNoticeVO vo= frannoticeservice.frannoticeDetail(no);
	System.out.println(vo.getUserid());
	
	return mv;
}

//글수정 폼
@RequestMapping("/franNoticeEdit")
public ModelAndView franNoticeEdit(int no) {
	
	ModelAndView mv = new ModelAndView();
	
	mv.setViewName("franNotice/franNoticeEditOk");
	mv.addObject("vo",frannoticeservice.frannoticeDetail(no));
	
	
	return mv;
	
	}

//글수정확인버튼 눌렀을때
@RequestMapping("/franNoticeEditOk")
public ModelAndView franNoticeEditOk(HttpSession ses,FranNoticeVO vo) {
	
	ModelAndView mv= new ModelAndView();
	String userid=(String)ses.getAttribute("logid");
	vo.setUserid(userid);
	
	int result=frannoticeservice.franNoticeEditOk(vo);
	if(result>0) {
		mv.setViewName("redirect:frannoticeDetail");
		mv.addObject("no", vo.getNo());
	}
	return mv;
	
	}
//글삭제
@RequestMapping("/franNoticeDelete")
public ModelAndView franNoticeDelete(int no) {
	ModelAndView mv = new ModelAndView();
	System.out.println("ddd");
	int cnt = 0;
	cnt = frannoticeservice.franNoticeDelete(no);
	System.out.println(cnt);
	if(cnt!=0) {
	mv.setViewName("redirect:franNotice");
	}
	return mv;
	}

//선택항목 삭제

@RequestMapping(value="/frandeleteCheck",method=RequestMethod.POST)
public ModelAndView deleteCheck(FranNoticeVO vo) {
	ModelAndView mav = new ModelAndView();
	int result=frannoticeservice.delChk(vo.getDelCheck());
	System.out.println("삭제된레코드수 :"+result);
	mav.setViewName("redirect:franNotice");
	return mav;
}
}





