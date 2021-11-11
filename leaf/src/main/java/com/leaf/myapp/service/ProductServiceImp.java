package com.leaf.myapp.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.ProductDAO;
import com.leaf.myapp.vo.MenuVO;
import com.leaf.myapp.vo.ProductVO;
import com.leaf.myapp.vo.RegisterVO;



@Service
public class ProductServiceImp implements ProductService{
	@Inject
	ProductDAO productDAO;
	RegisterService registerService;
	@Override
	public List<ProductVO> ProductList() {
		// TODO Auto-generated method stub
		return productDAO.ProductList();
	}


	@Override
	public List<ProductVO> WarehousingList() {
		// TODO Auto-generated method stub
		return productDAO.WarehousingList();
	}

	@Override
	public int Warehousing_RegisterOk(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.Warehousing_RegisterOk(vo);
	}


	@Override
	public List<ProductVO> ProductPartner(int hq_num) {
		// TODO Auto-generated method stub
		return productDAO.ProductPartner(hq_num);
	}


	@Override
	public int Purchase_RegisterOk(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.Purchase_RegisterOk(vo);
	}


	@Override
	public List<ProductVO> purchaseList(String userid) {
		// TODO Auto-generated method stub
		return productDAO.purchaseList(userid);
	}


	@Override
	public List<ProductVO> purchaseListAll() {
		// TODO Auto-generated method stub
		return productDAO.purchaseListAll();
	}



	@Override
	public int purchaseConfirm(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.purchaseConfirm(vo);
	}


	@Override
	public int purchaseDel(List<Integer> purchaseDel) {
		// TODO Auto-generated method stub
		return productDAO.purchaseDel(purchaseDel);
	}


	@Override
	public int purchaseConfirmCnt(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.purchaseConfirmCnt(vo);
	}


	@Override
	public List<ProductVO> inventory() {
		// TODO Auto-generated method stub
		return productDAO.inventory();
	}


	@Override
	public List<ProductVO> selectItems() {
		// TODO Auto-generated method stub
		return productDAO.selectItems();
	}


	@Override
	public int items_RegisterOk(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.items_RegisterOk(vo);
	}


	@Override
	public List<ProductVO> selectPartner() {
		// TODO Auto-generated method stub
		return productDAO.selectPartner();
	}


	@Override
	public ProductVO ware_cntAll(int hq_num) {
		// TODO Auto-generated method stub
		return productDAO.ware_cntAll(hq_num);
	}


	@Override
	public ProductVO pc_cntAll(int hq_num) {
		// TODO Auto-generated method stub
		return productDAO.pc_cntAll(hq_num);
	}


	@Override
	public List<ProductVO> NoProductList() {
		// TODO Auto-generated method stub
		return productDAO.NoProductList();
	}


	@Override
	   public void excelDown(ProductVO vo, HttpServletResponse response) throws Exception {
	   try {
		   List<ProductVO> testList = productDAO.WarehousingList();
	      //Excel Down 
	      Workbook workbook = new HSSFWorkbook();

	      
	      Sheet sheet = workbook.createSheet("입고관리");
	     

	      Row row = null;
	      Cell cell = null;
	      int rowNo = 0;

	      
	      String[] headerArray = {"NO", "업체분류","제품명","입고가격","입고수량","거래처명","담당자","거래처번호","연락처","입고날짜"};

	      row = sheet.createRow(rowNo++);

	      for(int i=0; i<headerArray.length; i++) {

	      cell = row.createCell(i);

	      cell.setCellValue(headerArray[i]);

	      }
	      for(ProductVO excelData : testList ) {

	          row = sheet.createRow(rowNo++);
	          cell = row.createCell(0);
	          cell.setCellValue(excelData.getWare_num());

	          cell = row.createCell(1);
	          cell.setCellValue(excelData.getPart_code_name());

	          cell = row.createCell(2);
	          cell.setCellValue(excelData.getHq_name());

	          cell = row.createCell(3);
	          cell.setCellValue(excelData.getWare_price());

	          cell = row.createCell(4);
	          cell.setCellValue(excelData.getWare_cnt());

	          cell = row.createCell(5);
	          cell.setCellValue(excelData.getPart_company());
	          
	          cell = row.createCell(6);
	          cell.setCellValue(excelData.getPart_name());
	          
	          cell = row.createCell(7);
	          cell.setCellValue(excelData.getPart_tel());
	          
	          cell = row.createCell(8);
	          cell.setCellValue(excelData.getPart_email());
	          
	          cell = row.createCell(9);
	          cell.setCellValue(excelData.getWare_date());
	      }

	      
	      response.setContentType("ms-vnd/excel");
	      response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode("입고관리.xls", "UTF-8"));

	      
	      workbook.write(response.getOutputStream());
	      } catch (Exception e) {
	      }
	   }


	@Override
	public ProductVO mypage(String userid) {
		// TODO Auto-generated method stub
		return productDAO.mypage(userid);
	}
	}
