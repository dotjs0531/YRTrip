package com.yrtrip.app.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.order.OrderVO;

@Repository
public class OrderDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertOrder(OrderVO vo) {
		mybatis.update("order.insertOrder", vo);
	}

	public void updateOrder(OrderVO vo) {
		mybatis.update("order.updateOrder", vo);
	}

	public void deleteOrder(OrderVO vo) {
		mybatis.update("order.deleteOrder", vo);
	}

	public List<OrderVO> getOrder(OrderVO vo) {
		return mybatis.selectList("order.getOrder", vo);
	}

	public List<OrderVO> getOrderList(OrderVO vo) {
		return mybatis.selectList("order.getOrderList", vo);
	}

	public int getCount(OrderVO vo) {
		return mybatis.selectOne("order.getCount", vo);
	}
	
}
