package com.yrtrip.app.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired ProductDAOMybatis dao;
	
	@Override
	public void insertProduct(ProductVO vo) {
		

	}

	@Override
	public void updateProduct(ProductVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProduct(ProductVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
