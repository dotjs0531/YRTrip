package com.yrtrip.app.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	
	//전체 목록 보기
	@RequestMapping("/getProductList")
	public String getProductList(Model model, ProductVO vo) {
		model.addAttribute("productlist", productService.getProductList(vo));
		return "product/getProductList";
	}
	//퀵뷰
	@RequestMapping("getProductAjax")
	@ResponseBody
	public ProductVO getProduct(ProductVO vo) {
		return productService.getProduct(vo);
	}
	
	//상세조회
	@RequestMapping("getProduct")
	public String getProduct(Model model, ProductVO vo) {
		model.addAttribute("product", productService.getProduct(vo));
		return "product/getProduct";
	}
	//제품등록
	@RequestMapping("insertProduct")
	public String insertProduct(Model model, ProductVO vo) {
		model.addAttribute("product");
		return "product/insertProduct";
	}
	
	
	
	/////////////////////////////////////////////////////////////
	
	
}
