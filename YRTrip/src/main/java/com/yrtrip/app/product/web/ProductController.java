package com.yrtrip.app.product.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	
	//전체조회(폼)
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
		return "product/getProductList";
	}
	
	/*//제품수정처리
	@RequestMapping("updateProduct")
	public String updateProduct(ProductVO vo) {
		productService.updateProduct(vo);
		return "redirect:getProduct";
	}*/
	
/*	//제품등록처리
	@RequestMapping(value="/insertProduct", method=RequestMethod.POST)
	public String insertProduct(Model model, ProductVO vo) {
		productService.insertProduct(vo);
		//return "";//최종 : 제품 등록 후 ..판매자 제품 목록 페이지로
		return "redirect:getProductList";
	}*/
	
	/*//제품수정처리
	@RequestMapping("updateProduct")
	public String updateProduct(Model model, ProductVO vo) {
		productService.updateProduct(vo);
		return "redirect:getProductList"; //일단은...
	}
	
	//수정폼 
	@RequestMapping("/updateProductForm")
	public String updateProductForm(Model model, ProductVO vo) {
		model.addAttribute("notice", productService.getProduct(vo));
		return "product/updateProduct";
	}*/
	
	/////////////////////////////////////////////////////////////
	
	
}
