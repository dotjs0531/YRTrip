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
import com.yrtrip.app.user.UserVO;
import com.yrtrip.app.user.YourPageService;

@Service
public class YourPageServiceImpl implements YourPageService {

	@Autowired YourPageDAOMybatis dao;

	public UserVO getYourInfo(UserVO vo) {
		return dao.getYourInfo(vo);
	}
	public void updateUserStar(UserVO vo) {
		dao.updateUserStar(vo);
	}
	
	//여행
	public int getYourTravelCount(TravelBoardVO vo) {
		return dao.getYourTravelCount(vo);
	}
	public List<TravelBoardVO> getYourTravelList(TravelBoardVO vo) {
		return dao.getYourTravelList(vo);
	}

	//동행
	public int getYourPartnerCount(PartnerVO vo) {
		return dao.getYourPartnerCount(vo);
	}
	public List<PartnerVO> getYourPartnerList(PartnerVO vo) {
		return dao.getYourPartnerList(vo);
	}
	public int getYourJoinerCnt(JoinerVO vo) {
		return dao.getYourJoinerCnt(vo);
	}

	//좋아요
	public int getYourLikedCount(LikeVO vo) {
		return dao.getYourLikedCount(vo);
	}
	public List<TravelBoardVO> getYourLikedTravelList(TravelBoardVO vo) {
		return dao.getYourLikedTravelList(vo);
	}
	public List<TravelPlaceVO> getYourLikedPlaceList(TravelPlaceVO vo) {
		return dao.getYourLikedPlaceList(vo);
	}
	public List<ProductVO> getYourLikedProductList(ProductVO vo) {
		return dao.getYourLikedProductList(vo);
	}

	//상품
	public int getYourProductCount(ProductVO vo) {
		return dao.getYourProductCount(vo);
	}
	public List<ProductVO> getYourProductList(ProductVO vo) {
		return dao.getYourProductList(vo);
	}
	public int getYourProductReviewCnt(OrderVO vo) {
		return dao.getYourProductReviewCnt(vo);
	}

	//리뷰
	public int getYourReviewCount(OrderVO vo) {
		return dao.getYourReviewCount(vo);
	}
	public List<OrderVO> getYourReviewList(OrderVO vo) {
		return dao.getYourReviewList(vo);
	}

}
