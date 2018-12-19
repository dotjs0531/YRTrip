package com.yrtrip.app.user;

import java.util.List;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;

public interface MyPageService {
	//여행
	public int getMyTravelCount(TravelBoardVO vo);
	public List<TravelBoardVO> getMyTravelList(TravelBoardVO vo);
	public void deleteMyTravelList(TravelBoardVO vo);
	
	//동행
	public List<PartnerVO> getMyPartnerList(PartnerVO vo);
	public List<JoinerVO> getMyJoinerList(JoinerVO vo);
	
	//좋아요
	public List<UserVO> getMyLikedList(UserVO vo);
	public List<UserVO> getMyULikeList(UserVO vo);

	//상품
	public int getMyProductCount(ProductVO vo);
	public List<ProductVO> getMyProductList(ProductVO vo);
	
	//거래내역
	public int getMyOrderCount(OrderVO vo);
	public List<OrderVO> getMyOrderList(OrderVO vo);
	public OrderVO getMyOrder(OrderVO vo);
	
	//리뷰
	public int getMyReviewCount(OrderVO vo);
	public List<OrderVO> getMyReviewList(OrderVO vo);
}
