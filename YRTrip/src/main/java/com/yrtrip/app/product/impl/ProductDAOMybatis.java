package com.yrtrip.app.product.impl;
/*작업덜함*/
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.product.ProductVO;

@Repository
public class ProductDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertProduct(ProductVO vo) {
		System.out.println("mybatis insertProduct() 기능 처리");
		mybatis.update("");
	}
	
	public void updateProduct() {
		// TODO Auto-generated method stub

	}
	
	public void deleteProduct(ProductVO vo) {
		
	}
	
	public List<ProductVO> getProductList(ProductVO vo){
		return null;
	}
	
	public ProductVO getProduct(ProductVO vo) {
		return null;
	}
	
	
}
