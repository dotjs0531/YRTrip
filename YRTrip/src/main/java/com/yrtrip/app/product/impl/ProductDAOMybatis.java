package com.yrtrip.app.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.notice.NoticeVO;
import com.yrtrip.app.product.ProductVO;

@Repository
public class ProductDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertProduct(ProductVO vo) {
		mybatis.update("product.insertProduct", vo);
	}

	public void updateProduct(ProductVO vo) {
		mybatis.update("product.updateProduct", vo);
	}

	public void deleteProduct(ProductVO vo) {
		mybatis.update("product.deleteProduct", vo);
	}

	public ProductVO getProduct(ProductVO vo) {
		System.out.println("이검댐덕람ㄴ어리ㅓ미린");
		return mybatis.selectOne("product.getProduct", vo);
	}

	public List<ProductVO> getProductList(ProductVO vo) {
		System.out.println("ddd");
		return mybatis.selectList("product.getProductList", vo);
	}
	
	//건수 조회
	public int getCount(ProductVO vo) {
		return mybatis.selectOne("product.getCount", vo);
	}
}
