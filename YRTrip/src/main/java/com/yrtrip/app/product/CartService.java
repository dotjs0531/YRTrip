package com.yrtrip.app.product;

import java.util.List;

public interface CartService {
	public void insertCart(CartVO vo);
	public void updateCart(CartVO vo);
	public void deleteCart(CartVO vo);
	public CartVO getCart(CartVO vo);
	public List<CartVO> getCartList(CartVO vo);
//	public int getCount(CartVO vo);
}
