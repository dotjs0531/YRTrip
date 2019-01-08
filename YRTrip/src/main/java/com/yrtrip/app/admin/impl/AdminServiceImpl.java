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
import com.yrtrip.app.user.UserVO;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired AdminDAOMybatis dao;
	
	public int totalOrderPrice(OrderVO vo) {
		return dao.totalOrderPrice(vo);
	}
	public int countOrderAmount(OrderVO vo) {
		return dao.countOrderAmount(vo);
	}
	public int countTravelAmount(TravelBoardVO vo) {
		return dao.countTravelAmount(vo);
	}
	public int countUserAmount(UserVO vo) {
		return dao.countUserAmount(vo);
	}
	
	public List<Map> getTinfoChart(String day) {
		return dao.getTinfoChart(day);
	}
	public List<Map> getSellerChart(String day) {
		return dao.getSellerChart(day);
	}
	public List<Map> getDayChart(String day) {
		return dao.getDayChart(day);
	}
	public List<Map> getTimeChart(String day) {
		return dao.getTimeChart(day);
	}
	public List<Map> getOrderPriceChart(String day) {
		return dao.getOrderPriceChart(day);
	}
	public List<Map> getOrderIdChart(String day) {
		return dao.getOrderIdChart(day);
	}
	
	public List<ProductVO> getManageProductList(ProductVO vo) {
		return dao.getManageProductList(vo);
	}
	public int getManageProductCount(ProductVO vo) {
		return dao.getManageProductCount(vo);
	}
	
	public List<OrderVO> getManageOrderList(OrderVO vo) {
		return dao.getManageOrderList(vo);
	}
	public OrderVO getManageOrder(OrderVO vo) {
		return dao.getManageOrder(vo);
	}
	public int getManageOrderCount(OrderVO vo) {
		return dao.getManageOrderCount(vo);
	}
	
	public List<PartnerVO> getManagePartnerList(PartnerVO vo) {
		return dao.getManagePartnerList(vo);
	}
	public int getManagePartnerCount(PartnerVO vo) {
		return dao.getManagePartnerCount(vo);
	}
	
	public List<TravelBoardVO> getManageTravelList(TravelBoardVO vo) {
		return dao.getManageTravelList(vo);
	}
	public int getManageTravelCount(TravelBoardVO vo) {
		return dao.getManageTravelCount(vo);
	}
	
	public List<NoticeVO> getManageNoticeList(NoticeVO vo) {
		return dao.getManageNoticeList(vo);
	}
	public int getManageNoticeCount(NoticeVO vo) {
		return dao.getManageNoticeCount(vo);
	}
	
	public List<QnaVO> getManageQnaList(QnaVO vo) {
		return dao.getManageQnaList(vo);
	}
	public int getManageQnaCount(QnaVO vo) {
		return dao.getManageQnaCount(vo);
	}
}
