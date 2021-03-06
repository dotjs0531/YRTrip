package com.yrtrip.app.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.like.LikeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;
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
	public int getMyPartnerCount(PartnerVO vo) {
		return dao.getMyPartnerCount(vo);
	}
	public List<PartnerVO> getMyPartnerList(PartnerVO vo) {
		return dao.getMyPartnerList(vo);
	}
	public List<JoinerVO> getMyJoinerList(JoinerVO vo) {
		return dao.getMyJoinerList(vo);
	}
	public void cancleMyJoinerList(JoinerVO vo) {
		dao.cancleMyJoinerList(vo);
	}

	//좋아요
	public int getMyLikedCount(LikeVO vo) {
		return dao.getMyLikedCount(vo);
	}
	public List<TravelBoardVO> getMyLikedTravelList(TravelBoardVO vo) {
		return dao.getMyLikedTravelList(vo);
	}
	public List<TravelPlaceVO> getMyLikedPlaceList(TravelPlaceVO vo) {
		return dao.getMyLikedPlaceList(vo);
	}
	public List<ProductVO> getMyLikedProductList(ProductVO vo) {
		return dao.getMyLikedProductList(vo);
	}
	public void deleteMyLiked(LikeVO vo) {
		dao.deleteMyLiked(vo);
	}

	//상품
	public int getMyProductCount(ProductVO vo) {
		return dao.getMyProductCount(vo);
	}
	public List<ProductVO> getMyProductList(ProductVO vo) {
		return dao.getMyProductList(vo);
	}
	public void deleteMyProductList(ProductVO vo) {
		dao.deleteMyProductList(vo);
	}
	public int getMyBuyerCount(OrderVO vo) {
		return dao.getMyBuyerCount(vo);
	}
	public List<OrderVO> getMyBuyerList(OrderVO vo) {
		return dao.getMyBuyerList(vo);
	}
	public OrderVO getMyBuyer(OrderVO vo) {
		return dao.getMyBuyer(vo);
	}
	public void updateDno(OrderVO vo) {
		dao.updateDno(vo);
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
	public void deleteMyOrderList(OrderVO vo) {
		dao.deleteMyOrderList(vo);
	}
	public void updateOrderCondition(OrderVO vo) {
		dao.updateOrderCondition(vo);
	}
	public void cancleMyOrder(OrderVO vo) {
		dao.cancleMyOrder(vo);
	}

	//리뷰
	public int getMyReviewCount(OrderVO vo) {
		return dao.getMyReviewCount(vo);
	}
	public List<OrderVO> getMyReviewList(OrderVO vo) {
		return dao.getMyReviewList(vo);
	}
	public OrderVO getMyReview(OrderVO vo) {
		return dao.getMyReview(vo);
	}
	public void insertMyReview(OrderVO vo) {
		dao.insertMyReview(vo);
	}
	public void updateMyReview(OrderVO vo) {
		dao.updateMyReview(vo);
	}
	public void deleteMyReview(OrderVO vo) {
		dao.deleteMyReview(vo);
	}
	public void updateProductStar(OrderVO vo) {
		dao.updateProductStar(vo);
	}
}
