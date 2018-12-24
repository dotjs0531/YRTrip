package com.yrtrip.app.like.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.like.LikeVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;

@Repository
public class LikeDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//등록
	public void insertLike(LikeVO vo) {
		mybatis.update("like.insertLike", vo);
	}
	//삭제
	public void deleteLike(LikeVO vo) {
		mybatis.update("like.deleteLike", vo);
	}
	
	//좋아요 여부 조회
	public int getLike(LikeVO vo) {
		return mybatis.selectOne("like.getLike", vo);
	}
	//전체조회
	public List<LikeVO> getLikeList(LikeVO vo) {
		return mybatis.selectList("like.getLikeList", vo);
	}

	//좋아요 개수 증가
	public void plusTLikeCnt(LikeVO vo) {
		mybatis.update("like.plusTLikeCnt", vo);
	}
	public void plusPLikeCnt(LikeVO vo) {
		mybatis.update("like.plusPLikeCnt", vo);
	}
	public void plusILikeCnt(LikeVO vo) {
		mybatis.update("like.plusILikeCnt", vo);
	}
	
	//좋아요 개수 감소
	public void minusTLikeCnt(LikeVO vo) {
		mybatis.update("like.minusTLikeCnt", vo);
	}
	public void minusPLikeCnt(LikeVO vo) {
		mybatis.update("like.minusPLikeCnt", vo);
	}
	public void minusILikeCnt(LikeVO vo) {
		mybatis.update("like.minusILikeCnt", vo);
	}
}
