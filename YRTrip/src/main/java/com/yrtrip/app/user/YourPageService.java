package com.yrtrip.app.user;

import java.util.List;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.like.LikeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;

public interface YourPageService {

	public UserVO getYourInfo(UserVO vo);
	
	//여행
	public int getYourTravelCount(TravelBoardVO vo);
	public List<TravelBoardVO> getYourTravelList(TravelBoardVO vo);

	//동행
	public int getYourPartnerCount(PartnerVO vo);
	public List<PartnerVO> getYourPartnerList(PartnerVO vo);
	public int getYourJoinerCnt(JoinerVO vo);

	//좋아요
	public int getYourLikedCount(LikeVO vo);
	public List<TravelBoardVO> getYourLikedTravelList(TravelBoardVO vo);
	public List<TravelPlaceVO> getYourLikedPlaceList(TravelPlaceVO vo);
	public List<ProductVO> getYourLikedProductList(ProductVO vo);

	//상품
	public int getYourProductCount(ProductVO vo);
	public List<ProductVO> getYourProductList(ProductVO vo);
	public int getYourProductReviewCnt(OrderVO vo);

	//리뷰
	public int getYourReviewCount(OrderVO vo);
	public List<OrderVO> getYourReviewList(OrderVO vo);

}
