package com.yrtrip.app.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.user.MyPageVO;

@Repository
public class MyPageDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MyPageVO> getMyTravelList(MyPageVO vo)  {
		return mybatis.selectList("mypage.getMyTravelList", vo);
	}
	public List<MyPageVO> getMyPartnerList(MyPageVO vo)  {
		return mybatis.selectList("mypage.getMyPartnerList", vo);
	}
	
	public List<MyPageVO> getMyLikedList(MyPageVO vo)  {
		return mybatis.selectList("mypage.getMyLikedList", vo);
	}
	public List<MyPageVO> getMyULikeList(MyPageVO vo)  {
		return mybatis.selectList("mypage.getMyULikeList", vo);
	}
	
	public List<MyPageVO> getMyProductList(MyPageVO vo)  {
		return mybatis.selectList("mypage.getMyProductList", vo);
	}
	public List<MyPageVO> getMyOrderList(MyPageVO vo)  {
		return mybatis.selectList("mypage.getMyOrderList", vo);
	}
	public List<MyPageVO> getMyReviewList(MyPageVO vo)  {
		return mybatis.selectList("mypage.getMyReviewList", vo);
	}
}
