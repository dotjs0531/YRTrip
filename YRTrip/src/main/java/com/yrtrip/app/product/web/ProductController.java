package com.yrtrip.app.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	
	@RequestMapping("/getProductList")
	public String getProductList(Model model, ProductVO vo) {
		model.addAttribute("productlist", productService.getProductList(vo));
		return "product/getProductList";
	}
}
