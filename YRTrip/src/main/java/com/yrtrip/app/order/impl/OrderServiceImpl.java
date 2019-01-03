package com.yrtrip.app.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.order.OrderService;
import com.yrtrip.app.order.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired OrderDAOMybatis dao;
	
	public void insertOrder(OrderVO vo) {
		dao.insertOrder(vo);
	}

	public void updateOrder(OrderVO vo) {
		dao.updateOrder(vo);
	}

	public void deleteOrder(OrderVO vo) {
		dao.deleteOrder(vo);
	}

	public List<OrderVO> getOrder(OrderVO vo) {
		return dao.getOrder(vo);
	}

	public List<OrderVO> getOrderList(OrderVO vo) {
		return dao.getOrderList(vo);
	}

	public int getCount(OrderVO vo) {
		return dao.getCount(vo);
	}

}
