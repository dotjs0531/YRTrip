package com.yrtrip.app.user;

import java.util.List;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;

public interface MyPageService {
	public int getMyTravelCount(TravelBoardVO vo);
	public List<TravelBoardVO> getMyTravelList(TravelBoardVO vo);
	public List<PartnerVO> getMyPartnerList(PartnerVO vo);
	public List<JoinerVO> getMyJoinerList(JoinerVO vo);
	
	public List<UserVO> getMyLikedList(UserVO vo);	//좋아요 테이블 패키지 추가
	public List<UserVO> getMyULikeList(UserVO vo);
	
	public List<ProductVO> getMyProductList(ProductVO vo);
	public List<UserVO> getMyOrderList(UserVO vo);	//거래내역 테이블 패키지 추가
	public List<UserVO> getMyReviewList(UserVO vo);		//리뷰 테이블 패키지 추가
}
