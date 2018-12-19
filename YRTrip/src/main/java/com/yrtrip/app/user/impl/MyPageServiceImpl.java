package com.yrtrip.app.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.UserVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired MyPageDAOMybatis dao;

	//여행
	public int getMyTravelCount(TravelBoardVO vo) {
		return dao.getMyTravelCount(vo);
	}
	public List<TravelBoardVO> getMyTravelList(TravelBoardVO vo) {
		return dao.getMyTravelList(vo);
	}
	public void deleteMyTravelList(TravelBoardVO vo) {
		dao.deleteMyTravelList(vo);
	}

	//동행
	public List<PartnerVO> getMyPartnerList(PartnerVO vo) {
		return dao.getMyPartnerList(vo);
	}
	public List<JoinerVO> getMyJoinerList(JoinerVO vo) {
		return dao.getMyJoinerList(vo);
	}

	//좋아요
	public List<UserVO> getMyLikedList(UserVO vo) {
		return dao.getMyLikedList(vo);
	}
	public List<UserVO> getMyULikeList(UserVO vo) {
		return dao.getMyULikeList(vo);
	}

	//상품
	public int getMyProductCount(ProductVO vo) {
		return dao.getMyProductCount(vo);
	}
	public List<ProductVO> getMyProductList(ProductVO vo) {
		return dao.getMyProductList(vo);
	}
	
	//거래내역
	public int getMyOrderCount(OrderVO vo) {
		return dao.getMyOrderCount(vo);
	}
	public List<OrderVO> getMyOrderList(OrderVO vo) {
		return dao.getMyOrderList(vo);
	}
	public OrderVO getMyOrder(OrderVO vo) {
		return dao.getMyOrder(vo);
	}

	//리뷰
	public int getMyReviewCount(OrderVO vo) {
		return dao.getMyReviewCount(vo);
	}
	public List<OrderVO> getMyReviewList(OrderVO vo) {
		return dao.getMyReviewList(vo);
	}
}
