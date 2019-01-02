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

@Repository
public class AdminDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map> getTinfoChart(String day) {
		return sqlSession.selectList("admin.getTinfoChart", day);
	}
	
	public List<ProductVO> getManageProductList(ProductVO vo) {
		return sqlSession.selectList("admin.getManageProductList", vo);
	}
	
	public List<OrderVO> getManageOrderList(OrderVO vo) {
		return sqlSession.selectList("admin.getManageOrderList", vo);
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
