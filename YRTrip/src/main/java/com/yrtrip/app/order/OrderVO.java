package com.yrtrip.app.order;

import com.yrtrip.app.product.ProductVO;

public class OrderVO extends ProductVO {
	private String orderId;			//거래번호(201812**-0001)
	private String orderDate;		//거래일자
	private String orderCondition;	//거래상태(결제완료/거래완료/거래취소)
	private String orderDelivery;	//배송상태(배송준비중,배송중,배송완료)
	private int orderPrice;			//구매금액
	private int orderEa;			//구매수량
	private int itemId;				//상품ID
	private String buyerId;			//구매자ID
	private String itemDeliveryno;	//송장번호(생략가능-배송중일 경우 입력)
	
	private int first;
	private int last;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderCondition() {
		return orderCondition;
	}
	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}
	public String getOrderDelivery() {
		return orderDelivery;
	}
	public void setOrderDelivery(String orderDelivery) {
		this.orderDelivery = orderDelivery;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getOrderEa() {
		return orderEa;
	}
	public void setOrderEa(int orderEa) {
		this.orderEa = orderEa;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getItemDeliveryno() {
		return itemDeliveryno;
	}
	public void setItemDeliveryno(String itemDeliveryno) {
		this.itemDeliveryno = itemDeliveryno;
	}
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	
}
