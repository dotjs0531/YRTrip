package com.yrtrip.app.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	
	//전체조회(폼)
	@RequestMapping("/getProductList")
	public ModelAndView getProductList(Paging paging, ProductVO vo) {
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(9);
		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		// 전체 건수
		paging.setTotalRecord(productService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("productList", productService.getProductList(vo));
		mv.setViewName("product/getProductList");
		return mv;
	}
	//퀵뷰
	@RequestMapping("getProductAjax")
	@ResponseBody
	public ProductVO getProduct(ProductVO vo) {
		return productService.getProduct(vo);
	}
	
	//상세조회(폼)
	@RequestMapping("/getProduct")
	public String getProduct(Model model, ProductVO vo) {
		model.addAttribute("product", productService.getProduct(vo));
		return "product/getProduct";
	}
	
	//제품등록폼
	@RequestMapping(value="/insertProduct", method=RequestMethod.GET)
	public String insertProductForm() {
		return "product/insertProduct";
	}
	
	//제품등록처리
	@RequestMapping(value="/insertProduct", method=RequestMethod.POST)
	public String insertProduct(ProductVO vo){
		productService.insertProduct(vo);
		return "redirect:getProductList";
	}
	
	//제품수정 폼
	@RequestMapping(value="/updateProduct", method=RequestMethod.GET)
	public String updateProductForm(Model model, ProductVO vo) {
		model.addAttribute("product", productService.getProduct(vo));
		return "product/updateProduct";
	}
	//제품수정처리
	@RequestMapping(value="/updateProduct", method = RequestMethod.POST)
	public String updateProduct(ProductVO vo){
		productService.updateProduct(vo);
		return "redirect:getProductList";
	}
	
	//제품 단건 삭제
	@RequestMapping("deleteProduct")
	public String deleteProdcut(ProductVO vo) {
		productService.deleteProduct(vo);
		return "redirect:getProductList";
	}
	/////////////////////////////////////////////////////////////
	
	
}
