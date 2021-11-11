package com.leaf.myapp.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.leaf.myapp.vo.ProductVO;
import com.leaf.myapp.vo.RegisterVO;


public interface ProductService {
	public List<ProductVO> ProductList();
	public List<ProductVO> NoProductList();//발주할때 입고된 목록 보는 리스트(재고x)
	public List<ProductVO> ProductPartner(int hq_num);
	public int Purchase_RegisterOk(ProductVO vo);//발주하기
	public List<ProductVO> purchaseList(String userid);//가맹점이 보는 발주리스트 (가맹점페이지)
	public List<ProductVO> purchaseListAll();// 본사가 보는 전체가맹점 발주리스트(본사페이지) 
	public int purchaseDel(List<Integer> purchaseDel);//가맹점이 발주한거 삭제하기 
	public List<ProductVO> WarehousingList();//본사에서 보는 입고리스트
	public int Warehousing_RegisterOk(ProductVO vo);//입고등록
	public int purchaseConfirm(ProductVO vo);//본사에서 확인버튼 0->1
	public int purchaseConfirmCnt(ProductVO vo);//본사에서 확인버튼-> 입고수량 줄어드는거
	public List<ProductVO> inventory();//재고리스트
	public List<ProductVO> selectItems();//  입고상품등록 할때 제품 리스트 보여주는거 
	public int items_RegisterOk(ProductVO vo);//제품등록
	public List<ProductVO> selectPartner();//  파트너가져오기
	public ProductVO ware_cntAll(int hq_num);
	public ProductVO pc_cntAll(int hq_num);
	void excelDown(ProductVO vo, HttpServletResponse response) throws Exception;
	public ProductVO mypage(String userid);
	}
