package com.yrtrip.app.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	
	@RequestMapping(value= {"/getProductList"}, method=RequestMethod.GET)
	public String getProductList(Model model, ProductVO vo) {
		model.addAttribute("productlist", productService.getProductList(vo));
		return "product/getProductList";
	}
}
