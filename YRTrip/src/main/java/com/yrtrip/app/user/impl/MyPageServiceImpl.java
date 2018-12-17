package com.yrtrip.app.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.MyPageVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired MyPageDAOMybatis dao;
	
	public List<MyPageVO> getMyTravelList(MyPageVO vo) {
		return dao.getMyTravelList(vo);
	}
	public List<MyPageVO> getMyPartnerList(MyPageVO vo) {
		return dao.getMyPartnerList(vo);
	}
	
	public List<MyPageVO> getMyLikedList(MyPageVO vo) {
		return dao.getMyLikedList(vo);
	}
	public List<MyPageVO> getMyULikeList(MyPageVO vo) {
		return dao.getMyULikeList(vo);
	}
	
	public List<MyPageVO> getMyProductList(MyPageVO vo) {
		return dao.getMyProductList(vo);
	}
	public List<MyPageVO> getMyOrderList(MyPageVO vo) {
		return dao.getMyOrderList(vo);
	}
	public List<MyPageVO> getMyReviewList(MyPageVO vo) {
		return dao.getMyReviewList(vo);
	}
}
