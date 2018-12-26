package com.yrtrip.app.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.like.LikeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;
import com.yrtrip.app.user.UserVO;

@Repository
public class MyPageDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//여행
	public int getMyTravelCount(TravelBoardVO vo) {
		return mybatis.selectOne("user.getMyTravelCount", vo);
	}
	public List<TravelBoardVO> getMyTravelList(TravelBoardVO vo)  {
		return mybatis.selectList("user.getMyTravelList", vo);
	}
	public void deleteMyTravelList(TravelBoardVO vo) {
		mybatis.update("user.deleteMyTravelList", vo);
	}

	//동행
	public List<PartnerVO> getMyPartnerList(PartnerVO vo)  {
		return mybatis.selectList("user.getMyPartnerList", vo);
	}
	public List<JoinerVO> getMyJoinerList(JoinerVO vo)  {
		return mybatis.selectList("user.getMyJoinerList", vo);
	}
	public void cancleMyJoinerList(JoinerVO vo) {
		mybatis.update("user.cancleMyJoinerList", vo);
	}

	//좋아요
	public int getMyLikedCount(LikeVO vo) {
		return mybatis.selectOne("user.getMyLikedCount", vo);
	}
	public List<TravelBoardVO> getMyLikedTravelList(TravelBoardVO vo) {
		return mybatis.selectList("user.getMyLikedTravelList", vo);
	}
	public List<TravelPlaceVO> getMyLikedPlaceList(TravelPlaceVO vo) {
		return mybatis.selectList("user.getMyLikedPlaceList", vo);
	}
	public List<ProductVO> getMyLikedProductList(ProductVO vo) {
		return mybatis.selectList("user.getMyLikedProductList", vo);
	}
	public void deleteMyLiked(LikeVO vo) {
		mybatis.update("user.deleteMyLiked", vo.getLikeNo());
	}

	//상품
	public int getMyProductCount(ProductVO vo) {
		return mybatis.selectOne("user.getMyProductCount", vo);
	}
	public List<ProductVO> getMyProductList(ProductVO vo)  {
		return mybatis.selectList("user.getMyProductList", vo);
	}
	public void deleteMyProductList(ProductVO vo) {
		mybatis.update("user.deleteMyProductList", vo);
	}
	
	//거래내역
	public int getMyOrderCount(OrderVO vo) {
		return mybatis.selectOne("user.getMyOrderCount", vo);
	}
	public List<OrderVO> getMyOrderList(OrderVO vo)  {
		return mybatis.selectList("user.getMyOrderList", vo);
	}
	public OrderVO getMyOrder(OrderVO vo) {
		return mybatis.selectOne("user.getMyOrder", vo);
	}
	public void deleteMyOrderList(OrderVO vo) {
		mybatis.update("user.deleteMyOrderList", vo);
	}
	public List<OrderVO> getMyBuyerList(OrderVO vo) {
		return mybatis.selectList("user.getMyBuyerList", vo);
	}
	public OrderVO getMyBuyer(OrderVO vo) {
		return mybatis.selectOne("user.getMyBuyer", vo);
	}
	public void updateDno(OrderVO vo) {
		mybatis.update("user.updateDno",vo);
	}

	//리뷰
	public int getMyReviewCount(OrderVO vo) {
		return mybatis.selectOne("user.getMyReviewCount", vo);
	}
	public List<OrderVO> getMyReviewList(OrderVO vo) {
		return mybatis.selectList("user.getMyReviewList", vo);
	}
	public OrderVO getMyReview(OrderVO vo) {
		return mybatis.selectOne("user.getMyReview", vo);
	}
	public void insertMyReview(OrderVO vo) {
		mybatis.update("user.insertMyReview", vo);
	}
	public void updateMyReview(OrderVO vo) {
		mybatis.update("user.updateMyReview", vo);
	}
	public void deleteMyReview(OrderVO vo) {
		mybatis.update("user.deleteMyReview", vo);
	}
}
