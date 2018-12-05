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
		mybatis.update("product.insertProduct", vo);
	}
	
	public void updateProduct(ProductVO vo) {
		mybatis.update("product.insertProduct", vo);

	}
	
	public void deleteProduct(ProductVO vo) {
		mybatis.update("product.insertProduct", vo);
	}
	
	public List<ProductVO> getProductList(ProductVO vo){
		return mybatis.selectList("product.getProductList", vo);
	}
	
	public ProductVO getProduct(ProductVO vo) {
		return mybatis.selectOne("product.getProduct", vo);
	}
	
	
}
