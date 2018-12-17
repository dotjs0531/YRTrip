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
		dao.insertProduct(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);

	}

	@Override
	public void deleteProduct(ProductVO vo) {
		dao.deleteProduct(vo);

	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return dao.getProduct(vo);
	}

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		System.out.println("되고 있음!");
		return dao.getProductList(vo);
	}

	@Override
	public int getCount(ProductVO vo) {
		// TODO Auto-generated method stub
		return dao.getCount(vo);
	}

}
