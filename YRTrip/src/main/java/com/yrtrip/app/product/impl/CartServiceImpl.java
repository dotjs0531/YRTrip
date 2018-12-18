package com.yrtrip.app.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.product.CartService;
import com.yrtrip.app.product.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired CartDAOMybatis dao;
	
	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);
	}

	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
	}

	@Override
	public void deleteCart(CartVO vo) {
		dao.deleteCart(vo);
	}

	@Override
	public CartVO getCart(CartVO vo) {
		return dao.getCart(vo);
	}

	@Override
	public List<CartVO> getProductList(CartVO vo) {
		return dao.getCartList(vo);
	}

}
