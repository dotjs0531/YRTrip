package com.yrtrip.app.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.UserVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired MyPageDAOMybatis dao;

	public int getMyTravelCount(TravelBoardVO vo) {
		return dao.getMyTravelCount(vo);
	}
	public List<TravelBoardVO> getMyTravelList(TravelBoardVO vo) {
		return dao.getMyTravelList(vo);
	}
	public List<PartnerVO> getMyPartnerList(PartnerVO vo) {
		return dao.getMyPartnerList(vo);
	}
	public List<JoinerVO> getMyJoinerList(JoinerVO vo) {
		return dao.getMyJoinerList(vo);
	}
	
	public List<UserVO> getMyLikedList(UserVO vo) {
		return dao.getMyLikedList(vo);
	}
	public List<UserVO> getMyULikeList(UserVO vo) {
		return dao.getMyULikeList(vo);
	}
	
	public List<ProductVO> getMyProductList(ProductVO vo) {
		return dao.getMyProductList(vo);
	}
	public List<UserVO> getMyOrderList(UserVO vo) {
		return dao.getMyOrderList(vo);
	}
	public List<UserVO> getMyReviewList(UserVO vo) {
		return dao.getMyReviewList(vo);
	}
}
