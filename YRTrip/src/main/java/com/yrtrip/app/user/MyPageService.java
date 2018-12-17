package com.yrtrip.app.user;

import java.util.List;

public interface MyPageService {
	public List<MyPageVO> getMyTravelList(MyPageVO vo);
	public List<MyPageVO> getMyPartnerList(MyPageVO vo);
	
	public List<MyPageVO> getMyLikedList(MyPageVO vo);
	public List<MyPageVO> getMyULikeList(MyPageVO vo);
	
	public List<MyPageVO> getMyProductList(MyPageVO vo);
	public List<MyPageVO> getMyOrderList(MyPageVO vo);
	public List<MyPageVO> getMyReviewList(MyPageVO vo);
}
