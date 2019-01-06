package com.yrtrip.app.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.product.CartVO;

@Repository
public class CartDAOMybatis {

	@Autowired SqlSessionTemplate mybatis;
	
	public void insertCart(CartVO vo) {
		mybatis.update("cart.insertCart", vo);
	}
	
	public void updateCart(CartVO vo) {
		mybatis.update("cart.updateCart", vo);
	}
	
	public void deleteCart(CartVO vo) {
		mybatis.update("cart.deleteCart", vo);
	}
	
	public CartVO getCart(CartVO vo) {
		return mybatis.selectOne("cart.getCart", vo);
	}
	
	public List<CartVO> getCartList(CartVO vo) {
		return mybatis.selectList("cart.getCartList", vo);

	}
	
}
