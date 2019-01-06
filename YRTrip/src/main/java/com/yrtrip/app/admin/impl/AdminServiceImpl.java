package com.yrtrip.app.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.admin.AdminService;
import com.yrtrip.app.notice.NoticeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.qna.QnaVO;
import com.yrtrip.app.travel.TravelBoardVO;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired AdminDAOMybatis dao;
	
	@Override
	public List<Map> getTinfoChart(String day) {
		return dao.getTinfoChart(day);
	}
	@Override
	public List<Map> getSellerChart(String day) {
		return dao.getSellerChart(day);
	}
	@Override
	public List<Map> getDayChart(String day) {
		return dao.getDayChart(day);
	}
	@Override
	public List<Map> getTimeChart(String day) {
		return dao.getTimeChart(day);
	}
	@Override
	public List<Map> getOrderPriceChart(String day) {
		return dao.getOrderPriceChart(day);
	}
	@Override
	public List<Map> getOrderIdChart(String day) {
		return dao.getOrderIdChart(day);
	}
	@Override
	public List<ProductVO> getManageProductList(ProductVO vo) {
		return dao.getManageProductList(vo);
	}
	
	@Override
	public List<OrderVO> getManageOrderList(OrderVO vo) {
		return dao.getManageOrderList(vo);
	}
	public OrderVO getManageOrder(OrderVO vo) {
		return dao.getManageOrder(vo);
	}
	
	@Override
	public List<PartnerVO> getManagePartnerList(PartnerVO vo) {
		return dao.getManagePartnerList(vo);
	}
	@Override
	public List<TravelBoardVO> getManageTravelList(TravelBoardVO vo) {
		return dao.getManageTravelList(vo);
	}
	@Override
	public List<NoticeVO> getManageNoticeList(NoticeVO vo) {
		return dao.getManageNoticeList(vo);
	}
	@Override
	public List<QnaVO> getManageQnaList(QnaVO vo) {
		return dao.getManageQnaList(vo);
	}
}
