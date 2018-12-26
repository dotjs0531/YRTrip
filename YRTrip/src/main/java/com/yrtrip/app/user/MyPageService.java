package com.yrtrip.app.user;

import java.util.List;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.like.LikeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;

public interface MyPageService {
	//여행
	public int getMyTravelCount(TravelBoardVO vo);
	public List<TravelBoardVO> getMyTravelList(TravelBoardVO vo);
	public void deleteMyTravelList(TravelBoardVO vo);
	
	//동행
	public List<PartnerVO> getMyPartnerList(PartnerVO vo);
	public List<JoinerVO> getMyJoinerList(JoinerVO vo);
	public void cancleMyJoinerList(JoinerVO vo);
	
	//좋아요
	public int getMyLikedCount(LikeVO vo);
	public List<TravelBoardVO> getMyLikedTravelList(TravelBoardVO vo);
	public List<TravelPlaceVO> getMyLikedPlaceList(TravelPlaceVO vo);
	public List<ProductVO> getMyLikedProductList(ProductVO vo);
	public void deleteMyLiked(LikeVO vo);

	//상품
	public int getMyProductCount(ProductVO vo);
	public List<ProductVO> getMyProductList(ProductVO vo);
	public void deleteMyProductList(ProductVO vo);
	public List<OrderVO> getMyBuyerList(OrderVO vo);
	public OrderVO getMyBuyer(OrderVO vo);
	public void updateDno(OrderVO vo);
	
	//거래내역
	public int getMyOrderCount(OrderVO vo);
	public List<OrderVO> getMyOrderList(OrderVO vo);
	public OrderVO getMyOrder(OrderVO vo);
	public void deleteMyOrderList(OrderVO vo);
	
	//리뷰
	public int getMyReviewCount(OrderVO vo);
	public List<OrderVO> getMyReviewList(OrderVO vo);
	public OrderVO getMyReview(OrderVO vo);
	public void insertMyReview(OrderVO vo);
	public void updateMyReview(OrderVO vo);
	public void deleteMyReview(OrderVO vo);
}
