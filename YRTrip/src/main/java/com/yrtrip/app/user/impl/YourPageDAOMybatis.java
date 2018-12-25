package com.yrtrip.app.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.like.LikeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;
import com.yrtrip.app.user.UserVO;

@Repository
public class YourPageDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getYourInfo(UserVO vo) {
		return mybatis.selectOne("user.getUser", vo);
	}
	
	//여행
	public int getYourTravelCount(TravelBoardVO vo) {
		return mybatis.selectOne("user.getYourTravelCount", vo);
	}
	public List<TravelBoardVO> getYourTravelList(TravelBoardVO vo) {
		return mybatis.selectList("user.getYourTravelList", vo);
	}

	//동행
	public int getYourPartnerCount(PartnerVO vo) {
		return mybatis.selectOne("user.getYourPartnerCount", vo);
	}
	public List<PartnerVO> getYourPartnerList(PartnerVO vo) {
		return mybatis.selectList("user.getYourPartnerList", vo);
	}

	//좋아요
	public int getYourLikedCount(LikeVO vo) {
		return mybatis.selectOne("user.getYourLikedCount", vo);
	}
	public List<TravelBoardVO> getYourLikedTravelList(TravelBoardVO vo) {
		return mybatis.selectList("user.getYourLikedTravelList", vo);
	}
	public List<TravelPlaceVO> getYourLikedPlaceList(TravelPlaceVO vo) {
		return mybatis.selectList("user.getYourLikedPlaceList", vo);
	}
	public List<ProductVO> getYourLikedProductList(ProductVO vo) {
		return mybatis.selectList("user.getYourLikedProductList", vo);
	}

	//상품
	public int getYourProductCount(ProductVO vo) {
		return mybatis.selectOne("user.getYourProductCount", vo);
	}
	public List<ProductVO> getYourProductList(ProductVO vo) {
		return mybatis.selectList("user.getYourProductList", vo);
	}

	//리뷰
	public int getYourReviewCount(OrderVO vo) {
		return mybatis.selectOne("user.getYourReviewCount", vo);
	}
	public List<OrderVO> getYourReviewList(OrderVO vo) {
		return mybatis.selectList("user.getYourReviewList", vo);
	}
}
