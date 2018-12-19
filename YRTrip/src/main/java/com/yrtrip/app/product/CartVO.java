package com.yrtrip.app.product;

public class CartVO extends ProductVO{
	private int cartId;
	private String myId;
	private int itemId;
	private int itemEa;
	private String cartDate;

	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getCartDate() {
		return cartDate;
	}
	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
	public String getMyId() {
		return myId;
	}
	public void setMyId(String myId) {
		this.myId = myId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getItemEa() {
		return itemEa;
	}
	public void setItemEa(int itemEa) {
		this.itemEa = itemEa;
	}
	
}
