package com.yrtrip.app.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.UserVO;

@Repository
public class MyPageDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int getMyTravelCount(TravelBoardVO vo) {
		return mybatis.selectOne("user.getMyTravelCount", vo);
	}
	public List<TravelBoardVO> getMyTravelList(TravelBoardVO vo)  {
		return mybatis.selectList("user.getMyTravelList", vo);
	}
	public List<PartnerVO> getMyPartnerList(PartnerVO vo)  {
		return mybatis.selectList("user.getMyPartnerList", vo);
	}
	public List<JoinerVO> getMyJoinerList(JoinerVO vo)  {
		return mybatis.selectList("user.getMyJoinerList", vo);
	}
	
	public List<UserVO> getMyLikedList(UserVO vo)  {
		return mybatis.selectList("user.getMyLikedList", vo);
	}
	public List<UserVO> getMyULikeList(UserVO vo)  {
		return mybatis.selectList("user.getMyULikeList", vo);
	}
	
	public List<ProductVO> getMyProductList(ProductVO vo)  {
		return mybatis.selectList("user.getMyProductList", vo);
	}
	public List<UserVO> getMyOrderList(UserVO vo)  {
		return mybatis.selectList("user.getMyOrderList", vo);
	}
	public List<UserVO> getMyReviewList(UserVO vo)  {
		return mybatis.selectList("user.getMyReviewList", vo);
	}
}
