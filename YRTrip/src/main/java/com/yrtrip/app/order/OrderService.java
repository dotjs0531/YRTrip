package com.yrtrip.app.order;

import java.util.List;

public interface OrderService {
	public void insertOrder(OrderVO vo);
	public void updateOrder(OrderVO vo);
	public void deleteOrder(OrderVO vo);
	public OrderVO getOrder(OrderVO vo);
	public List<OrderVO> getOrderList(OrderVO vo);
	public int getCount(OrderVO vo);
}
