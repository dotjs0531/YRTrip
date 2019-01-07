package com.yrtrip.app.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.notice.NoticeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.qna.QnaVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.UserVO;

@Repository
public class AdminDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int totalOrderPrice(OrderVO vo) {
		return sqlSession.selectOne("admin.totalOrderPrice", vo);
	}
	public int countOrderAmount(OrderVO vo) {
		return sqlSession.selectOne("admin.countOrderAmount", vo);
	}
	public int countTravelAmount(TravelBoardVO vo) {
		return sqlSession.selectOne("admin.countTravelAmount", vo);
	}
	public int countUserAmount(UserVO vo) {
		return sqlSession.selectOne("admin.countUserAmount", vo);
	}
	public List<Map> getTinfoChart(String day) {
		return sqlSession.selectList("admin.getTinfoChart", day);
	}
	public List<Map> getSellerChart(String day) {
		return sqlSession.selectList("admin.getSellerChart", day);
	}
	public List<Map> getDayChart(String day) {
		return sqlSession.selectList("admin.getDayChart", day);
	}
	public List<Map> getTimeChart(String day) {
		return sqlSession.selectList("admin.getTimeChart", day);
	}
	public List<Map> getOrderPriceChart(String day) {
		return sqlSession.selectList("admin.getOrderPriceChart", day);
	}
	public List<Map> getOrderIdChart(String day) {
		return sqlSession.selectList("admin.getOrderIdChart", day);
	}
	
	public List<ProductVO> getManageProductList(ProductVO vo) {
		return sqlSession.selectList("admin.getManageProductList", vo);
	}
	
	public List<OrderVO> getManageOrderList(OrderVO vo) {
		return sqlSession.selectList("admin.getManageOrderList", vo);
	}
	public OrderVO getManageOrder(OrderVO vo) {
		return sqlSession.selectOne("admin.getManageOrder",vo);
	}
	
	public List<PartnerVO> getManagePartnerList(PartnerVO vo) {
		return sqlSession.selectList("admin.getManagePartnerList", vo);
	}
	
	public List<TravelBoardVO> getManageTravelList(TravelBoardVO vo){
		return sqlSession.selectList("admin.getManageTravelList", vo);
	}
	public List<NoticeVO> getManageNoticeList(NoticeVO vo){
		return sqlSession.selectList("admin.getManageNoticeList", vo);
	}
	public List<QnaVO> getManageQnaList(QnaVO vo){
		return sqlSession.selectList("admin.getManageQnaList", vo);
	}
}
